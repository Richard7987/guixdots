;;; librepods.scm --- control de AirPods (Rust/iced/wgpu), compilado de fuente
;;;
;;; Traducción de /nixdots/pkgs/librepods.nix. Cargo.toml real fetched en vivo
;;; (2026-07-31) desde la rama linux/rust sin mergear (kavishdevar/librepods,
;;; commit 672e65ad36eebf21ff1c1a508066f9197ee56d17, PR #241): 18 dependencias
;;; directas (tokio, bluer, iced 0.14 con features tokio+image, dbus,
;;; libpulse-binding, ksni, image/imageproc/ab_glyph, clap, serde...).
;;;
;;; Las 576 fuentes de crates.io (`guix import crate --lockfile=Cargo.lock
;;; librepods`, corrido en vivo dentro de la VM, 2026-08-01) viven en
;;; rust-crates.scm de este mismo canal, no acá -- 576 `crate-source` +
;;; una tabla `define-cargo-inputs` (convención moderna de Guix,
;;; `#:cargo-inputs` está deprecado, ver guix/build-system/cargo.scm).
;;;
;;; RUNTIME (esto sí se resuelve acá, es independiente del árbol de crates):
;;; iced/wgpu cargan Vulkan/Wayland/libxkbcommon vía dlopen en tiempo de
;;; ejecución, no en link-time -- la fase 'validate-runpath' de Guix (que
;;; sí detecta y falla automáticamente sobre libs de LINK-time faltantes,
;;; a diferencia de lo que dice el nombre "auto", no hace nada por dlopen)
;;; no los agarra. autoPatchelfHook (Nix) hacía este trabajo con detección
;;; automática; acá no hay equivalente -- se resuelve con wrap-program
;;; manual, misma lista de libs que runtimeDependencies en librepods.nix.

(define-module (ale packages librepods)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix gexp)
  #:use-module (ale packages rust-crates)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages glib) ; dbus
  #:use-module (gnu packages freedesktop) ; wayland
  #:use-module (gnu packages xdisorg) ; libxkbcommon
  #:use-module (gnu packages vulkan) ; vulkan-loader
  #:use-module (gnu packages fontutils) ; freetype, fontconfig
  #:use-module (gnu packages pulseaudio))

(define-public librepods
  (package
    (name "librepods")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kavishdevar/librepods")
             (commit "672e65ad36eebf21ff1c1a508066f9197ee56d17"))) ; rama linux/rust, PR #241 sin mergear -- mismo pin que en Nix
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0h8w9kpigzwc1r9sxrnhbj2lwkyw1sr3i3ssnlp9idl13ay1iqhj"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'enter-subdirectory
            (lambda _
              ;; sourceRoot = "${src.name}/linux-rust" en la derivación Nix original
              (chdir "linux-rust")))
          (add-after 'unpack 'silence-unknown-control-command-log
            ;; mismo parche que postPatch en librepods.nix: 0x3e es un byte
            ;; del protocolo propietario AACP de Apple sin mapear -- baja el
            ;; nivel de log de error! a debug!, inofensivo.
            (lambda _
              (substitute* "src/bluetooth/aacp.rs"
                (("error!\\(") "debug!("))))
          (add-after 'install 'wrap-runtime-libs
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/librepods")))
                (wrap-program bin
                  `("LD_LIBRARY_PATH" ":" prefix
                    ,(map (lambda (p) (string-append p "/lib"))
                          (list #$vulkan-loader
                                #$wayland
                                #$libxkbcommon))))))))))
    (native-inputs (list pkg-config))
    ;; cargo-inputs: convención moderna (no #:cargo-inputs, deprecado) --
    ;; el lookup de 'librepods vive en rust-crates.scm de este canal.
    (inputs
     (append (cargo-inputs 'librepods #:module '(ale packages rust-crates))
             (list dbus pulseaudio fontconfig freetype)))
    (home-page "https://github.com/kavishdevar/librepods")
    (synopsis "Control de AirPods (ruido, batería, etc.) en Linux")
    (description "LibrePods controla AirPods desde Linux: cancelación de
ruido, nivel de batería, y (vía el fix de AVRCP en la config de sistema)
controles de reproducción multimedia.")
    (license license:agpl3)))
