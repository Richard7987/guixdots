;;; nezzontli-ctl.scm --- TUI para nezzontli.xyz, y sus 3 deps que faltan en Guix
;;;
;;; Traducción de /nixdots (nezzontli-ctl vía inputs.nezzontli-ctl, flake propio de
;;; Richard7987/nezzontli-ctl). Confirmado real (no privado) y su pyproject.toml
;;; fetched en vivo (2026-07-31):
;;;
;;;   dependencies = [ "textual>=0.80" "pyfiglet>=1.0" "cowsay>=6.1"
;;;                     "textual-image>=0.8" "matplotlib>=3.8" "flatlatex>=0.15" ]
;;;   build-system = hatchling
;;;   entry point: ctl = "nezzontli_ctl.app:main"
;;;
;;; De esas 6, python-textual, python-pyfiglet y python-matplotlib YA existen en
;;; el canal oficial `guix` (confirmado vía toys.whereis.social 2026-07-31:
;;; python-textual 7.4.0, python-pyfiglet 1.0.4, python-matplotlib 3.10.8) --
;;; NO hace falta redefinirlos acá, alcanza con tenerlos en el manifest/config.scm.
;;; Faltan: python-cowsay, python-textual-image, python-flatlatex (ninguno
;;; encontrado en ningún canal indexado) -- empaquetados acá desde cero.
;;;
;;; Hashes verificados en vivo con `guix download`/`guix hash -rx` dentro de
;;; una VM Guix 1.5.0 real (2026-08-01, guix acf3d19).

(define-module (ale packages nezzontli-ctl)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages check))

;; --- python-cowsay ---
;; Sin sdist en PyPI (solo wheel) -- se toma la fuente de GitHub, tag v6.1.
(define-public python-cowsay
  (package
    (name "python-cowsay")
    (version "6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/VaasuDevanS/cowsay-python")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1qaawnckyy1d9ql17d72rl5fn7q5bx18jf78k4ljd9bl7hg6714m"))))
    (build-system pyproject-build-system)
    ;; backend detectado en build real (2026-08-01): setuptools.build_meta
    (native-inputs (list python-setuptools python-wheel python-pytest python-coverage))
    (arguments (list #:tests? #f)) ; pytest+coverage alcanzan pero no hace falta correrlos para un TUI wrapper chico
    (home-page "https://github.com/VaasuDevanS/cowsay-python")
    (synopsis "Cowsay para Python")
    (description "Implementación en Python del clásico @command{cowsay}.")
    (license license:gpl3)))

;; --- python-flatlatex ---
;; Convierte LaTeX matemático a texto unicode -- usado por nezzontli-ctl para
;; previsualizar fórmulas en la TUI sin renderizar imágenes.
(define-public python-flatlatex
  (package
    (name "python-flatlatex")
    (version "0.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/33/7e/"
                            "31f7ea4843fa7ed12c46a4e96e2d425b873f4bdb90463e32a0c9f163a3ec/"
                            "flatlatex-" version ".tar.gz"))
       (sha256
        (base32
         "0ffiwhjb0axfyy4jlskgqhxlhc47nqa0nc7zpnym5jzwsjyf2w2i"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-regex))
    ;; backend detectado en build real (2026-08-01): setuptools.build_meta,
    ;; sin declararlo el build falla con "ModuleNotFoundError: setuptools".
    (native-inputs (list python-setuptools python-wheel python-pytest))
    (home-page "https://github.com/rtmigo/flatlatex")
    (synopsis "Convierte LaTeX matemático a texto unicode plano")
    (description "@code{flatlatex} traduce expresiones LaTeX matemáticas a su
representación equivalente en texto unicode (sin renderizar imágenes).")
    (license license:bsd-2)))

;; --- python-textual-image ---
;; Renderiza imágenes en terminal vía el protocolo de gráficos de Kitty,
;; integrado con Rich/Textual -- lo mismo que usa `slides` (ver
;; pkgs paquete "slides" en este mismo canal) pero como widget embebible.
(define-public python-textual-image
  (package
    (name "python-textual-image")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/10/77/"
                            "b2128ced69556bfbb8e1c19d8f013e621cf12531eaba4e9b09e1cfa81e37/"
                            "textual_image-" version ".tar.gz"))
       (sha256
        (base32
         "1vj31svjq85wyaf0v0r8brs7pdr6l9nr788nbgg38xydpzicx84c"))))
    (build-system pyproject-build-system)
    ;; backend detectado en build real (2026-08-01): hatchling.build
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-pillow python-rich python-textual))
    (arguments (list #:tests? #f)) ; pide pytest (no declarado, no hace falta para un widget usado como dependencia)
    (home-page "https://github.com/lnqs/textual-image")
    (synopsis "Renderiza imágenes en terminal (Kitty Graphics Protocol) para Rich/Textual")
    (description "Widget de Textual/Rich para mostrar imágenes rasterizadas en
terminales compatibles con el protocolo de gráficos de Kitty (o sixel/half-block
como fallback).")
    (license license:expat)))

;; --- nezzontli-ctl ---
(define-public nezzontli-ctl
  (package
    (name "nezzontli-ctl")
    (version "0.1.0-1.97b83a8") ; pineado a HEAD de main al momento de escribir esto -- sin releases/tags en el repo
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Richard7987/nezzontli-ctl")
             (commit "97b83a82103197915fefaa3b0daf649f14f57280")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1l72i4c7x8m1wd0cgp5qb87ycphncq2b605fg9kc7nsij9ix16sb"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-hatchling)) ; backend real detectado en build (2026-08-01)
    (propagated-inputs
     (list python-textual
           python-pyfiglet
           python-cowsay
           python-textual-image
           python-matplotlib
           python-flatlatex))
    (arguments (list #:tests? #f)) ; sin suite de tests empaquetada, igual que en la derivación Nix original
    (home-page "https://github.com/Richard7987/nezzontli-ctl")
    (synopsis "TUI para crear/editar contenido de nezzontli.xyz")
    (description "Herramienta de terminal (Textual) para crear y editar posts,
páginas y álbumes de fotos de nezzontli.xyz sin depender de un CMS externo.
Instala el comando @command{ctl}. Por default apunta a @file{~/projects/website};
configurable con la variable de entorno @env{NEZZONTLI_REPO_PATH}.")
    (license license:expat))) ; AJUSTAR: confirmar licencia real del repo (no verificada en esta ronda)
