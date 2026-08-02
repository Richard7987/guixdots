;;; clamui.scm --- GUI GTK4/libadwaita para ClamAV
;;;
;;; Traducción directa de /nixdots/pkgs/clamui.nix (buildPythonApplication +
;;; hatchling -> pyproject-build-system + glib-or-gtk-build-system en Guix).
;;; Todas las dependencias Python confirmadas en el canal OFICIAL `guix`
;;; (2026-07-31, vía toys.whereis.social): python-pygobject 3.54.3,
;;; python-pycairo 1.28.0, python-psutil 7.2.2, python-keyring 25.7.0,
;;; python-pillow 12.1.1, python-cairosvg 2.8.2, python-hatchling 1.27.0,
;;; gtk (=GTK4 en Guix, 4.22.1), libadwaita 1.8.2 -- ninguna dependencia
;;; faltante, a diferencia de LibrePods/slides/psysonic. Este es el caso más
;;; mecánico de los 5.
;;;
;;; glib-or-gtk-build-system es el equivalente de Guix a wrapGAppsHook4 de
;;; nixpkgs (wrappea GSettings schemas, ícono cache, etc. automáticamente
;;; tras el install de pyproject-build-system) -- por eso se combina build con
;;; una fase custom en vez de un build-system Python puro.
;;;
;;; python-requests, python-urllib3, python-certifi son parte del set base de
;;; Python en Guix (dependencias de pip mismo) -- no hace falta declararlas
;;; explícitas como propagated si python-requests ya las trae, pero se listan
;;; igual por claridad y paridad con la derivación Nix original.

(define-module (ale packages clamui)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages gstreamer))

(define-public clamui
  (package
    (name "clamui")
    (version "0.3.0") ; mismo tag que en pkgs/clamui.nix -- pineado, no master
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/linx-systems/clamui")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1nah7sy81igrz85jgp41y1zvwgn26axyy3gnqimhbmwsjhd6wfwd"))))
    ;; glib-or-gtk-build-system envuelve pyproject-build-system + las fases
    ;; extra de glib-compile-schemas/gtk-icon-cache (equivalente combinado a
    ;; buildPythonApplication + wrapGAppsHook4 en la derivación Nix original).
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f ; mismo motivo que en Nix: tests viven en tests/ pero requieren un display GTK real, se corren upstream vía pytest, no acá
      #:phases
      #~(modify-phases %standard-phases
          ;; pyproject.toml pinea 8 de sus 10 deps a versiones más nuevas que
          ;; las empaquetadas en Guix (confirmado build real, 2026-08-01:
          ;; sanity-check falla en cadena por ContextualVersionConflict, una
          ;; dependencia a la vez) -- relaja esos mínimos, misma idea que
          ;; pythonRelaxDepsHook en nixpkgs. Son pines preventivos de
          ;; upstream, no por uso real de API nueva -- las versiones de Guix
          ;; (confirmadas contra `guix show` en vivo) funcionan igual.
          ;; psutil>=7.2.2 y keyring>=25.7.0 SÍ coinciden exacto con Guix --
          ;; no hace falta tocarlas.
          (add-after 'unpack 'relax-version-pins
            (lambda _
              (substitute* "pyproject.toml"
                (("PyGObject>=3\\.56\\.3") "PyGObject")
                (("pycairo>=1\\.29\\.0") "pycairo")
                (("matplotlib>=3\\.11\\.0") "matplotlib")
                (("requests>=2\\.34\\.2") "requests")
                (("urllib3>=2\\.7\\.0") "urllib3")
                (("certifi>=2026\\.6\\.17") "certifi")
                (("Pillow>=12\\.2\\.0") "Pillow")
                (("cairosvg>=2\\.9\\.0") "cairosvg"))))
          ;; Iconos + .desktop + metainfo viven fuera del paquete Python
          ;; (data/ e icons/ en la raíz del repo) -- mismo postInstall que en
          ;; pkgs/clamui.nix.
          (add-after 'install 'install-desktop-files
            (lambda _
              (install-file "icons/io.github.linx_systems.ClamUI.svg"
                             (string-append #$output
                                            "/share/icons/hicolor/scalable/apps"))
              (install-file "data/io.github.linx_systems.ClamUI.desktop"
                             (string-append #$output "/share/applications"))
              (install-file "data/io.github.linx_systems.ClamUI.metainfo.xml"
                             (string-append #$output "/share/metainfo")))))))
    (native-inputs
     (list python-hatchling
           gobject-introspection))
    (inputs
     (list gtk         ; GTK4 en Guix
           libadwaita))
    (propagated-inputs
     (list python-pygobject
           python-pycairo
           python-psutil
           python-matplotlib
           python-requests
           python-urllib3
           python-certifi
           python-keyring
           python-pillow
           python-cairosvg))
    (home-page "https://github.com/linx-systems/clamui")
    (synopsis "Interfaz gráfica GTK4/libadwaita para el antivirus ClamAV")
    (description "ClamUI ofrece una interfaz gráfica moderna sobre
@command{clamscan} (parte de ClamAV, que debe instalarse aparte a nivel de
sistema -- ClamUI lo invoca como subproceso vía $PATH, no lo empaqueta).")
    (license license:expat)))
