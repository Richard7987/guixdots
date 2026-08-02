;;; tailscale.scm --- Tailscale + exit-node de Mullvad fijado al arrancar
;;;
;;; Traducción de /nixdots/modules/tailscale.nix.
;;;
;;; SIN VALIDAR CONTRA GUIX REAL (a diferencia de graphics/desktop/yubikey.scm
;;; de este mismo canal) -- se agotó el tiempo de esta sesión antes de poder
;;; correr `guix pull` con el canal Rosenthal agregado (es grande, no se
;;; alcanzó a bajar) y probar esto en la VM. Documentado con la mejor
;;; información de la investigación previa (ver NOTES.md), pero hay que
;;; confirmarlo con un build real antes de confiar en que compila.
;;;
;;; `tailscale-service-type` no existe en el canal oficial `guix` -- viene
;;; de Rosenthal (`(rosenthal services networking)`, ver channels.scm),
;;; confirmado con uso real de producción reportado por otro usuario en
;;; el foro de System Crafters. El oneshot de reintentos para fijar el
;;; exit-node (equivalente al `systemd.services.tailscale-exit-node` de
;;; NixOS) no tiene helper en Rosenthal -- se escribe a mano como
;;; shepherd-service acá, siguiendo el patrón real de Guix (gexp con
;;; `start`/`stop`, ver guix/scripts/system.scm y ejemplos de
;;; nongnu/services/nvidia.scm en este mismo repo de investigación).
;;;
;;; sudoers NOPASSWD para `tailscale` ya está en yubikey.scm (ale/services/
;;; yubikey.scm, %ale-sudoers-file) -- mismo archivo único, Guix no separa
;;; reglas sudoers por módulo como sí permite `security.sudo.extraRules`
;;; en NixOS.

(define-module (ale services tailscale)
  #:use-module (gnu)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module ((rosenthal services networking) #:prefix rosenthal:)
  #:use-module ((rosenthal packages networking) #:prefix rosenthal:)
  #:export (%ale-tailscale-services))

(define %ale-tailscale-exit-node-shepherd-service
  (shepherd-service
   (documentation "Fija el exit-node de Mullvad en Tailscale, con reintentos.")
   (provision '(tailscale-exit-node))
   (requirement '(tailscaled networking))
   (one-shot? #t) ; AJUSTAR: confirmar que este campo existe en la versión de Shepherd real -- si no, usar el patrón start/stop clásico devolviendo #t
   (start
    #~(lambda _
        (let loop ((attempts 0))
          (if (zero? (system* #$(file-append rosenthal:tailscale "/bin/tailscale")
                              "set" "--exit-node=mullvad-exit"
                              "--exit-node-allow-lan-access=true"))
              #t
              (if (>= attempts 10)
                  #f
                  (begin (sleep 2) (loop (1+ attempts))))))))))

(define %ale-tailscale-services
  (list (service rosenthal:tailscale-service-type)
        (simple-service 'tailscale-exit-node shepherd-root-service-type
                        (list %ale-tailscale-exit-node-shepherd-service))))
