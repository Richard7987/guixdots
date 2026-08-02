;;; slides.scm --- presentador de terminal, fork personal de maaslalani/slides
;;;
;;; Traducción de /nixdots (inputs.slides -> Richard7987/slide, flake propio).
;;; go.mod real: módulo `github.com/maaslalani/slides`, go 1.25.9.
;;;
;;; Depende del ecosistema NUEVO `charm.land/*/v2` (bubbletea/lipgloss/
;;; bubbles/wish/log), un dominio de módulo Go distinto al viejo
;;; `github.com/charmbracelet/*` que sí tiene Guix oficial (versiones v1,
;;; incompatibles). Las 535 definiciones que faltaban (árbol completo de
;;; las 8 dependencias directas con versión más nueva que la oficial, más
;;; sus transitivas) viven en go-crates-slides.scm de este mismo canal,
;;; generadas en vivo con `guix import go -r --pin-versions` (2026-08-01).
;;; stretchr/testify y gopkg.in/yaml.v2 ya estaban en el canal oficial con
;;; la versión exacta -- vienen de (gnu packages golang-check)/
;;; (gnu packages golang-xyz), no de go-crates-slides.scm.

(define-module (ale packages slides)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system go)
  #:use-module (ale packages go-crates-slides)
  #:use-module (gnu packages golang-check) ; go-github-com-stretchr-testify
  #:use-module (gnu packages golang-xyz)   ; go-gopkg-in-yaml-v2
  #:use-module (gnu packages rust-apps)    ; tectonic
  #:use-module (gnu packages ghostscript))

(define-public slides
  (package
    (name "slides")
    (version "0.0.0-1.fc21959") ; pineado a HEAD del fork al momento de escribir esto -- sin releases/tags
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Richard7987/slide")
             (commit "fc21959a0c4481b5f9725702e9e24df6458a7c46")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0p0aqayzaihifmn4n199ra25k5s72d19jn97nbzwdf0xgl7lg8qz"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/maaslalani/slides" ; module path real del go.mod, distinto del repo path
           #:install-source? #f))
    (inputs
     (list go-charm-land-bubbletea-2.0.8
           go-charm-land-lipgloss-2.0.5
           go-charm-land-bubbles-2.1.1
           go-charm-land-wish-2.0.1
           go-charm-land-log-2.0.0
           go-github-com-atotto-clipboard-0.1.4
           go-github-com-charmbracelet-glamour-1.0.0
           go-github-com-charmbracelet-ssh-0.0.0-20250826160808-ebfa259c7309
           go-github-com-charmbracelet-x-ansi-0.11.7
           go-github-com-muesli-coral-1.0.0
           go-github-com-muesli-termenv-0.16.0
           go-github-com-stretchr-testify
           go-gopkg-in-yaml-v2))
    ;; Runtime deps NO-Go, para el pipeline LaTeX->PNG en fórmulas de las
    ;; slides (mismo motivo que en pkgs/slides.nix: tectonic + ghostscript).
    (propagated-inputs (list tectonic ghostscript))
    (home-page "https://github.com/Richard7987/slide")
    (synopsis "Presentador de terminal con soporte LaTeX/imágenes/bibliografía")
    (description "Fork personal de @code{maaslalani/slides} (presentador de
Markdown en terminal) con renderizado de fórmulas LaTeX e imágenes reales vía
el protocolo de gráficos de Kitty.")
    (license license:expat)))
