;;; slides.scm --- presentador de terminal, fork personal de maaslalani/slides
;;;
;;; Traducción de /nixdots (inputs.slides -> Richard7987/slide, flake propio).
;;; go.mod real fetched en vivo (2026-07-31): módulo `github.com/maaslalani/slides`,
;;; go 1.25.9.
;;;
;;; HALLAZGO IMPORTANTE (no anticipado en la evaluación general previa): este
;;; fork depende del ecosistema NUEVO `charm.land/*/v2` (bubbletea/v2 v2.0.8,
;;; lipgloss/v2 v2.0.5, bubbles/v2 v2.1.1, wish/v2 v2.0.1, log/v2 v2.0.0) --
;;; una reescritura bajo un dominio de módulo Go distinto al viejo
;;; `github.com/charmbracelet/*`. Confirmado que Guix (canal oficial) SOLO
;;; tiene las versiones v1 viejas (go-github-com-charmbracelet-bubbletea
;;; 1.3.10, -lipgloss 1.1.0, -bubbles 0.21.1, -glamour 0.10.0) -- son módulos
;;; Go con paths distintos, no intercambiables ni compatibles en build.
;;;
;;; Ninguna de las ~40 dependencias transitivas del árbol v2
;;; (charm.land/bubbletea/v2, .../lipgloss/v2, .../bubbles/v2, .../wish/v2,
;;; .../log/v2, github.com/charmbracelet/ssh, github.com/charmbracelet/
;;; ultraviolet, github.com/charmbracelet/x/ansi 0.11.7, etc.) está empaquetada
;;; en ningún canal Guix indexado (verificado 2026-07-31).
;;;
;;; CAMINO REAL (no hecho acá -- requiere Guix instalado, esta sesión corre en
;;; NixOS sin Guix): Guix SÍ tiene un importador recursivo para Go, análogo a
;;; `guix import crate` para Rust:
;;;
;;;   guix import go -r --pin-versions charm.land/bubbletea/v2@v2.0.8
;;;   guix import go -r --pin-versions charm.land/lipgloss/v2@v2.0.5
;;;   guix import go -r --pin-versions charm.land/bubbles/v2@v2.1.1
;;;   guix import go -r --pin-versions charm.land/wish/v2@v2.0.1
;;;   guix import go -r --pin-versions charm.land/log/v2@v2.0.0
;;;   guix import go -r --pin-versions github.com/charmbracelet/ssh@<rev del go.mod>
;;;
;;; --pin-versions es necesario (no el default de "última versión") porque el
;;; go.mod real fija revisiones/pseudo-versiones específicas, algunas
;;; ("github.com/charmbracelet/ultraviolet@v0.0.0-20260703...") sin tag
;;; publicado. Cada corrida genera un .scm con los stubs de paquete -- hay que
;;; revisarlos (Guix es estricto con "no vendorizar", puede marcar TODOs) y
;;; pegarlos en un módulo de este canal antes de que esto compile de verdad.
;;; Esto es TRABAJO REAL PENDIENTE, no completado en esta ronda -- se estimó
;;; inicialmente como "trivial-moderado" en una evaluación general sin ver el
;;; go.mod real; con los datos reales a la vista, es más bien "moderado",
;;; automatizable pero no mecánico de una sola pasada.

(define-module (ale packages slides)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system go)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages tex) ; tectonic
  #:use-module (gnu packages ghostscript))

(define-public slides
  (package
    (name "slides")
    (version "0.0.0") ; AJUSTAR: pinear a un commit/tag real del fork, no "main"
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Richard7987/slide")
             (commit "main"))) ; AJUSTAR: mismo comentario que nezzontli-ctl -- pinear de verdad
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0000000000000000000000000000000000000000000000000000")))) ; AJUSTAR
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/maaslalani/slides" ; el module path real del go.mod, no el repo path -- distintos
           #:install-source? #f))
    ;; PENDIENTE: llenar con los paquetes go-charm-land-bubbletea-v2 etc. que
    ;; generen los `guix import go -r` de arriba, una vez corridos en Guix real.
    ;; Placeholder con lo YA disponible en el canal oficial (aunque sean v1 y
    ;; no resuelvan el build hasta que el árbol v2 esté completo):
    (inputs
     (list go-github-com-charmbracelet-bubbletea    ; v1.3.10 en Guix -- NO satisface el import v2, dejar hasta tener el árbol v2 real
           go-github-com-charmbracelet-lipgloss      ; ídem
           go-github-com-charmbracelet-glamour       ; ídem
           go-github-com-atotto-clipboard
           go-gopkg-in-yaml-v2))
    ;; Runtime deps NO-Go, para el pipeline LaTeX->PNG en fórmulas de las slides
    ;; (mismo motivo que en pkgs original: tectonic + ghostscript). Ambos SÍ
    ;; confirmados en el canal oficial guix.
    (propagated-inputs (list tectonic ghostscript))
    (home-page "https://github.com/Richard7987/slide")
    (synopsis "Presentador de terminal con soporte LaTeX/imágenes/bibliografía")
    (description "Fork personal de @code{maaslalani/slides} (presentador de
Markdown en terminal) con renderizado de fórmulas LaTeX e imágenes reales vía
el protocolo de gráficos de Kitty.")
    (license license:expat))) ; AJUSTAR: confirmar licencia real del fork
