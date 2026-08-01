;;; desktop.scm --- Hyprland, greetd, Bluetooth, sesión gráfica
;;;
;;; Traducción de /nixdots/modules/desktop.nix. Diferencias reales:
;;;
;;; - Sin Noctalia ni noctalia-greeter: decisión tomada tras investigar
;;;   (ver NOTES.md) -- Noctalia solo viable vía canal de terceros
;;;   rolling-release, y noctalia-greeter no existe empaquetado en
;;;   absoluto. Reemplazo: greetd + agreety (login de texto plano,
;;;   sin tema compartido -- la alternativa "bonita" con tuigreet quedó
;;;   pendiente de integrar, ver comentario abajo) lanzando Hyprland
;;;   directo. DankMaterialShell (sobre Quickshell oficial de Guix)
;;;   reemplaza al shell de Noctalia -- instalación manual, ver
;;;   home-configuration.scm y PENDIENTES.md.
;;; - Sin pipewire/wireplumber acá: Guix NO tiene servicio de *sistema*
;;;   para pipewire (confirmado, no existe `pipewire-service-type` en
;;;   ningún módulo de gnu/services) -- solo existe como servicio de
;;;   *Guix Home* (`home-pipewire-service-type`). Va en
;;;   home-configuration.scm, no acá.
;;; - elogind + seatd + polkit + dbus explícitos: NixOS los trae gratis
;;;   vía `services.xserver`/`programs.hyprland.enable`; acá no hay
;;;   equivalente automático, hace falta declararlos a mano para que
;;;   greetd + un compositor Wayland puedan gestionar sesión/asientos.

(define-module (ale services desktop)
  #:use-module (gnu)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services desktop)
  #:use-module (gnu services dbus)
  #:use-module (gnu services pm)
  #:use-module (gnu services xorg) ; screen-locker-service-type si hace falta
  #:use-module (gnu packages wm) ; hyprland
  #:use-module (gnu packages freedesktop) ; xdg-desktop-portal-hyprland
  #:use-module (gnu packages gnome) ; nautilus, gvfs
  #:use-module (gnu packages file-systems) ; yazi
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages kde-frameworks) ; kleopatra, plasma-integration, breeze
  #:use-module (gnu packages kde)
  #:export (%ale-desktop-services
            %ale-desktop-packages))

(define %ale-greetd-config
  (greetd-terminal-configuration
   (default-session-command
    (greetd-agreety-session
     (command (greetd-user-session
               (command (file-append hyprland "/bin/Hyprland"))))))))
  ;; PENDIENTE: reemplazar agreety por tuigreet (más parecido visualmente a
  ;; lo que tenías con noctalia-greeter) -- Guix no trae un helper
  ;; `greetd-tuigreet-session` armado como sí tiene para agreety/wlgreet/
  ;; gtkgreet-sway, hay que construirlo a mano extendiendo el patrón de
  ;; greetd-agreety-session. No bloqueante: agreety funciona, solo es feo.

(define %ale-desktop-services
  (list (service greetd-service-type
                 (greetd-configuration
                  (terminals (list %ale-greetd-config))))
        (service elogind-service-type)
        (service polkit-service-type)
        (service dbus-root-service-type)
        (service bluetooth-service-type
                 (bluetooth-configuration (auto-enable? #t)))
        (service gnome-keyring-service-type) ; secret service -- credenciales de DMS/CalDAV/etc, mismo motivo que en desktop.nix
        (service power-profiles-daemon-service-type)
        (service upower-service-type)
        (service polkit-wheel-service))) ; agentes gráficos de polkit corriendo como wheel puedan autorizar

(define %ale-desktop-packages
  (list hyprland
        xdg-desktop-portal-hyprland
        nautilus
        gvfs
        yazi
        kleopatra
        breeze
        plasma-integration
        font-google-noto
        font-google-noto-emoji
        font-jetbrains-mono))
