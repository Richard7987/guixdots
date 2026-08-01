;;; yubikey.scm --- pcscd (smartcard) + sudoers
;;;
;;; Traducción de /nixdots/modules/yubikey.nix. Diferencia real: Guix no
;;; tiene equivalente a `security.sudo.extraRules` (reglas por-comando
;;; declarativas) -- `sudoers-file` recibe el contenido CRUDO y completo de
;;; /etc/sudoers como un file-like object, hay que escribir la sintaxis
;;; sudoers a mano (confirmado contra el manual, operating-system
;;; Reference). Rutas absolutas, mismo motivo que en la config Nix
;;; original: sudoers resuelve por ruta, no por $PATH.

(define-module (ale services yubikey)
  #:use-module (gnu)
  #:use-module (gnu services)
  #:use-module (gnu services security-token)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages gnupg)
  #:export (%ale-yubikey-services
            %ale-yubikey-packages
            %ale-sudoers-file))

(define %ale-yubikey-services
  (list (service pcscd-service-type)))

(define %ale-yubikey-packages
  (list yubikey-personalization
        python-yubikey-manager ; ykman
        gnupg))

;; AJUSTAR las rutas /run/current-system/profile/bin/{systemctl,tailscale}
;; una vez confirmadas en la instalación real -- Guix no usa systemctl
;; (Shepherd, no systemd), así que "reiniciar pcscd" en la función `yubico`
;; de zsh (ver home-configuration.scm) usa `herd restart pcscd` en vez de
;; `systemctl restart pcscd.service`. sudo necesita la ruta absoluta real
;; de `herd` y `tailscale` en el store -- confirmar con `guix build herd`/
;; `which herd` en el sistema real, esto es un placeholder razonable.
(define %ale-sudoers-file
  (plain-file "sudoers" "\
root ALL=(ALL) ALL
%wheel ALL=(ALL) ALL
ale ALL=(ALL) NOPASSWD: /run/current-system/profile/bin/herd restart pcscd
ale ALL=(ALL) NOPASSWD: /run/current-system/profile/bin/tailscale
"))
