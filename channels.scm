;;; channels.scm --- lista de canales para reproducir este sistema
;;;
;;; Uso (equivalente a `nix flake update`+pin del flake.lock de /nixdots):
;;;   guix pull -C channels.scm
;;;
;;; nonguix: driver propietario de Nvidia (nvidia-driver-580, rama legacy
;;; para Pascal), Steam, firmware no libre. Introducción copiada tal cual
;;; del README oficial de nonguix (gitlab.com/nonguix/nonguix) para que
;;; `guix pull` pueda verificar la firma del canal desde el primer commit.
;;;
;;; guixdots: este mismo canal (paquetes personales -- LibrePods, ClamUI,
;;; slides, nezzontli-ctl -- ver ale/packages/*.scm). URL del espejo
;;; PÚBLICO de GitHub, no el Forgejo real (Tailscale-only) -- mismo
;;; bootstrap que /nixdots (ver su README, "Bootstrap en una PC nueva"):
;;; una PC recién instalada no tiene Tailscale andando todavía, así que
;;; hace falta el espejo sin autenticación primero. El Forgejo real
;;; actualiza este espejo solo -- no hace falta pushear ahí a mano.
;;; Introduction: primer commit real de este canal, firmado con la misma
;;; llave GPG que firma todo en /nixdots.

;; Rosenthal: canal grande y activo (codeberg.org/hako/rosenthal, 1256+
;;; commits, confirmado en uso real de producción por otro usuario --
;;; ver NOTES.md) -- de acá sale `tailscale-service-type`, ausente en el
;;; canal oficial `guix`. También es donde vive el canal propio de
;;; Noctalia (noctalia.scm, no usado en esta config -- se optó por
;;; DankMaterialShell), por si algún día se reconsidera.
(cons* (channel
        (name 'rosenthal)
        (url "https://codeberg.org/hako/rosenthal")
        ;; Sin introduction: no se pudo confirmar el commit+fingerprint
        ;; exactos sin acceso a Guix real en esta sesión -- AJUSTAR con
        ;; `guix pull -C channels.scm` real y copiar lo que sugiera, o
        ;; revisar el propio README de Rosenthal para su introduction
        ;; documentada.
        )
       (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (introduction
         (make-channel-introduction
          "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
          (openpgp-fingerprint
           "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
       (channel
        (name 'guixdots)
        (url "https://github.com/Richard7987/guixdots.git")
        (introduction
         (make-channel-introduction
          "846c407395396cb54d4d9e28dbfcc83aeee750fd"
          (openpgp-fingerprint
           "91CA 581F 7B78 01E8 8673  D228 DBD5 F61D 8A0A 14D7"))))
       %default-channels)
