;;; config.scm --- configuración de sistema para la laptop "ale" (Acer Nitro AN515-54)
;;;
;;; Traducción de /nixdots/hosts/ale/configuration.nix + hardware-configuration.nix
;;; a Guix System. Script plano (no módulo) -- convención real de Guix,
;;; confirmada contra /etc/config.scm de la propia imagen VM: `guix system
;;; build config.scm` carga el archivo y evalúa la última expresión como el
;;; `operating-system`, no busca un símbolo exportado. Los módulos auxiliares
;;; (gráficos, escritorio, yubikey, tailscale) sí son módulos Guile reales,
;;; importados acá abajo -- ver ale/services/*.scm.
;;;
;;; Diferencias reales frente a NixOS (no arbitrarias, verificadas contra
;;; Guix real 2026-08-01):
;;;
;;; - Bootloader: GRUB, no systemd-boot -- Guix no lo tiene en absoluto.
;;;   `(keep-old-entries? #t)` es lo más parecido a `configurationLimit`,
;;;   pero no poda por número -- usar `guix system delete-generations` a
;;;   mano.
;;; - AJUSTAR: UUIDs reales de las particiones (placeholders acá, igual que
;;;   el hardware-configuration.nix original antes de la instalación real).
;;; - nixpkgs.config.allowUnfree no tiene equivalente -- lo no-libre viene
;;;   de estar en el canal nonguix (ver channels.scm), no de un flag.
;;; - nix.gc.automatic: sin servicio dedicado -- un mcron job propio hace
;;;   lo mismo (`guix gc --delete-generations=14d` semanal).

(use-modules (gnu)
             (guix gexp)
             (gnu system nss)
             (nongnu packages linux)
             (nongnu system linux-initrd)
             (gnu packages linux)
             (gnu packages certs)
             (gnu packages version-control)
             (gnu packages vim)
             (gnu packages curl)
             (gnu packages wget)
             (gnu services)
             (gnu services base)
             (gnu services networking)
             (gnu services linux)
             (gnu services mcron)
             (ale services graphics)
             (ale services desktop)
             (ale services yubikey)
             (ale services tailscale))

;; --- Filesystems (equivalente a hardware-configuration.nix) ---
;; A diferencia de NixOS (subvolúmenes @, @home, @nix, @log, @snapshots todos
;; montados por separado), acá se colapsan /nix (no existe, Guix usa
;; /gnu/store dentro de @) y /var/log (queda dentro de @) -- solo se
;; preservan los subvolúmenes que tienen sentido real en Guix.
(define %ale-file-systems
  (list (file-system
          (mount-point "/")
          (device (uuid "00000000-0000-0000-0000-000000000000")) ; AJUSTAR
          (type "btrfs")
          (options "subvol=@"))
        (file-system
          (mount-point "/home")
          (device (uuid "00000000-0000-0000-0000-000000000000")) ; AJUSTAR, mismo UUID que "/"
          (type "btrfs")
          (options "subvol=@home"))
        (file-system
          (mount-point "/.snapshots")
          (device (uuid "00000000-0000-0000-0000-000000000000")) ; AJUSTAR, mismo UUID que "/"
          (type "btrfs")
          (options "subvol=@snapshots"))
        (file-system
          (mount-point "/boot/efi")
          (device (uuid "0000-0000" 'fat32)) ; AJUSTAR, UUID real de la partición EFI
          (type "vfat"))))

;; --- zram: mismo motivo que zramSwap.enable en la config Nix original --
;; sin esto, earlyoom (ver desktop.scm) no tiene margen para reclamar
;; memoria a tiempo bajo presión.
(define %zram-service
  (service zram-device-service-type
           (zram-device-configuration
            (size "4G")
            (compression-algorithm 'zstd)
            (priority 100))))

;; --- guix gc semanal, equivalente a nix.gc.automatic + --delete-older-than 14d ---
(define %gc-job
  #~(job "0 4 * * 0" ; domingos 4am
         "guix gc --delete-generations=14d"))

(operating-system
  (host-name "ale")
  (timezone "America/Mexico_City")
  (locale "es_MX.utf8")
  (keyboard-layout (keyboard-layout "us" "altgr-intl"))

  ;; kernel + firmware no libres -- el kernel es el linux normal de nonguix
  ;; (no linux-libre), hace falta para el módulo nvidia y el microcódigo Intel.
  (kernel linux)
  (kernel-arguments (cons* "modprobe.blacklist=nouveau" %default-kernel-arguments))
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  (bootloader (bootloader-configuration
               (bootloader grub-efi-bootloader)
               (targets '("/boot/efi"))
               (keep-old-entries? #t)))

  (file-systems (append %ale-file-systems %base-file-systems))

  (swap-devices '()) ; sin swap en disco -- zram cumple el mismo rol que en /nixdots

  (users (cons (user-account
                (name "ale")
                (comment "ale")
                (group "users")
                (supplementary-groups '("wheel" "netdev" "audio" "video"
                                        "input" "dialout" "lp")))
               %base-user-accounts))

  (packages
   (append (list git vim curl wget nss-certs)
           %ale-graphics-packages
           %ale-desktop-packages
           %ale-yubikey-packages
           %base-packages))

  (services
   (append
    (list %zram-service
          (service network-manager-service-type)
          (service wpa-supplicant-service-type)
          (service ntp-service-type)
          (simple-service 'weekly-gc mcron-service-type (list %gc-job)))
    %ale-graphics-services
    %ale-desktop-services
    %ale-yubikey-services
    %ale-tailscale-services
    %base-services))

  (name-service-switch %mdns-host-lookup-nss)

  (sudoers-file %ale-sudoers-file))
