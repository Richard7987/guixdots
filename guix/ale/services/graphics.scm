;;; graphics.scm --- gráficos duales Intel+Nvidia, Steam, gamemode
;;;
;;; Traducción de /nixdots/modules/graphics.nix. Cambios reales de fondo
;;; (no arbitrarios, ver NOTES.md de este canal para el detalle completo de
;;; la investigación):
;;;
;;; - PRIME *offload*, no *sync*: Guix/nonguix no tienen ningún mecanismo
;;;   declarativo de PRIME sync (solo offload está documentado). Además, se
;;;   confirmó en vivo en el NixOS real de esta laptop que PRIME sync ya es
;;;   un no-op bajo Wayland (la NixOS Wiki lo dice explícito: "PRIME sync
;;;   and reverse sync modes are X11-only") -- `nvidia-smi` mostraba la GPU
;;;   en 0% de uso con la sesión Hyprland (Wayland) corriendo. Offload puro
;;;   NO es downgrade real acá.
;;; - HDMI nativo sin PRIME: confirmado con hardware real (lspci +
;;;   /sys/class/drm) que `HDMI-A-1` está cableado directo a la Nvidia
;;;   (PCI 01:00.0, card0), no pasa por la Intel -- evita el mecanismo de
;;;   "reverse-PRIME" (copia de buffers entre GPUs) que causaba el bug de
;;;   compositor original que motivó elegir sync en NixOS. La variable
;;;   AQ_DRM_DEVICES que declara esto va en la sesión de Hyprland
;;;   (home-configuration.scm / hyprland.lua), no acá -- es una variable de
;;;   sesión de usuario, no de sistema.
;;; - Driver legacy 580 (`nvda`, alias `nvda-580`): es el DEFAULT de
;;;   nvidia-service-type en nonguix -- no hace falta overridearlo, cubre
;;;   Pascal (GTX 1050 de esta laptop) igual que
;;;   nvidiaPackages.legacy_580 en la config Nix original.
;;; - CUDA: NO incluido acá. guix-science-nonfree (canal de terceros
;;;   aparte, codeberg.org/guix-science/guix-science-nonfree) lo provee,
;;;   pero con fricción real documentada (issues de integración con
;;;   PyTorch/JAX) -- agregar ese canal aparte el día que haga falta de
;;;   verdad, no de entrada.

(define-module (ale services graphics)
  #:use-module (gnu)
  #:use-module (gnu services)
  #:use-module (gnu system pam)
  #:use-module (nongnu packages nvidia)
  #:use-module (nongnu services nvidia)
  #:use-module (nongnu packages game-client) ; steam
  #:use-module (gnu packages linux) ; gamemode
  #:use-module (gnu packages gl)    ; mesa-utils (glxinfo)
  #:use-module (gnu packages vulkan)
  #:export (%ale-graphics-services
            %ale-graphics-packages))

;; Variables recomendadas para Nvidia + Wayland/Hyprland en modo offload --
;; equivalente a environment.sessionVariables en modules/graphics.nix, pero
;; a nivel de sistema (PAM /etc/environment) en vez de por sesión gráfica,
;; porque acá no hay un módulo de home-manager tipo Hyprland que las
;; inyecte automáticamente -- Guix Home no tiene ese mecanismo.
(define %ale-graphics-session-environment
  (service session-environment-service-type
           '(("LIBVA_DRIVER_NAME" . "nvidia")
             ("GBM_BACKEND" . "nvidia-drm")
             ("__GLX_VENDOR_LIBRARY_NAME" . "nvidia"))))
             ;; WLR_NO_HARDWARE_CURSORS -- ya no hace falta con Aquamarine
             ;; (backend nuevo de Hyprland moderno, reemplaza el wlroots
             ;; clásico que sí lo necesitaba) -- confirmar en vivo si hay
             ;; glitches de cursor y agregarlo acá si hace falta.

(define %ale-graphics-services
  (list (service nvidia-service-type) ; default: driver nvda (=nvda-580, legacy Pascal)
        %ale-graphics-session-environment))

(define %ale-graphics-packages
  (list gamemode
        mesa-utils  ; glxinfo -- diagnóstico de qué GPU renderiza
        vulkan-tools ; vulkaninfo
        steam        ; nonguix
        nvidia-settings-580)) ; sin alias "nvda-settings" en nonguix -- explícito para que coincida con el driver (nvda = nvda-580)
