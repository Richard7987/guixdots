;;; go-crates-slides.scm --- módulos Go generados por `guix import go -r` para slides
;;;
;;; Generado en vivo (2026-08-01) con `guix import go -r --pin-versions
;;; <módulo>@<versión>` para cada una de las 8 dependencias directas de
;;; slides (fork Richard7987/slide de maaslalani/slides, ver
;;; pkgs/slides.scm) que no ya estaban en el canal oficial `guix` con
;;; la versión exacta que pide su go.mod:
;;;   charm.land/bubbletea/v2@v2.0.8, charm.land/lipgloss/v2@v2.0.5,
;;;   charm.land/bubbles/v2@v2.1.1, charm.land/wish/v2@v2.0.1,
;;;   charm.land/log/v2@v2.0.0, github.com/charmbracelet/glamour@v1.0.0
;;;   (Guix oficial solo tenía 0.10.0), github.com/muesli/termenv@v0.16.0
;;;   (Guix oficial solo tenía 0.15.2), github.com/muesli/coral@v1.0.0
;;;   (no existía en ningún lado).
;;; stretchr/testify (v1.11.1) y gopkg.in/yaml.v2 (v2.4.0) YA estaban
;;; en el canal oficial con la versión exacta -- no se regeneraron
;;; acá, van directo en slides.scm como (gnu packages golang-xyz)/
;;; (gnu packages golang-check).
;;;
;;; Dos módulos (bubbletea/v2, bubbles/v2) fallaron la primera corrida
;;; por un problema real de red del guest (QEMU `-nic user` es solo
;;; IPv4; el resolver intentaba AAAA hacia infra de Google y fallaba
;;; con "Connection refused" en vez de caer a IPv4) -- resuelto con
;;; `sysctl net.ipv6.conf.all.disable_ipv6=1` en el guest y
;;; reintentando. 535 paquetes únicos, sin conflictos de
;;; deduplicación (--pin-versions asegura resultado determinista).
;;; Todo hash real, verificado contra proxy.golang.org por el
;;; importador.
;;;
;;; NO editar a mano -- para regenerar tras un cambio de go.mod,
;;; repetir el proceso de arriba y reemplazar el archivo entero.

(define-module (ale packages go-crates-slides)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system go)
  ;; paquetes go-*-v2 que YA estaban en el canal oficial (el importador
  ;; correctamente no los regeneró) pero cuyos nombres siguen apareciendo
  ;; como referencia en los propagated-inputs de abajo: ginkgo-v2,
  ;; golang-lru-v2/arc-v2, go-osc52-v2, go-md2man-v2, blackfriday-v2,
  ;; alecthomas-assert-v2, gopkg.in/yaml.v2, etc.
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-xyz))

(define-public go-github-com-aymanbagabas-go-udiff-0.4.1
  (package
    (name "go-github-com-aymanbagabas-go-udiff")
    (version "0.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aymanbagabas/go-udiff")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12wddldw2p913zxfjaw71j7wqqbb6ppi6nx8wwxaprnxjxv3kx6z"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/aymanbagabas/go-udiff"))
    (home-page "https://github.com/aymanbagabas/go-udiff")
    (synopsis "µDiff")
    (description
     "Package diff computes differences between text files or strings.")
    (license license:expat)))

(define-public go-github-com-clipperhouse-displaywidth-0.9.0
  (package
    (name "go-github-com-clipperhouse-displaywidth")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/displaywidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03c9qa0q0lfmmmcazipsgbyf9nxvid3jcmz6947dsjd5ha20n94k"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/displaywidth"))
    (propagated-inputs (list go-github-com-clipperhouse-stringish-0.1.1
                             go-github-com-clipperhouse-uax29-2.5.0))
    (home-page "https://github.com/clipperhouse/displaywidth")
    (synopsis "displaywidth")
    (description
     "This package provides a high-performance Go package for measuring the monospace
display width of strings, UTF-8 bytes, and runes.")
    (license license:expat)))

(define-public go-github-com-clipperhouse-uax29-2.5.0
  (package
    (name "go-github-com-clipperhouse-uax29")
    (version "2.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/uax29")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a383vbkm2ggnsi4906hpd0y701f58x7mvanadx1c69l2ipi6z6f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/uax29/v2"
      #:unpack-path "github.com/clipperhouse/uax29"))
    (propagated-inputs (list go-github-com-clipperhouse-stringish-0.1.1))
    (home-page "https://github.com/clipperhouse/uax29")
    (synopsis "Why tokenize?")
    (description
     "Package uax29 provides Unicode text segmentation (UAX #29) for words, sentences
and graphemes.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-ansi-0.11.6
  (package
    (name "go-github-com-charmbracelet-x-ansi")
    (version "0.11.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "ansi"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xkimvzvafr9d8ar7m3kbqwj11bhac36v894jnhkgwp38bvk69wz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/ansi"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-bits-and-blooms-bitset-1.24.4
                             go-github-com-clipperhouse-displaywidth-0.9.0
                             go-github-com-clipperhouse-uax29-2.5.0
                             go-github-com-lucasb-eyer-go-colorful-1.3.0
                             go-github-com-mattn-go-runewidth-0.0.19))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package ansi defines common ANSI escape sequences based on the ECMA-48 specs.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.42.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.42.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0y0blh72pxbvkwaxgn8xnc6bxn8759zarx13ry7kdappj10b0qvb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-charmbracelet-colorprofile-0.4.3
  (package
    (name "go-github-com-charmbracelet-colorprofile")
    (version "0.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/colorprofile")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gwylpqh0cfzz3pc9xf3z95c4dw11n0pbxaq3j0krw805pfz4j18"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/colorprofile"))
    (propagated-inputs (list go-github-com-charmbracelet-x-ansi-0.11.6
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-lucasb-eyer-go-colorful-1.3.0
                        go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
                        go-golang-org-x-sys-0.42.0))
    (home-page "https://github.com/charmbracelet/colorprofile")
    (synopsis "Colorprofile")
    (description
     "Package colorprofile provides a way to downsample ANSI escape sequence colors
and styles automatically based on output, environment variables, and Terminfo
databases.")
    (license license:expat)))

(define-public go-github-com-bits-and-blooms-bitset-1.24.3
  (package
    (name "go-github-com-bits-and-blooms-bitset")
    (version "1.24.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bits-and-blooms/bitset")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fhdi4a3z6ymqyp267pas7g5qi0wl108bpqbxxn5n6x1xnrv7b3n"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/bits-and-blooms/bitset"))
    (home-page "https://github.com/bits-and-blooms/bitset")
    (synopsis "bitset")
    (description
     "Package bitset implements bitsets, a mapping between non-negative integers and
boolean values.  It should be more efficient than map[uint] bool.")
    (license license:bsd-3)))

(define-public go-github-com-clipperhouse-displaywidth-0.4.1
  (package
    (name "go-github-com-clipperhouse-displaywidth")
    (version "0.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/displaywidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sg38fmix5sb8n7bv2cr25im576f0cgv7dxaggji3lcjbakwkqkg"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/displaywidth"))
    (propagated-inputs (list go-github-com-clipperhouse-stringish-0.1.1
                             go-github-com-clipperhouse-uax29-2.3.0))
    (home-page "https://github.com/clipperhouse/displaywidth")
    (synopsis "displaywidth")
    (description
     "This package provides a high-performance Go package for measuring the monospace
display width of strings, UTF-8 bytes, and runes.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-ansi-0.10.3
  (package
    (name "go-github-com-charmbracelet-x-ansi")
    (version "0.10.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "ansi"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pkfy9bi4wcjv34xbhf7qw3sz1g81dy909iq9nwv0yj8fhjns8q1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/ansi"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-bits-and-blooms-bitset-1.24.3
                             go-github-com-clipperhouse-displaywidth-0.4.1
                             go-github-com-clipperhouse-uax29-2.3.0
                             go-github-com-lucasb-eyer-go-colorful-1.3.0
                             go-github-com-mattn-go-runewidth-0.0.19))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package ansi defines common ANSI escape sequences based on the ECMA-48 specs.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.37.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.37.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cjq8n66i9cccigi204mkhqmrb9mdirxjxl0nk7c8s6w70fifbby"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-charmbracelet-colorprofile-0.3.3
  (package
    (name "go-github-com-charmbracelet-colorprofile")
    (version "0.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/colorprofile")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "166bf2hqlb6kgaj2nyxnb2kci2shax4bfj85ii1anyizs08f6rdd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/colorprofile"))
    (propagated-inputs (list go-github-com-charmbracelet-x-ansi-0.10.3
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-lucasb-eyer-go-colorful-1.3.0
                        go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
                        go-golang-org-x-sys-0.37.0))
    (home-page "https://github.com/charmbracelet/colorprofile")
    (synopsis "Colorprofile")
    (description
     "Package colorprofile provides a way to downsample ANSI escape sequence colors
and styles automatically based on output, environment variables, and Terminfo
databases.")
    (license license:expat)))

(define-public go-github-com-clipperhouse-displaywidth-0.6.0
  (package
    (name "go-github-com-clipperhouse-displaywidth")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/displaywidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13i8xqdq1pgid890nn1h6b7mjskd1809401l7rc7g4yhhgh8sbfq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/displaywidth"))
    (propagated-inputs (list go-github-com-clipperhouse-stringish-0.1.1
                             go-github-com-clipperhouse-uax29-2.3.0))
    (home-page "https://github.com/clipperhouse/displaywidth")
    (synopsis "displaywidth")
    (description
     "This package provides a high-performance Go package for measuring the monospace
display width of strings, UTF-8 bytes, and runes.")
    (license license:expat)))

(define-public go-github-com-clipperhouse-stringish-0.1.1
  (package
    (name "go-github-com-clipperhouse-stringish")
    (version "0.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/stringish")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kw49n1dg8wdp7g71xbzjzrkip83vy09wk9zilshbfkpdz7grgk1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/stringish"))
    (home-page "https://github.com/clipperhouse/stringish")
    (synopsis "stringish")
    (description
     "This package provides a small Go module that provides a generic type constraint
for “string-like” data, and a utf8 package that works with both strings and byte
slices without conversions.")
    (license license:expat)))

(define-public go-github-com-clipperhouse-uax29-2.3.0
  (package
    (name "go-github-com-clipperhouse-uax29")
    (version "2.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/uax29")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i0m5bzq3hq6s4jmp78270qlf82bb96q82x6lms0yxj8qmxj7wlj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/uax29/v2"
      #:unpack-path "github.com/clipperhouse/uax29"))
    (propagated-inputs (list go-github-com-clipperhouse-stringish-0.1.1))
    (home-page "https://github.com/clipperhouse/uax29")
    (synopsis "Why tokenize?")
    (description
     "Package uax29 provides Unicode text segmentation (UAX #29) for words, sentences
and graphemes.")
    (license license:expat)))

(define-public go-github-com-mattn-go-runewidth-0.0.19
  (package
    (name "go-github-com-mattn-go-runewidth")
    (version "0.0.19")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mattn/go-runewidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0w9hjbim23dwzf6lgmmgss0ikdjrxx4pd27p8ds8spv1k4mdp68s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mattn/go-runewidth"))
    (propagated-inputs (list go-github-com-clipperhouse-uax29-2.2.0))
    (home-page "https://github.com/mattn/go-runewidth")
    (synopsis "go-runewidth")
    (description
     "This package provides functions to get fixed width of the character or string.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-ansi-0.11.2
  (package
    (name "go-github-com-charmbracelet-x-ansi")
    (version "0.11.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "ansi"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1h40r0d0whm57wiq9rrswyax9hvbi90q7inqfcp1grx5dzlkdawi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/ansi"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-bits-and-blooms-bitset-1.24.4
                             go-github-com-clipperhouse-displaywidth-0.6.0
                             go-github-com-clipperhouse-uax29-2.3.0
                             go-github-com-lucasb-eyer-go-colorful-1.3.0
                             go-github-com-mattn-go-runewidth-0.0.19))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package ansi defines common ANSI escape sequences based on the ECMA-48 specs.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.29.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.29.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "073qb73w2zhpiggfc4sf2laafkmcaxz8hmzsgb4p2f0xaaaz0q2c"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-charmbracelet-x-termios-0.1.1
  (package
    (name "go-github-com-charmbracelet-x-termios")
    (version "0.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "termios"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "059b9kxqlmvfif2xrj8j21ih2476n0aphg5w5ajrf974hl0fy3k1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/termios"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-golang-org-x-sys-0.29.0))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description #f)
    (license license:expat)))

(define-public go-golang-org-x-sys-0.34.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.34.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kq19n27sd05rj1dgrlpnb3pi22m1dpn8xkv7s5idb127m8zhsib"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-charmbracelet-x-windows-0.2.2
  (package
    (name "go-github-com-charmbracelet-x-windows")
    (version "0.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "windows"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01iba6qjgpxw2bik8331s71320vs0zr4x3fnpzkf9vhr91qkm6nv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/windows"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-golang-org-x-sys-0.34.0))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description "Package windows provides Windows-specific system utilities.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20220204135822-1c1b9b1eba6a
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20220204135822-1c1b9b1eba6a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xfjrqlawif6zk3pwb4jw4gvxscpik1qxz6acx5fdqq00vdqs26s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-muesli-cancelreader-0.2.2
  (package
    (name "go-github-com-muesli-cancelreader")
    (version "0.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/cancelreader")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0157mgpk0z45xizrgrz73swhky0d8nyk6fhwb089n1290k7yjhxq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/muesli/cancelreader"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20220204135822-1c1b9b1eba6a))
    (home-page "https://github.com/muesli/cancelreader")
    (synopsis "CancelReader")
    (description "This package provides a cancelable reader for Go.")
    (license license:expat)))

(define-public go-github-com-google-go-cmp-0.5.8
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.5.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-cmp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0563bczyrmv9ps2p6n8af0m1jsszwdmkdkrxkv6dbm5bwjihhfgk"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-cmp"))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
     "This package is intended to be a more powerful and safer alternative to
@@code{reflect.@code{DeepEqual}} for comparing whether two values are
semantically equal.")
    (license license:bsd-3)))

(define-public go-github-com-yuin-goldmark-1.4.13
  (package
    (name "go-github-com-yuin-goldmark")
    (version "1.4.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yuin/goldmark")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xk2ss50pqs6sfp3vbyrf0iipa5958y097na7yr26wry8wcs9wf4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/yuin/goldmark"))
    (home-page "https://github.com/yuin/goldmark")
    (synopsis "goldmark")
    (description
     "Package goldmark implements functions to convert markdown text to a desired
format.")
    (license license:expat)))

(define-public go-golang-org-x-text-0.3.3
  (package
    (name "go-golang-org-x-text")
    (version "0.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19pihqm3phyndmiw6i42pdv6z1rbvlqlsnhsyqf9gsnn0qnmqqlh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list
                        go-golang-org-x-tools-0.0.0-20180917221912-90fa682c2a6e))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.0.0-20210226172049-e18ecbb05110
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20210226172049-e18ecbb05110")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vlq8mdscp7yfaa1lmyv03y5m4c2d67ydg2q1i6smkrxghn3zn3q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20201119102817-f84b799fce68
                        go-golang-org-x-term-0.0.0-20201126162022-7de9c90e9dd1
                        go-golang-org-x-text-0.3.3))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.0.0-20201119102817-f84b799fce68
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20201119102817-f84b799fce68")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dvhqian5byzkcg1bnqzygqa6ccc6krc2q7j12pp1vhl3y7znnsg"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.0.0-20201126162022-7de9c90e9dd1
  (package
    (name "go-golang-org-x-term")
    (version "0.0.0-20201126162022-7de9c90e9dd1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ba252xmv6qsvf1w1gcy98mngrj0vd4inbjw0lsklqvva65nljna"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20201119102817-f84b799fce68))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.0.0-20210921155107-089bfa567519
  (package
    (name "go-golang-org-x-crypto")
    (version "0.0.0-20210921155107-089bfa567519")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i49ywadw5hp30i4dghwjwhbrfxq881jxskhnz7gwps5kb0bdnjf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list
                        go-golang-org-x-net-0.0.0-20210226172049-e18ecbb05110
                        go-golang-org-x-sys-0.0.0-20210615035016-665e8c7367d1
                        go-golang-org-x-term-0.0.0-20201126162022-7de9c90e9dd1))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.0.0-20190308221718-c2843e01d9a2
  (package
    (name "go-golang-org-x-crypto")
    (version "0.0.0-20190308221718-c2843e01d9a2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01xgxbj5r79nmisdvpq48zfy8pzaaj90bn6ngd4nf33j9ar1dp8r"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20190215142949-d0b11bdaac8a))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.0.0-20190215142949-d0b11bdaac8a
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20190215142949-d0b11bdaac8a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18yfsmw622l7gc5sqriv5qmck6903vvhivpzp8i3xfy3z33dybdl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.3.0
  (package
    (name "go-golang-org-x-text")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0r6x6zjzhr8ksqlpiwm5gdd7s209kwk5p4lw54xjvz10cs3qlq19"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.0.0-20190620200207-3b0461eec859
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20190620200207-3b0461eec859")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l00c8l0a8xnv6qdpwfzxxsr58jggacgzdrwiprrfx2xqm37b6d5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-crypto-0.0.0-20190308221718-c2843e01d9a2
                        go-golang-org-x-sys-0.0.0-20190215142949-d0b11bdaac8a
                        go-golang-org-x-text-0.3.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.0.0-20190423024810-112230192c58
  (package
    (name "go-golang-org-x-sync")
    (version "0.0.0-20190423024810-112230192c58")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05i2k43j2d0llq768hg5pf3hb2yhfzp9la1w5wp0rsnnzblr0lfn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-xerrors-0.0.0-20190717185122-a985d3407aa7
  (package
    (name "go-golang-org-x-xerrors")
    (version "0.0.0-20190717185122-a985d3407aa7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/xerrors")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00wzr5w8aadipgc3rkk8f11i41znskfj9ix5nhhaxyg7isrslgcj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/xerrors"))
    (home-page "https://golang.org/x/xerrors")
    (synopsis #f)
    (description "Package xerrors implements functions to manipulate errors.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.0.0-20191119224855-298f0cb1881e
  (package
    (name "go-golang-org-x-tools")
    (version "0.0.0-20191119224855-298f0cb1881e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l4pqwib2wnfnix6nvxl0yrq87ipi7ff1rz6z5bxfzy9dki1nzmv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list
                        go-golang-org-x-net-0.0.0-20190620200207-3b0461eec859
                        go-golang-org-x-sync-0.0.0-20190423024810-112230192c58
                        go-golang-org-x-xerrors-0.0.0-20190717185122-a985d3407aa7))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.6.0-dev.0.20220419223038-86c51ed26bb4
  (package
    (name "go-golang-org-x-mod")
    (version "0.6.0-dev.0.20220419223038-86c51ed26bb4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0680sfa9g4zjnzc1rwd9k07pm0nb3018k0ma8gi0i6kjdkm2w3k5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list
                        go-golang-org-x-crypto-0.0.0-20210921155107-089bfa567519
                        go-golang-org-x-tools-0.0.0-20191119224855-298f0cb1881e))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.0.0-20220520151302-bc2c85ada10a
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20220520151302-bc2c85ada10a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03inympjs6imcanyy5a55sqqz4z916wgch3zsby571yrmpvlagxi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.0.0-20210615035016-665e8c7367d1
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20210615035016-665e8c7367d1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11n848csibdbv7b46zjyf4l7sphg37n9sjzqfy1ds7p1jyakwmnv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.0.0-20210927222741-03fcf44c2211
  (package
    (name "go-golang-org-x-term")
    (version "0.0.0-20210927222741-03fcf44c2211")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0aw5lgwq5w5kvwfa3jl7l83p9c827ksy4a99dqzzsqxvmk2zdi8f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20210615035016-665e8c7367d1))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.0.0-20220722155237-a158d28d115b
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20220722155237-a158d28d115b")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13if4f4pjj9356m60yj6dypnz5c4s9f96cf6ly55l2x0c57hrisd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20220520151302-bc2c85ada10a
                        go-golang-org-x-term-0.0.0-20210927222741-03fcf44c2211
                        go-golang-org-x-text-0.3.7))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.0.0-20220722155255-886fb9371eb4
  (package
    (name "go-golang-org-x-sync")
    (version "0.0.0-20220722155255-886fb9371eb4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03gdnkvp4crjg3v24vg72537nwqxvrpbbv31i47ap7ky32bqi735"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.0.0-20220722155257-8c9f86f7a55f
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20220722155257-8c9f86f7a55f")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bw4w86kil96zhx8ggkcplgkjn03yp9hklqfwgxr76ss2g3i3jh5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.0.0-20180917221912-90fa682c2a6e
  (package
    (name "go-golang-org-x-tools")
    (version "0.0.0-20180917221912-90fa682c2a6e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03ic2xsy51jw9749wl7gszdbz99iijbd2bckgygl6cm9w5m364ak"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.3.7
  (package
    (name "go-golang-org-x-text")
    (version "0.3.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xkw0qvfjyifdqd25y7nxdqkdh92inymw3q7841nricc9s01p4jy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list
                        go-golang-org-x-tools-0.0.0-20180917221912-90fa682c2a6e))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.1.12
  (package
    (name "go-golang-org-x-tools")
    (version "0.1.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15qvrmw8ma95nrrgm427cpk5j0b07f2y59wvs4z9wjss1ff0nhrr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.6.0-dev.0.20220419223038-86c51ed26bb4
                        go-golang-org-x-net-0.0.0-20220722155237-a158d28d115b
                        go-golang-org-x-sync-0.0.0-20220722155255-886fb9371eb4
                        go-golang-org-x-sys-0.0.0-20220722155257-8c9f86f7a55f
                        go-golang-org-x-text-0.3.7))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-exp-0.0.0-20220909182711-5c715a9e8561
  (package
    (name "go-golang-org-x-exp")
    (version "0.0.0-20220909182711-5c715a9e8561")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/exp")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nkz9h310dx5n9i2y4gvd0zzc4dcz6swxh303glzm4z49rp2d2wa"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/exp"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.5.8
                        go-golang-org-x-mod-0.6.0-dev.0.20220419223038-86c51ed26bb4
                        go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/exp")
    (synopsis "exp")
    (description
     "This subrepository holds experimental and deprecated (in the @@code{old}
directory) packages.")
    (license license:bsd-3)))

(define-public go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
  (package
    (name "go-github-com-xo-terminfo")
    (version "0.0.0-20220910002029-abceb7e1c41e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xo/terminfo")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0n3b37z76rz3l74mhrvviz66xa8dqwpvc2gb6cyzql5smbcs9y3a"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/xo/terminfo"))
    (propagated-inputs (list
                        go-golang-org-x-exp-0.0.0-20220909182711-5c715a9e8561))
    (home-page "https://github.com/xo/terminfo")
    (synopsis "About terminfo")
    (description
     "Package terminfo implements reading terminfo files in pure go.")
    (license license:expat)))

(define-public go-golang-org-x-sync-0.18.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.18.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1f5617lxxjs4awyfscin1ydbagz98704zwz4mfg8ascfn75kmjjb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.38.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.38.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "101nj2r0a2dh8pcr8g6rinr0g3x66ahcb0p5xbgb3q0qvdczrqq6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-lucasb-eyer-go-colorful-1.3.0
  (package
    (name "go-github-com-lucasb-eyer-go-colorful")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lucasb-eyer/go-colorful")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05fl0afzpn624wz1lp846k1fn1rx2lvcs5jhc2z2gip6qwkan4p8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/lucasb-eyer/go-colorful"))
    (home-page "https://github.com/lucasb-eyer/go-colorful")
    (synopsis "go-colorful")
    (description
     "The colorful package provides all kinds of functions for working with colors.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-ultraviolet-0.0.0-20251205161215-1948445e3318
  (package
    (name "go-github-com-charmbracelet-ultraviolet")
    (version "0.0.0-20251205161215-1948445e3318")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/ultraviolet")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0544l234phb0ld6ajs2kdjl1sczp9w59zrmrmb25aq2mismyrijy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/ultraviolet"))
    (propagated-inputs (list go-github-com-charmbracelet-colorprofile-0.3.3
                        go-github-com-charmbracelet-x-ansi-0.11.2
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-charmbracelet-x-termios-0.1.1
                        go-github-com-charmbracelet-x-windows-0.2.2
                        go-github-com-lucasb-eyer-go-colorful-1.3.0
                        go-github-com-muesli-cancelreader-0.2.2
                        go-github-com-rivo-uniseg-0.4.7
                        go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
                        go-golang-org-x-sync-0.18.0
                        go-golang-org-x-sys-0.38.0))
    (home-page "https://github.com/charmbracelet/ultraviolet")
    (synopsis "Ultraviolet")
    (description
     "Package uv (Ultraviolet) provides primitives for building terminal user
interfaces in Go.")
    (license license:expat)))

(define-public go-github-com-bits-and-blooms-bitset-1.24.4
  (package
    (name "go-github-com-bits-and-blooms-bitset")
    (version "1.24.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bits-and-blooms/bitset")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qy6ky518awhcx2klvyz6kh14bbagbvbfnczzdy25iw7j9j3ffia"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/bits-and-blooms/bitset"))
    (home-page "https://github.com/bits-and-blooms/bitset")
    (synopsis "bitset")
    (description
     "Package bitset implements bitsets, a mapping between non-negative integers and
boolean values.  It should be more efficient than map[uint] bool.")
    (license license:bsd-3)))

(define-public go-github-com-clipperhouse-uax29-2.2.0
  (package
    (name "go-github-com-clipperhouse-uax29")
    (version "2.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/uax29")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1j3nh883v0rpc7fm016ga5silb34xbn3ri2ifzn6zya76jmygfvz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/uax29/v2"
      #:unpack-path "github.com/clipperhouse/uax29"))
    (home-page "https://github.com/clipperhouse/uax29")
    (synopsis "Why tokenize?")
    (description
     "Package uax29 provides Unicode text segmentation (UAX #29) for words, sentences
and graphemes.")
    (license license:expat)))

(define-public go-github-com-mattn-go-runewidth-0.0.23
  (package
    (name "go-github-com-mattn-go-runewidth")
    (version "0.0.23")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mattn/go-runewidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "142qq5v52v9h8zhc2mds6gjlbi997g9qbkvjbcliys9mcmks2q2a"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mattn/go-runewidth"))
    (propagated-inputs (list go-github-com-clipperhouse-uax29-2.2.0))
    (home-page "https://github.com/mattn/go-runewidth")
    (synopsis "go-runewidth")
    (description
     "This package provides functions to get fixed width of the character or string.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-ansi-0.11.7
  (package
    (name "go-github-com-charmbracelet-x-ansi")
    (version "0.11.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "ansi"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01s80fib0cjgbxardgkhpy40xn05wjqyz5ddp856gmsi35qac379"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/ansi"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-bits-and-blooms-bitset-1.24.4
                             go-github-com-clipperhouse-displaywidth-0.11.0
                             go-github-com-clipperhouse-uax29-2.7.0
                             go-github-com-lucasb-eyer-go-colorful-1.4.0
                             go-github-com-mattn-go-runewidth-0.0.23))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package ansi defines common ANSI escape sequences based on the ECMA-48 specs.")
    (license license:expat)))

(define-public go-github-com-aymanbagabas-go-udiff-0.3.1
  (package
    (name "go-github-com-aymanbagabas-go-udiff")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aymanbagabas/go-udiff")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1p0z40hrh2i7z4m5iw9db9a85rfyjcbc5bzfgnjjvwy00zfidx78"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/aymanbagabas/go-udiff"))
    (home-page "https://github.com/aymanbagabas/go-udiff")
    (synopsis "µDiff")
    (description
     "Package diff computes differences between text files or strings.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-exp-golden-0.0.0-20250806222409-83e3a29d542f
  (package
    (name "go-github-com-charmbracelet-x-exp-golden")
    (version "0.0.0-20250806222409-83e3a29d542f")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "exp/golden"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01iba6qjgpxw2bik8331s71320vs0zr4x3fnpzkf9vhr91qkm6nv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/exp/golden"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-aymanbagabas-go-udiff-0.3.1))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package golden provides a helper function to assert the output of tests.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.36.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.36.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1chn97i0c058bkzr0zia33bxjd8sdm7bhypxxn9acpi6c311950v"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-charmbracelet-x-term-0.2.2
  (package
    (name "go-github-com-charmbracelet-x-term")
    (version "0.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "term"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sriiy8njbnwgn0ydnp3adq70ch489xi5v662c6h3zq1f6b981zy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/term"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-golang-org-x-sys-0.36.0))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package term provides a platform-independent interfaces for interacting with
Terminal and TTY devices.")
    (license license:expat)))

(define-public go-github-com-clipperhouse-uax29-2.7.0
  (package
    (name "go-github-com-clipperhouse-uax29")
    (version "2.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/uax29")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0p18s46jd4ryqp036cyv4j6ys67706kihw0fj5ym98xf1m2mdsgg"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/uax29/v2"
      #:unpack-path "github.com/clipperhouse/uax29"))
    (home-page "https://github.com/clipperhouse/uax29")
    (synopsis "Why tokenize?")
    (description
     "Package uax29 provides Unicode text segmentation (UAX #29) for words, sentences
and graphemes.")
    (license license:expat)))

(define-public go-github-com-clipperhouse-displaywidth-0.11.0
  (package
    (name "go-github-com-clipperhouse-displaywidth")
    (version "0.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/displaywidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "032f33vf5ign78l9clc3vz1kzirxgalxswm3j6l4nbf46vpp08yz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/displaywidth"))
    (propagated-inputs (list go-github-com-clipperhouse-uax29-2.7.0))
    (home-page "https://github.com/clipperhouse/displaywidth")
    (synopsis "displaywidth")
    (description
     "This package provides a high-performance Go package for measuring the monospace
display width of strings, UTF-8 bytes, and runes.")
    (license license:expat)))

(define-public go-github-com-lucasb-eyer-go-colorful-1.4.0
  (package
    (name "go-github-com-lucasb-eyer-go-colorful")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lucasb-eyer/go-colorful")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1z98jw2hi45fd8aqaap6wdh1dig7lkf9lds7sarb0c44f86cdzcb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/lucasb-eyer/go-colorful"))
    (home-page "https://github.com/lucasb-eyer/go-colorful")
    (synopsis "go-colorful")
    (description
     "The colorful package provides all kinds of functions for working with colors.")
    (license license:expat)))

(define-public go-github-com-rivo-uniseg-0.4.7
  (package
    (name "go-github-com-rivo-uniseg")
    (version "0.4.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rivo/uniseg")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nlcqyvq4vhq3hqhk84h6fp0jbqkjj88kcpcl853yr7sh4sisdxc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/rivo/uniseg"))
    (home-page "https://github.com/rivo/uniseg")
    (synopsis "Unicode Text Segmentation for Go")
    (description
     "Package uniseg implements Unicode Text Segmentation, Unicode Line Breaking, and
string width calculation for monospace fonts.  Unicode Text Segmentation
conforms to Unicode Standard Annex #29
(@@url{https://unicode.org/reports/tr29/,https://unicode.org/reports/tr29/}) and
Unicode Line Breaking conforms to Unicode Standard Annex #14
(@@url{https://unicode.org/reports/tr14/,https://unicode.org/reports/tr14/}).")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.46.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.46.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cxixrd8pr9k0xib1f1d9l6c0wi4qrcbawann70sfk350va7fbyy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-charm-land-lipgloss-2.0.5
  (package
    (name "go-charm-land-lipgloss")
    (version "2.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/lipgloss")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wh7z2c6z4dv918qd78in48kp16nbqfgiw71f8fvnfhwm6crdwp0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "charm.land/lipgloss/v2"
      #:unpack-path "charm.land/lipgloss"))
    (propagated-inputs (list go-github-com-aymanbagabas-go-udiff-0.4.1
                        go-github-com-charmbracelet-colorprofile-0.4.3
                        go-github-com-charmbracelet-ultraviolet-0.0.0-20251205161215-1948445e3318
                        go-github-com-charmbracelet-x-ansi-0.11.7
                        go-github-com-charmbracelet-x-exp-golden-0.0.0-20250806222409-83e3a29d542f
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-clipperhouse-displaywidth-0.11.0
                        go-github-com-lucasb-eyer-go-colorful-1.4.0
                        go-github-com-rivo-uniseg-0.4.7
                        go-golang-org-x-sys-0.46.0))
    (home-page "https://charm.land/lipgloss")
    (synopsis "Lip Gloss")
    (description
     "Package lipgloss provides style definitions for nice terminal layouts.  Built
with TUIs in mind.")
    (license license:expat)))

(define-public go-github-com-clipperhouse-displaywidth-0.6.1
  (package
    (name "go-github-com-clipperhouse-displaywidth")
    (version "0.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clipperhouse/displaywidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13wbyp4f96s469wkfp4i24xb2jihilsci9zjpmkbwnb2rbn61j4x"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/clipperhouse/displaywidth"))
    (propagated-inputs (list go-github-com-clipperhouse-stringish-0.1.1
                             go-github-com-clipperhouse-uax29-2.3.0))
    (home-page "https://github.com/clipperhouse/displaywidth")
    (synopsis "displaywidth")
    (description
     "This package provides a high-performance Go package for measuring the monospace
display width of strings, UTF-8 bytes, and runes.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-ansi-0.11.3
  (package
    (name "go-github-com-charmbracelet-x-ansi")
    (version "0.11.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "ansi"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1brh2mvvm5wr6bs3mi2k2xfipacxf7xv8vqkn1sygpzjga7vlxl2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/ansi"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-bits-and-blooms-bitset-1.24.4
                             go-github-com-clipperhouse-displaywidth-0.6.1
                             go-github-com-clipperhouse-uax29-2.3.0
                             go-github-com-lucasb-eyer-go-colorful-1.3.0
                             go-github-com-mattn-go-runewidth-0.0.19))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package ansi defines common ANSI escape sequences based on the ECMA-48 specs.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-colorprofile-0.4.1
  (package
    (name "go-github-com-charmbracelet-colorprofile")
    (version "0.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/colorprofile")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hznrfadaw68wymz4mmp87h0jy2v3njx6sxpkrslpjnh3snqai0r"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/colorprofile"))
    (propagated-inputs (list go-github-com-charmbracelet-x-ansi-0.11.3
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-lucasb-eyer-go-colorful-1.3.0
                        go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
                        go-golang-org-x-sys-0.38.0))
    (home-page "https://github.com/charmbracelet/colorprofile")
    (synopsis "Colorprofile")
    (description
     "Package colorprofile provides a way to downsample ANSI escape sequence colors
and styles automatically based on output, environment variables, and Terminfo
databases.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-ultraviolet-0.0.0-20260205113103-524a6607adb8
  (package
    (name "go-github-com-charmbracelet-ultraviolet")
    (version "0.0.0-20260205113103-524a6607adb8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/ultraviolet")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xxkish6mparlgbswb1070qnyl138bfj6339c3x91cdfm3q91c3l"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/ultraviolet"))
    (propagated-inputs (list go-github-com-charmbracelet-colorprofile-0.4.1
                        go-github-com-charmbracelet-x-ansi-0.11.6
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-charmbracelet-x-termios-0.1.1
                        go-github-com-charmbracelet-x-windows-0.2.2
                        go-github-com-clipperhouse-uax29-2.5.0
                        go-github-com-lucasb-eyer-go-colorful-1.3.0
                        go-github-com-muesli-cancelreader-0.2.2
                        go-github-com-rivo-uniseg-0.4.7
                        go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
                        go-golang-org-x-sync-0.19.0
                        go-golang-org-x-sys-0.40.0))
    (home-page "https://github.com/charmbracelet/ultraviolet")
    (synopsis "Ultraviolet")
    (description
     "Package uv (Ultraviolet) provides primitives for building terminal user
interfaces in Go.")
    (license license:expat)))

(define-public go-github-com-aymanbagabas-go-udiff-0.2.0
  (package
    (name "go-github-com-aymanbagabas-go-udiff")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aymanbagabas/go-udiff")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09p17r8s5flhq6p69z08345q0y99dpb0yyashlwpgxn45xir7y6g"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/aymanbagabas/go-udiff"))
    (home-page "https://github.com/aymanbagabas/go-udiff")
    (synopsis "µDiff")
    (description
     "Package diff computes differences between text files or strings.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-exp-golden-0.0.0-20241212170349-ad4b7ae0f25f
  (package
    (name "go-github-com-charmbracelet-x-exp-golden")
    (version "0.0.0-20241212170349-ad4b7ae0f25f")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "exp/golden"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12nxqf5szsh6lfm3bhgqrqshllw4yaasnalckakkiyivq6d2jlnz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/exp/golden"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-aymanbagabas-go-udiff-0.2.0))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package golden provides a helper function to assert the output of tests.")
    (license license:expat)))

(define-public go-charm-land-bubbletea-2.0.2
  (package
    (name "go-charm-land-bubbletea")
    (version "2.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/bubbletea")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mh9bqvkmc1dwqglk3j1qv4mwprqdn9sd3cr54jalc8d8mvs46iv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "charm.land/bubbletea/v2"
      #:unpack-path "charm.land/bubbletea"))
    (propagated-inputs (list go-github-com-charmbracelet-colorprofile-0.4.1
                        go-github-com-charmbracelet-ultraviolet-0.0.0-20260205113103-524a6607adb8
                        go-github-com-charmbracelet-x-ansi-0.11.6
                        go-github-com-charmbracelet-x-exp-golden-0.0.0-20241212170349-ad4b7ae0f25f
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-lucasb-eyer-go-colorful-1.3.0
                        go-github-com-muesli-cancelreader-0.2.2
                        go-golang-org-x-sys-0.40.0))
    (home-page "https://charm.land/bubbletea")
    (synopsis "Bubble Tea")
    (description
     "Package tea provides a framework for building rich terminal user interfaces
based on the paradigms of The Elm Architecture.  It's well-suited for simple and
complex terminal applications, either inline, full-window, or a mix of both.
It's been battle-tested in several large projects and is production-ready.")
    (license license:expat)))

(define-public go-charm-land-lipgloss-2.0.1
  (package
    (name "go-charm-land-lipgloss")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/lipgloss")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02zfnqgj6x92yyri9a9ividd72h2v4nj4ig0c6h50w92x6lp2bms"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "charm.land/lipgloss/v2"
      #:unpack-path "charm.land/lipgloss"))
    (propagated-inputs (list go-github-com-aymanbagabas-go-udiff-0.4.1
                        go-github-com-charmbracelet-colorprofile-0.4.2
                        go-github-com-charmbracelet-ultraviolet-0.0.0-20251205161215-1948445e3318
                        go-github-com-charmbracelet-x-ansi-0.11.6
                        go-github-com-charmbracelet-x-exp-golden-0.0.0-20250806222409-83e3a29d542f
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-clipperhouse-displaywidth-0.11.0
                        go-github-com-lucasb-eyer-go-colorful-1.3.0
                        go-github-com-rivo-uniseg-0.4.7
                        go-golang-org-x-sys-0.42.0))
    (home-page "https://charm.land/lipgloss")
    (synopsis "Lip Gloss")
    (description
     "Package lipgloss provides style definitions for nice terminal layouts.  Built
with TUIs in mind.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-colorprofile-0.4.2
  (package
    (name "go-github-com-charmbracelet-colorprofile")
    (version "0.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/colorprofile")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0r9zsaq94is33rdbfr42lsdgk36fhlpdmc9m336nmj5f4g3pspb6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/colorprofile"))
    (propagated-inputs (list go-github-com-charmbracelet-x-ansi-0.11.6
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-lucasb-eyer-go-colorful-1.3.0
                        go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
                        go-golang-org-x-sys-0.41.0))
    (home-page "https://github.com/charmbracelet/colorprofile")
    (synopsis "Colorprofile")
    (description
     "Package colorprofile provides a way to downsample ANSI escape sequence colors
and styles automatically based on output, environment variables, and Terminfo
databases.")
    (license license:expat)))

(define-public go-github-com-go-logfmt-logfmt-0.6.0
  (package
    (name "go-github-com-go-logfmt-logfmt")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-logfmt/logfmt")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0s3dz7z5a8p5ia5czihy5y2hkij7rdfyr425sw9rnxqil3d0dlj6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-logfmt/logfmt"))
    (home-page "https://github.com/go-logfmt/logfmt")
    (synopsis "logfmt")
    (description
     "Package logfmt implements utilities to marshal and unmarshal data in the logfmt
format.  The logfmt format records key/value pairs in a way that balances
readability for humans and simplicity of computer parsing.  It is most commonly
used as a more human friendly alternative to JSON for structured logging.")
    (license license:expat)))

(define-public go-golang-org-x-mod-0.13.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rwy8h8kzzqww0wvjg5l5zk92j1xxnl9yhrq41d6b0439lkxgqd3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.13.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.16.0
  (package
    (name "go-golang-org-x-net")
    (version "0.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09nn86lx7r7b4gdi3k7ipl0c3s5w9vqla98fdyh3c1sywy9b1llv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.14.0
                             go-golang-org-x-sys-0.13.0
                             go-golang-org-x-term-0.13.0
                             go-golang-org-x-text-0.13.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.4.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xmi8r98gchs23xq686fqv1dxgzy16niv5x1csbsxgflx8hpjaal"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.14.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0myv6n0ny6z3xwi87ck2f56yw7mmmlmg36zk2ds3skb0qm97jf6i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.13.0
                             go-golang-org-x-net-0.16.0
                             go-golang-org-x-sync-0.4.0
                             go-golang-org-x-sys-0.13.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-exp-0.0.0-20231006140011-7918f672742d
  (package
    (name "go-golang-org-x-exp")
    (version "0.0.0-20231006140011-7918f672742d")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/exp")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l4acdj9n3x9qal4fnwi3wxiynr21z7g78iffbkcyw72jx828l5z"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/exp"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.5.8
                             go-golang-org-x-mod-0.13.0
                             go-golang-org-x-tools-0.14.0))
    (home-page "https://golang.org/x/exp")
    (synopsis "exp")
    (description
     "This subrepository holds experimental and deprecated (in the @@code{old}
directory) packages.")
    (license license:bsd-3)))

(define-public go-charm-land-log-2.0.0
  (package
    (name "go-charm-land-log")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/log")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03faq5z5m7m7i1jqhxn4mi236pnp05h30w94p9vs4zygy7acm2wi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "charm.land/log/v2"
      #:unpack-path "charm.land/log"))
    (propagated-inputs (list go-charm-land-lipgloss-2.0.1
                        go-github-com-charmbracelet-colorprofile-0.4.2
                        go-github-com-go-logfmt-logfmt-0.6.0
                        go-github-com-stretchr-testify-1.10.0
                        go-golang-org-x-exp-0.0.0-20231006140011-7918f672742d))
    (home-page "https://charm.land/log")
    (synopsis "Log")
    (description
     "Package log provides a simple and flexible logger with support for structured
logging, log levels, and customizable output formats.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-keygen-0.5.4
  (package
    (name "go-github-com-charmbracelet-keygen")
    (version "0.5.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/keygen")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1azg3smk78z4xr2mdmxqxga4zj2aq9bqrbalxjfs2fvxim09cv0v"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/keygen"))
    (propagated-inputs (list go-golang-org-x-crypto-0.42.0))
    (home-page "https://github.com/charmbracelet/keygen")
    (synopsis "Keygen")
    (description "Package keygen handles the creation of new SSH key pairs.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-errors-0.0.0-20240508181413-e8d8b6e2de86
  (package
    (name "go-github-com-charmbracelet-x-errors")
    (version "0.0.0-20240508181413-e8d8b6e2de86")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "errors"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00yyl9bspc2jn79d3zxbqvp7kwaklqaiyahfh71gp1xzijbgnibp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/errors"
      #:unpack-path "github.com/charmbracelet/x"))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description "Package errors provides error handling utilities.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-conpty-0.1.0
  (package
    (name "go-github-com-charmbracelet-x-conpty")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "conpty"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00d3lxlly64aqcnaci5ds9cyxcq9ynq5qh4f368s17gxml5k40pz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/conpty"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list
                        go-github-com-charmbracelet-x-errors-0.0.0-20240508181413-e8d8b6e2de86
                        go-golang-org-x-sys-0.20.0))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package conpty implements Windows Console Pseudo-terminal support.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-termios-0.1.0
  (package
    (name "go-github-com-charmbracelet-x-termios")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "termios"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ndcidjdzwlffia364br10fqs4qmncwv917safnf3ygzvdfkql46"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/termios"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-golang-org-x-sys-0.20.0))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description #f)
    (license license:expat)))

(define-public go-github-com-creack-pty-1.1.21
  (package
    (name "go-github-com-creack-pty")
    (version "1.1.21")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/creack/pty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10afvcg0nws0qc6hpfsr8yqqxj2c6ny6r9xcy5cydi3pyyvv9641"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/creack/pty"))
    (home-page "https://github.com/creack/pty")
    (synopsis "pty")
    (description
     "Package pty provides functions for working with Unix terminals.")
    (license license:expat)))

(define-public go-golang-org-x-term-0.31.0
  (package
    (name "go-golang-org-x-term")
    (version "0.31.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01shv5d3kdnd78snnay48xwrnb199brmiah2a7r8dzzmi0cdybrv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.32.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.37.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.37.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sd548gpri5c1vaiii61yqzyrpw6966kfc9fqy3m4pyz06bq363x"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.32.0
                             go-golang-org-x-term-0.31.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.32.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.32.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00qywn2grhnwm2mcyksnm1iayk0jq5jnx31zpsq0ysm7h84q6n9j"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-charmbracelet-ssh-0.0.0-20250826160808-ebfa259c7309
  (package
    (name "go-github-com-charmbracelet-ssh")
    (version "0.0.0-20250826160808-ebfa259c7309")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/ssh")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mm1a1p15wvk417rcxlbaq6llbrbx46gyl4xbcm9zm66d9hk1f7k"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/ssh"))
    (propagated-inputs (list
                        go-github-com-anmitsu-go-shlex-0.0.0-20200514113438-38f4b401e2be
                        go-github-com-charmbracelet-x-conpty-0.1.0
                        go-github-com-charmbracelet-x-termios-0.1.0
                        go-github-com-creack-pty-1.1.21
                        go-golang-org-x-crypto-0.37.0
                        go-golang-org-x-sys-0.32.0))
    (home-page "https://github.com/charmbracelet/ssh")
    (synopsis "gliderlabs/ssh")
    (description
     "Package ssh wraps the crypto/ssh package with a higher-level API for building
SSH servers.  The goal of the API was to make it as simple as using net/http, so
the API is very similar.")
    (license license:bsd-3)))

(define-public go-dario-cat-mergo-1.0.0
  (package
    (name "go-dario-cat-mergo")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/imdario/mergo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "037k2bd97vnbyhn2sczxk0j6ijmv06n1282f76i3ky73s3qmqnlf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "dario.cat/mergo"))
    (propagated-inputs (list go-gopkg-in-yaml-v3))
    (home-page "https://dario.cat/mergo")
    (synopsis "Mergo")
    (description
     "This package provides a helper to merge structs and maps in Golang.  Useful for
configuration default values, avoiding messy if-statements.")
    (license license:bsd-3)))

(define-public go-github-com-bwesterb-go-ristretto-1.2.3
  (package
    (name "go-github-com-bwesterb-go-ristretto")
    (version "1.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bwesterb/go-ristretto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0h508v790wk6g8jq0gh18296xl87vmgc4fhwnac7mk6i5g3mz6v4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/bwesterb/go-ristretto"))
    (home-page "https://github.com/bwesterb/go-ristretto")
    (synopsis "go-ristretto")
    (description
     "Pure Go implementation of the Ristretto prime-order group built from the Edwards
curve Edwards25519.")
    (license license:expat)))

(define-public go-github-com-cloudflare-circl-1.3.7
  (package
    (name "go-github-com-cloudflare-circl")
    (version "1.3.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cloudflare/circl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01l6qn8gvvcjx8pcl4s7c2s9iwbsxdlsplz2q5r6xmdp8h39l323"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/cloudflare/circl"))
    (propagated-inputs (list go-github-com-bwesterb-go-ristretto-1.2.3
                             go-golang-org-x-crypto-0.17.0
                             go-golang-org-x-sys-0.15.0))
    (home-page "https://github.com/cloudflare/circl")
    (synopsis "CIRCL")
    (description
     "Package circl provides a collection of cryptographic primitives.  The goal of
this module is to be used as a tool for experimental deployment of cryptographic
algorithms targeting Post-Quantum (PQ) and Elliptic Curve Cryptography (ECC).")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.15.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08zjz75cmg1xv4fw7smq3f6sgrn9n60py73vmk42d56rk4s4645k"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.15.0
  (package
    (name "go-golang-org-x-term")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kvsfv4gcyppz3a64mqz7xjpgbsj4agq99hznmq60apc9sqfvjxf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.15.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.17.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1axflsi9yv8nl5v3z65bnvzhkg0cm599had0gb67xiyy5hvzml2p"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.10.0
                             go-golang-org-x-sys-0.15.0
                             go-golang-org-x-term-0.15.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-github-com-protonmail-go-crypto-1.1.6
  (package
    (name "go-github-com-protonmail-go-crypto")
    (version "1.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ProtonMail/go-crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0s5pcqzimfwjyxgrp2sdwky35p3iybv8br3yaqshlgkrmimfrpp1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/ProtonMail/go-crypto"))
    (propagated-inputs (list go-github-com-cloudflare-circl-1.3.7
                             go-golang-org-x-crypto-0.17.0))
    (home-page "https://github.com/ProtonMail/go-crypto")
    (synopsis #f)
    (description
     "This module is backwards compatible with x/crypto/openpgp, so you can simply
replace all imports of @@code{golang.org/x/crypto/openpgp} with
@@code{github.com/@code{ProtonMail/go-crypto/openpgp}}.")
    (license license:bsd-3)))

(define-public go-github-com-armon-go-socks5-0.0.0-20160902184237-e75332964ef5
  (package
    (name "go-github-com-armon-go-socks5")
    (version "0.0.0-20160902184237-e75332964ef5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/armon/go-socks5")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "104w10jf0wlxyxi35hf6frndgf0ybz21h54xjmnkivpb6slycpyq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/armon/go-socks5"))
    (home-page "https://github.com/armon/go-socks5")
    (synopsis "go-socks5")
    (description
     "This package provides the @@code{socks5} package that implements a
@@url{http://en.wikipedia.org/wiki/SOCKS,SOCKS5 server}.  SOCKS (Secure Sockets)
is used to route traffic between a client and server through an intermediate
proxy layer.  This can be used to bypass firewalls or NATs.")
    (license license:expat)))

(define-public go-golang-org-x-crypto-0.33.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1nn720djylvr03mp929jabd55gs9yr1m34n0a4xs7sqv1mla5kzx"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.30.0
                             go-golang-org-x-term-0.29.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.30.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.30.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08zppbqwj3jg02j2dgg2md49y8j5mkj21hmp6nx57zx9a4bm804i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.29.0
  (package
    (name "go-golang-org-x-term")
    (version "0.29.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vwmwbpa9ch7r47m39kwp3byxkaxkas1fx2b7p3sq94dz0zsk2v8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.30.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.22.0
  (package
    (name "go-golang-org-x-text")
    (version "0.22.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l12nlzgdba1ym50cmyqfqkgd6pppdirhpzwcipzn3k3ah9vhyy9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list
                        go-golang-org-x-tools-0.21.1-0.20240508182429-e35e4ccd0d2d))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.35.0
  (package
    (name "go-golang-org-x-net")
    (version "0.35.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00a8mpz5d5b3ai6ycrdqw52d8lkd1hc1l91gm3a2nh67zj3f28lh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.33.0
                             go-golang-org-x-sys-0.30.0
                             go-golang-org-x-term-0.29.0
                             go-golang-org-x-text-0.22.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-elazarl-goproxy-1.7.2
  (package
    (name "go-github-com-elazarl-goproxy")
    (version "1.7.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/elazarl/goproxy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14lljw28rgdr1zc3n73m6bx3by0vyjarc0h5ggnzymxfjrvv4h2l"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/elazarl/goproxy"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.10.0
                             go-golang-org-x-net-0.35.0))
    (home-page "https://github.com/elazarl/goproxy")
    (synopsis "GoProxy")
    (description
     "Package goproxy provides a customizable HTTP proxy, supporting hijacking HTTPS
connection.")
    (license license:bsd-3)))

(define-public go-github-com-emirpasic-gods-1.18.1
  (package
    (name "go-github-com-emirpasic-gods")
    (version "1.18.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/emirpasic/gods")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vnnmv813m8yhykwlxpizpvpimsirbaiwa3ckxfyx3ybv1swlq44"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/emirpasic/gods"))
    (home-page "https://github.com/emirpasic/gods")
    (synopsis "GoDS (Go Data Structures)")
    (description
     "Implementation of various data structures and algorithms in Go.")
    (license #f)))

(define-public go-github-com-anmitsu-go-shlex-0.0.0-20200514113438-38f4b401e2be
  (package
    (name "go-github-com-anmitsu-go-shlex")
    (version "0.0.0-20200514113438-38f4b401e2be")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/anmitsu/go-shlex")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17iz68yzbnr7y4s493asbagbv79qq8hvl2pkxvm6bvdkgphj8w1g"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/anmitsu/go-shlex"))
    (home-page "https://github.com/anmitsu/go-shlex")
    (synopsis "go-shlex")
    (description
     "Package shlex provides a simple lexical analysis like Unix shell.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.28.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.28.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1lgsisl36knlr41inqls3w51xcqfl6d3hkacxry0nqx39167b882"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.27.0
  (package
    (name "go-golang-org-x-term")
    (version "0.27.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gfykqmzgwgrb3adlbknjrb96i58bx2q2vjcdvfvwm554gznkgki"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.28.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.31.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.31.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pd3qipz2wb5wbbb44lgbfygxhf9lq5rknf82p2dmaicszn0rd53"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.28.0
                             go-golang-org-x-term-0.27.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-github-com-gliderlabs-ssh-0.3.8
  (package
    (name "go-github-com-gliderlabs-ssh")
    (version "0.3.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gliderlabs/ssh")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01svn6n2i7gb3j4wvjh3d7xyh3n0kxm5cda2kg9vgpl1l3bbsvqm"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gliderlabs/ssh"))
    (propagated-inputs (list
                        go-github-com-anmitsu-go-shlex-0.0.0-20200514113438-38f4b401e2be
                        go-golang-org-x-crypto-0.31.0))
    (home-page "https://github.com/gliderlabs/ssh")
    (synopsis "gliderlabs/ssh")
    (description
     "Package ssh wraps the crypto/ssh package with a higher-level API for building
SSH servers.  The goal of the API was to make it as simple as using net/http, so
the API is very similar.")
    (license license:bsd-3)))

(define-public go-github-com-pkg-errors-0.9.1
  (package
    (name "go-github-com-pkg-errors")
    (version "0.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pkg/errors")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1761pybhc2kqr6v5fm8faj08x9bql8427yqg6vnfv6nhrasx1mwq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/pkg/errors"))
    (home-page "https://github.com/pkg/errors")
    (synopsis "errors")
    (description "Package errors provides simple error handling primitives.")
    (license license:bsd-2)))

(define-public go-github-com-go-git-gcfg-1.5.1-0.20230307220236-3a3c6141e376
  (package
    (name "go-github-com-go-git-gcfg")
    (version "1.5.1-0.20230307220236-3a3c6141e376")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-git/gcfg")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vvm2k7jk0hyiayksxv9cvns6mkqfqclza33vpm4z8rf4s0k92bz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-git/gcfg"))
    (propagated-inputs (list go-github-com-pkg-errors-0.9.1
                             go-gopkg-in-warnings-v0))
    (home-page "https://github.com/go-git/gcfg")
    (synopsis #f)
    (description
     "Package gcfg reads \"INI-style\" text-based configuration files with \"name=value\"
pairs grouped into sections (gcfg files).")
    (license license:bsd-3)))

(define-public go-github-com-cyphar-filepath-securejoin-0.3.6
  (package
    (name "go-github-com-cyphar-filepath-securejoin")
    (version "0.3.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cyphar/filepath-securejoin")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kv7nqlxzhq92cm7mnswc3077npxybxgblbvv3p9yfg76717wlik"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/cyphar/filepath-securejoin"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.7.1
                             go-golang-org-x-sys-0.18.0))
    (home-page "https://github.com/cyphar/filepath-securejoin")
    (synopsis #f)
    (description
     "Package securejoin implements a set of helpers to make it easier to write Go
code that is safe against symlink-related escape attacks.  The primary idea is
to let you resolve a path within a rootfs directory as if the rootfs was a
chroot.")
    (license #f)))

(define-public go-github-com-go-task-slim-sprig-3.0.0
  (package
    (name "go-github-com-go-task-slim-sprig")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-task/slim-sprig")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1h6m9n8w6yk0fp1kpk574kac6l3ibkh71myjakvns1nmqphb085w"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-task/slim-sprig/v3"
      #:unpack-path "github.com/go-task/slim-sprig"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.8.4))
    (home-page "https://github.com/go-task/slim-sprig")
    (synopsis "Slim-Sprig: Template functions for Go templates")
    (description "Package sprig provides template functions for Go.")
    (license license:expat)))

(define-public go-github-com-chromedp-sysutil-1.0.0
  (package
    (name "go-github-com-chromedp-sysutil")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chromedp/sysutil")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vczhxgnvfkw1h12rbyyllcgwa1rmhn5x4iq20sm7dld26rglh5b"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chromedp/sysutil"))
    (home-page "https://github.com/chromedp/sysutil")
    (synopsis "About sysutil")
    (description
     "Package sysutil provides some utilities for working with cross platform systems.")
    (license license:expat)))

(define-public go-github-com-chromedp-cdproto-0.0.0-20230802225258-3cf4e6d46a89
  (package
    (name "go-github-com-chromedp-cdproto")
    (version "0.0.0-20230802225258-3cf4e6d46a89")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chromedp/cdproto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a9r4v2j6mjibzcs9nrqy4gfdaaiwj097cr3rmfmnflx1230gg4h"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chromedp/cdproto"))
    (propagated-inputs (list go-github-com-chromedp-sysutil-1.0.0
                             go-github-com-mailru-easyjson-0.7.7))
    (home-page "https://github.com/chromedp/cdproto")
    (synopsis "About cdproto")
    (description
     "Package cdproto provides the Chrome @code{DevTools} Protocol commands, types,
and events for the cdproto domain.")
    (license license:expat)))

(define-public go-github-com-gobwas-httphead-0.1.0
  (package
    (name "go-github-com-gobwas-httphead")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gobwas/httphead")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "106l8ml5yihld3rrf45q5fhlsx64hrpj2dsvnnm62av4ya5nf0gb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gobwas/httphead"))
    (home-page "https://github.com/gobwas/httphead")
    (synopsis "httphead.")
    (description
     "Package httphead contains utils for parsing HTTP and HTTP-grammar compatible
text protocols headers.")
    (license license:expat)))

(define-public go-github-com-gobwas-pool-0.2.1
  (package
    (name "go-github-com-gobwas-pool")
    (version "0.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gobwas/pool")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0imipsf8nslc78in78wcri2ir2zzajp2h543dp2cshrrdbwkybx7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gobwas/pool"))
    (home-page "https://github.com/gobwas/pool")
    (synopsis "pool")
    (description
     "Package pool contains helpers for pooling structures distinguishable by size.")
    (license license:expat)))

(define-public go-github-com-gobwas-ws-1.2.1
  (package
    (name "go-github-com-gobwas-ws")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gobwas/ws")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15ysfvfpxsp8had78z3nl0kg2m1rd762c5226ngj65gbv0lin2vs"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gobwas/ws"))
    (propagated-inputs (list go-github-com-gobwas-httphead-0.1.0
                             go-github-com-gobwas-pool-0.2.1))
    (home-page "https://github.com/gobwas/ws")
    (synopsis "ws")
    (description
     "Package ws implements a client and server for the @code{WebSocket} protocol as
specified in @@url{https://rfc-editor.org/rfc/rfc6455.html,RFC 6455}.")
    (license license:expat)))

(define-public go-github-com-ledongthuc-pdf-0.0.0-20220302134840-0c2507a12d80
  (package
    (name "go-github-com-ledongthuc-pdf")
    (version "0.0.0-20220302134840-0c2507a12d80")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ledongthuc/pdf")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "143w5b4ggcamjm3ggvxjj6xa90b09gmxb07rxynbc40y9b9ql33b"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/ledongthuc/pdf"))
    (home-page "https://github.com/ledongthuc/pdf")
    (synopsis "PDF Reader")
    (description "Package pdf implements reading of PDF files.")
    (license license:bsd-3)))

(define-public go-github-com-josharian-intern-1.0.0
  (package
    (name "go-github-com-josharian-intern")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/josharian/intern")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1za48ppvwd5vg8vv25ldmwz1biwpb3p6qhf8vazhsfdg9m07951c"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/josharian/intern"))
    (home-page "https://github.com/josharian/intern")
    (synopsis #f)
    (description
     "Package intern interns strings.  Interning is best effort only.  Interned
strings may be removed automatically at any time without notification.  All
functions may be called concurrently with themselves and each other.")
    (license license:expat)))

(define-public go-github-com-mailru-easyjson-0.7.7
  (package
    (name "go-github-com-mailru-easyjson")
    (version "0.7.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mailru/easyjson")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0clifkvvy8f45rv3cdyv58dglzagyvfcqb63wl6rij30c5j2pzc1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mailru/easyjson"))
    (propagated-inputs (list go-github-com-josharian-intern-1.0.0))
    (home-page "https://github.com/mailru/easyjson")
    (synopsis "easyjson")
    (description
     "Package easyjson contains marshaler/unmarshaler interfaces and helper functions.")
    (license license:expat)))

(define-public go-github-com-orisano-pixelmatch-0.0.0-20220722002657-fb0b55479cde
  (package
    (name "go-github-com-orisano-pixelmatch")
    (version "0.0.0-20220722002657-fb0b55479cde")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/orisano/pixelmatch")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16ps7x2cv5g6mhiiacar9njxw3a59hvi8bm145p7wgi725336dfr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/orisano/pixelmatch"))
    (home-page "https://github.com/orisano/pixelmatch")
    (synopsis "pixelmatch")
    (description
     "@@url{https://github.com/mapbox/pixelmatch,mapbox/pixelmatch} ports for go.")
    (license license:expat)))

(define-public go-github-com-chromedp-chromedp-0.9.2
  (package
    (name "go-github-com-chromedp-chromedp")
    (version "0.9.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chromedp/chromedp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1im3zr1mvjvxdxj5zgcxw9jfskhkvxvcm5hi4blsyggbw8fy2xvc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chromedp/chromedp"))
    (propagated-inputs (list
                        go-github-com-chromedp-cdproto-0.0.0-20230802225258-3cf4e6d46a89
                        go-github-com-gobwas-ws-1.2.1
                        go-github-com-ledongthuc-pdf-0.0.0-20220302134840-0c2507a12d80
                        go-github-com-mailru-easyjson-0.7.7
                        go-github-com-orisano-pixelmatch-0.0.0-20220722002657-fb0b55479cde))
    (home-page "https://github.com/chromedp/chromedp")
    (synopsis "About chromedp")
    (description
     "Package chromedp is a high level Chrome @code{DevTools} Protocol client that
simplifies driving browsers for scraping, unit testing, or profiling web pages
using the CDP.")
    (license license:expat)))

(define-public go-github-com-chzyer-test-1.0.0
  (package
    (name "go-github-com-chzyer-test")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chzyer/test")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1axdlcnx2qjsn5wsr2pr1m0w0a8k4nk5kkrngh742fgh81vzzy8s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chzyer/test"))
    (propagated-inputs (list go-github-com-chzyer-logex-1.2.1))
    (home-page "https://github.com/chzyer/test")
    (synopsis "test")
    (description #f)
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20220310020820-b874c991c1a5
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20220310020820-b874c991c1a5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0lsh3vr37ggs8p2k4y9ihin8acr72bi489s5b8kv19bx35j9x3k5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-chzyer-logex-1.2.1
  (package
    (name "go-github-com-chzyer-logex")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chzyer/logex")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c9yr3r7dl3lcs22cvmh9iknihi9568wzmdywmc2irkjdrn8bpxw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chzyer/logex"))
    (home-page "https://github.com/chzyer/logex")
    (synopsis "Logex")
    (description
     "An golang log lib, supports tracing and level, wrap by standard log lib.")
    (license license:expat)))

(define-public go-github-com-chzyer-readline-1.5.1
  (package
    (name "go-github-com-chzyer-readline")
    (version "1.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chzyer/readline")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1msh9qcm7l1idpmfj4nradyprsr86yhk9ch42yxz7xsrybmrs0pb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chzyer/readline"))
    (propagated-inputs (list go-github-com-chzyer-logex-1.2.1
                        go-github-com-chzyer-test-1.0.0
                        go-golang-org-x-sys-0.0.0-20220310020820-b874c991c1a5))
    (home-page "https://github.com/chzyer/readline")
    (synopsis "Guide")
    (description
     "Readline is a pure go implementation for GNU-Readline kind library.")
    (license license:expat)))

(define-public go-github-com-ianlancetaylor-demangle-0.0.0-20240312041847-bd984b5ce465
  (package
    (name "go-github-com-ianlancetaylor-demangle")
    (version "0.0.0-20240312041847-bd984b5ce465")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ianlancetaylor/demangle")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1g52ly5xpfx49c03cj2gac03pg1dvmsa7fkp85f9n4jz27j486gj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/ianlancetaylor/demangle"))
    (home-page "https://github.com/ianlancetaylor/demangle")
    (synopsis "github.com/ianlancetaylor/demangle")
    (description
     "Package demangle defines functions that demangle GCC/LLVM C++ and Rust symbol
names.  This package recognizes names that were mangled according to the C++ ABI
defined at
@@url{http://codesourcery.com/cxx-abi/,http://codesourcery.com/cxx-abi/} and the
Rust ABI defined at
@@url{https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.html,https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.html}.")
    (license license:bsd-3)))

(define-public go-github-com-google-pprof-0.0.0-20240424215950-a892ee059fd6
  (package
    (name "go-github-com-google-pprof")
    (version "0.0.0-20240424215950-a892ee059fd6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/pprof")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jall6iqj0341inrdh8slzh2nbw40wawyxqyhllam90g28hy0jas"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/pprof"))
    (propagated-inputs (list go-github-com-chromedp-chromedp-0.9.2
                        go-github-com-chzyer-readline-1.5.1
                        go-github-com-ianlancetaylor-demangle-0.0.0-20240312041847-bd984b5ce465))
    (home-page "https://github.com/google/pprof")
    (synopsis "Introduction")
    (description
     "pprof is a tool for collection, manipulation and visualization of performance
profiles.")
    (license license:asl2.0)))

(define-public go-github-com-go-logr-logr-1.4.1
  (package
    (name "go-github-com-go-logr-logr")
    (version "1.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-logr/logr")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x0q9jkk2p5pz4lii1qs8ifnsib4ib5s8pigmjwdmagl976g8nhm"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-logr/logr"))
    (home-page "https://github.com/go-logr/logr")
    (synopsis "A minimal logging API for Go")
    (description
     "Package logr defines a general-purpose logging API and abstract interfaces to
back that API. Packages in the Go ecosystem can depend on this package, while
callers can implement logging with whatever backend is appropriate.")
    (license license:asl2.0)))

(define-public go-github-com-go-logr-logr-1.2.4
  (package
    (name "go-github-com-go-logr-logr")
    (version "1.2.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-logr/logr")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ara5lacbzwqw8m6800837jgf5gbcfj6namm0zwzb45xqgfl64c0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-logr/logr"))
    (home-page "https://github.com/go-logr/logr")
    (synopsis "A minimal logging API for Go")
    (description
     "Package logr defines a general-purpose logging API and abstract interfaces to
back that API. Packages in the Go ecosystem can depend on this package, while
callers can implement logging with whatever backend is appropriate.")
    (license license:asl2.0)))

(define-public go-github-com-stretchr-testify-1.6.1
  (package
    (name "go-github-com-stretchr-testify")
    (version "1.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/testify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1yhiqqzjvi63pf01rgzx68gqkkvjx03fvl5wk30br5l6s81s090l"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/testify"))
    (propagated-inputs (list go-github-com-davecgh-go-spew-1.1.0
                        go-github-com-pmezard-go-difflib-1.0.0
                        go-github-com-stretchr-objx-0.1.0
                        go-gopkg-in-yaml-v3))
    (home-page "https://github.com/stretchr/testify")
    (synopsis "Testify - Thou Shalt Write Tests")
    (description
     "Module testify is a set of packages that provide many tools for testifying that
your code will behave as you intend.")
    (license license:expat)))

(define-public go-github-com-go-task-slim-sprig-0.0.0-20230315185526-52ccab3ef572
  (package
    (name "go-github-com-go-task-slim-sprig")
    (version "0.0.0-20230315185526-52ccab3ef572")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-task/slim-sprig")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1y65slzh0xwb22w5n8f96hx3blwbp04whcyw6mvjwq6w0q4n78qg"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-task/slim-sprig"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.6.1))
    (home-page "https://github.com/go-task/slim-sprig")
    (synopsis "Sprig: Template functions for Go templates")
    (description "Sprig: Template functions for Go.")
    (license license:expat)))

(define-public go-github-com-golang-protobuf-1.5.3
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.5.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03f1w2cd4s8a3xhl61x7yjx81kbzlrjpvnnwmbhqnz814yi7h43i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.5.5
                             go-google-golang-org-protobuf-1.26.0))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-github-com-google-go-cmp-0.5.9
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.5.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-cmp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a13m7l1jrysa7mrlmra8y7n83zcnb23yjyg3a609p8i9lxkh1wm"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-cmp"))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
     "This package is intended to be a more powerful and safer alternative to
@@code{reflect.@code{DeepEqual}} for comparing whether two values are
semantically equal.")
    (license license:bsd-3)))

(define-public go-github-com-go-logr-logr-1.2.3
  (package
    (name "go-github-com-go-logr-logr")
    (version "1.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-logr/logr")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1148cph7c9qxjvng94a90szpbm2m5dj4pvllbsjqvgqj5j8prwip"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-logr/logr"))
    (home-page "https://github.com/go-logr/logr")
    (synopsis "A minimal logging API for Go")
    (description
     "Package logr defines a general-purpose logging API and abstract interfaces to
back that API. Packages in the Go ecosystem can depend on this package, while
callers can implement logging with whatever backend is appropriate.")
    (license license:asl2.0)))

(define-public go-github-com-chzyer-readline-0.0.0-20180603132655-2972be24d48e
  (package
    (name "go-github-com-chzyer-readline")
    (version "0.0.0-20180603132655-2972be24d48e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chzyer/readline")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "104q8dazj8yf6b089jjr82fy9h1g80zyyzvp3g8b44a7d8ngjj6r"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chzyer/readline"))
    (home-page "https://github.com/chzyer/readline")
    (synopsis "Guide")
    (description
     "Readline is a pure go implementation for GNU-Readline kind library.")
    (license license:expat)))

(define-public go-github-com-ianlancetaylor-demangle-0.0.0-20200824232613-28f6c0f3b639
  (package
    (name "go-github-com-ianlancetaylor-demangle")
    (version "0.0.0-20200824232613-28f6c0f3b639")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ianlancetaylor/demangle")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rsq3622gd40f1x1l7caidsxrmzg1993ich2higwd94fqbxs1r83"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/ianlancetaylor/demangle"))
    (home-page "https://github.com/ianlancetaylor/demangle")
    (synopsis "github.com/ianlancetaylor/demangle")
    (description
     "Package demangle defines functions that demangle GCC/LLVM C++ and Rust symbol
names.  This package recognizes names that were mangled according to the C++ ABI
defined at
@@url{http://codesourcery.com/cxx-abi/,http://codesourcery.com/cxx-abi/} and the
Rust ABI defined at
@@url{https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.html,https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.html}.")
    (license license:bsd-3)))

(define-public go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
  (package
    (name "go-github-com-google-pprof")
    (version "0.0.0-20210407192527-94a9f03dee38")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/pprof")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qx545a5xsfamdbl3x7b149sh0043s377ikhrcdy5rdprs5bbbl3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/pprof"))
    (propagated-inputs (list
                        go-github-com-chzyer-readline-0.0.0-20180603132655-2972be24d48e
                        go-github-com-ianlancetaylor-demangle-0.0.0-20200824232613-28f6c0f3b639))
    (home-page "https://github.com/google/pprof")
    (synopsis "Introduction")
    (description
     "pprof is a tool for collection, manipulation and visualization of performance
profiles.")
    (license license:asl2.0)))

(define-public go-google-golang-org-protobuf-1.26.0
  (package
    (name "go-google-golang-org-protobuf")
    (version "1.26.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xq6phaps6d0vcv13ga59gzj4306l0ki9kikhmb52h6pq0iwfqlz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.0
                             go-github-com-google-go-cmp-0.5.5))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-golang-protobuf-1.5.2
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mh5fyim42dn821nsd3afnmgscrzzhn3h8rag635d2jnr23r1zhk"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.5.5
                             go-google-golang-org-protobuf-1.26.0))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-github-com-stretchr-testify-1.5.1
  (package
    (name "go-github-com-stretchr-testify")
    (version "1.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/testify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09r89m1wy4cjv2nps1ykp00qjpi0531r07q3s34hr7m6njk4srkl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/testify"))
    (propagated-inputs (list go-github-com-davecgh-go-spew-1.1.0
                             go-github-com-pmezard-go-difflib-1.0.0
                             go-github-com-stretchr-objx-0.1.0
                             go-gopkg-in-yaml-v2))
    (home-page "https://github.com/stretchr/testify")
    (synopsis "Testify - Thou Shalt Write Tests")
    (description
     "Module testify is a set of packages that provide many tools for testifying that
your code will behave as you intend.")
    (license license:expat)))

(define-public go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
  (package
    (name "go-github-com-go-task-slim-sprig")
    (version "0.0.0-20210107165309-348f09dbbbc0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-task/slim-sprig")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16i1w4sm1h8wd132gdaq1z0asj9nc36zs8b3q9jy5kcbjzidl34f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-task/slim-sprig"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.5.1))
    (home-page "https://github.com/go-task/slim-sprig")
    (synopsis "Sprig: Template functions for Go templates")
    (description "Sprig: Template functions for Go.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20191005200804-aed5e4c7ecf9
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20191005200804-aed5e4c7ecf9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wsdsbl9n61l99z0cvib2xzg56fsfgky4yc5xapdw9ywx9h0zm3a"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-fsnotify-fsnotify-1.4.9
  (package
    (name "go-github-com-fsnotify-fsnotify")
    (version "1.4.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fsnotify/fsnotify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i1r72knpbfwwql9frn9bqc3nhfc2ai5m6qllcyr6wban62lr40x"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/fsnotify/fsnotify"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20191005200804-aed5e4c7ecf9))
    (home-page "https://github.com/fsnotify/fsnotify")
    (synopsis "Usage")
    (description
     "Package fsnotify provides a cross-platform interface for file system
notifications.")
    (license license:bsd-3)))

(define-public go-github-com-nxadm-tail-1.4.8
  (package
    (name "go-github-com-nxadm-tail")
    (version "1.4.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nxadm/tail")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1j2gi485fhwdpmyzn42wk62103fclwbfywg42p275z1qv2bsz1rc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/nxadm/tail"))
    (propagated-inputs (list go-github-com-fsnotify-fsnotify-1.4.9
                        go-gopkg-in-tomb-v1))
    (home-page "https://github.com/nxadm/tail")
    (synopsis "tail functionality in Go")
    (description
     "nxadm/tail provides a Go library that emulates the features of the BSD `tail`
program.  The library comes with full support for truncation/move detection as
it is designed to work with log rotation tools.  The library works on all
operating systems supported by Go, including POSIX systems like Linux and *BSD,
and MS Windows.  Go 1.9 is the oldest compiler release supported.")
    (license license:expat)))

(define-public go-github-com-google-go-cmp-0.3.0
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-cmp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hyxx3434zshl2m9ja78gwlkg1rx9yl6diqa7dnjb31xz5x4gbjj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-cmp"))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
     "This package is intended to be a more powerful and safer alternative to
@@code{reflect.@code{DeepEqual}} for comparing whether two values are
semantically equal.")
    (license license:bsd-3)))

(define-public go-google-golang-org-protobuf-0.0.0-20200109180630-ec00e32a8dfd
  (package
    (name "go-google-golang-org-protobuf")
    (version "0.0.0-20200109180630-ec00e32a8dfd")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0w6lp9w2avxcpxwzzhspr209ifhyjagvs23k0vykfdqahl1aplrh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.3.0))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-golang-protobuf-1.4.0-rc.1
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.4.0-rc.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "186rirvbfgv6hrxp27ipx2cdpv19qifdd20biqfdm01wiyclqimn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.3.1
                        go-google-golang-org-protobuf-0.0.0-20200109180630-ec00e32a8dfd))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-github-com-google-go-cmp-0.3.1
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-cmp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1caw49i0plkjxir7kdf5qhwls3krqwfmi7g4h392rdfwi3kfahx1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-cmp"))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
     "This package is intended to be a more powerful and safer alternative to
@@code{reflect.@code{DeepEqual}} for comparing whether two values are
semantically equal.")
    (license license:bsd-3)))

(define-public go-google-golang-org-protobuf-0.0.0-20200221191635-4d8936d0db64
  (package
    (name "go-google-golang-org-protobuf")
    (version "0.0.0-20200221191635-4d8936d0db64")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0563bsvdjj6k0sgwqd5yzrgfiax7sp3lcwh608gync5sv9fx39cy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.4.0-rc.1
                             go-github-com-google-go-cmp-0.3.1))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-golang-protobuf-1.4.0-rc.1.0.20200221234624-67d41d38c208
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.4.0-rc.1.0.20200221234624-67d41d38c208")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ykxhg3zixmw25pd435f8h16wnz1g00jpcmmg3xl030kksgqgpp6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.4.0
                        go-google-golang-org-protobuf-0.0.0-20200221191635-4d8936d0db64))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-google-golang-org-protobuf-0.0.0-20200228230310-ab0ca4ff8a60
  (package
    (name "go-google-golang-org-protobuf")
    (version "0.0.0-20200228230310-ab0ca4ff8a60")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rinspcznfp85yz4vrlf4h38hr576virgv8lcs22bsylqga808sd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list
                        go-github-com-golang-protobuf-1.4.0-rc.1.0.20200221234624-67d41d38c208
                        go-github-com-google-go-cmp-0.4.0))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-golang-protobuf-1.4.0-rc.2
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.4.0-rc.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hd43hjv5zl6bjbmhm5phx74bw4xajsi73m5zky2k56za4mpgzzc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.4.0
                        go-google-golang-org-protobuf-0.0.0-20200228230310-ab0ca4ff8a60))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-google-golang-org-protobuf-1.20.1-0.20200309200217-e05f789c0967
  (package
    (name "go-google-golang-org-protobuf")
    (version "1.20.1-0.20200309200217-e05f789c0967")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17wmy89hnmpkwc63rfcjp50q15s9f1rhmczg06c3z9yy41zk82w9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.4.0-rc.2
                             go-github-com-google-go-cmp-0.4.0))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-golang-protobuf-1.4.0-rc.4.0.20200313231945-b860323f09d0
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.4.0-rc.4.0.20200313231945-b860323f09d0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zj6cwshx0l5n9cn2cpbikzzb79px5dmkpc4p19zy1iif5r5p0z0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.4.0
                        go-google-golang-org-protobuf-1.20.1-0.20200309200217-e05f789c0967))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-google-golang-org-protobuf-1.21.0
  (package
    (name "go-google-golang-org-protobuf")
    (version "1.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12bwln8z1lf9105gdp6ip0rx741i4yfz1520gxnp8861lh9wcl63"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list
                        go-github-com-golang-protobuf-1.4.0-rc.4.0.20200313231945-b860323f09d0
                        go-github-com-google-go-cmp-0.4.0))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-golang-protobuf-1.4.0
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fjvl5n77abxz5qsd4mgyvjq19x43c5bfvmq62mq3m5plx6zksc8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.4.0
                             go-google-golang-org-protobuf-1.21.0))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-github-com-google-go-cmp-0.4.0
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-cmp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1x5pvl3fb5sbyng7i34431xycnhmx8xx94gq2n19g6p0vz68z2v2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-cmp"))
    (propagated-inputs (list
                        go-golang-org-x-xerrors-0.0.0-20191204190536-9bdfabe68543))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
     "This package is intended to be a more powerful and safer alternative to
@@code{reflect.@code{DeepEqual}} for comparing whether two values are
semantically equal.")
    (license license:bsd-3)))

(define-public go-google-golang-org-protobuf-1.23.0
  (package
    (name "go-google-golang-org-protobuf")
    (version "1.23.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03yan0m1v0zmlr935p4n24fd376mznsg85zy8sywbgisls4s1bzy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.4.0
                             go-github-com-google-go-cmp-0.4.0))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-golang-protobuf-1.4.2
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0m5z81im4nsyfgarjhppayk4hqnrwswr3nix9mj8pff8x9jvcjqw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.4.0
                             go-google-golang-org-protobuf-1.23.0))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-github-com-fsnotify-fsnotify-1.4.7
  (package
    (name "go-github-com-fsnotify-fsnotify")
    (version "1.4.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fsnotify/fsnotify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07va9crci0ijlivbb7q57d2rz9h27zgn2fsm60spjsqpdbvyrx4g"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/fsnotify/fsnotify"))
    (home-page "https://github.com/fsnotify/fsnotify")
    (synopsis "Usage")
    (description
     "Package fsnotify provides a cross-platform interface for file system
notifications.")
    (license license:bsd-3)))

(define-public go-github-com-nxadm-tail-1.4.4
  (package
    (name "go-github-com-nxadm-tail")
    (version "1.4.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nxadm/tail")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1czmwqii0fc8v3ar5bwqpfanprkxg19waly405zlvcflzvj53wwc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/nxadm/tail"))
    (propagated-inputs (list go-github-com-fsnotify-fsnotify-1.4.7
                        go-gopkg-in-tomb-v1))
    (home-page "https://github.com/nxadm/tail")
    (synopsis "tail functionality in Go")
    (description
     "nxadm/tail provides a Go library that emulates the features of the BSD `tail`
program.  The library comes with full support for truncation/move detection as
it is designed to work with log rotation tools.  The library works on all
operating systems supported by Go, including POSIX systems like Linux and *BSD,
and MS Windows.  Go 1.9 is the oldest compiler release supported.")
    (license license:expat)))

(define-public go-github-com-golang-protobuf-1.2.0
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kf4b59rcbb1cchfny2dm9jyznp8ri2hsb14n8iak1q8986xa0ab"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-1.6.0
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x0gc89vgq38xhgmi2h22bhr73cf2gmk42g89nz89k8dgg9hhr25"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo"))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo 2.0 Release Candidate is available!")
    (description "Ginkgo is a BDD-style testing framework for Golang.")
    (license license:expat)))

(define-public go-golang-org-x-net-0.0.0-20180906233101-161cd47e91fd
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20180906233101-161cd47e91fd")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0254ld010iijygbzykib2vags1dc0wlmcmhgh4jl8iny159lhbcv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.7.1
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "06p3x0910cdaa64l7d44s728d4j3yhps315dlcvrbjzhljjj7mam"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.2.0
                        go-github-com-onsi-ginkgo-1.6.0
                        go-golang-org-x-net-0.0.0-20180906233101-161cd47e91fd
                        go-gopkg-in-yaml-v2))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20191120155948-bd437916bb0e
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20191120155948-bd437916bb0e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i8x26frmlin55k69k936zd1rp5sqnq14y5ms4rkxbfzhasdm2rx"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-1.12.1
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "1.12.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xs9724l2b0bwjwrvw5cs3akxaw0n1j5kyxrb1ggfsdjz0zmjcxh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-nxadm-tail-1.4.4
                        go-github-com-onsi-gomega-1.7.1
                        go-golang-org-x-sys-0.0.0-20191120155948-bd437916bb0e))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo 2.0 Release Candidate is available!")
    (description "Ginkgo is a BDD-style testing framework for Golang.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20200323222414-85ca7c5b95cd
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20200323222414-85ca7c5b95cd")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1504qkgbhhm4f0bhk77v2r1lj6x171ay5m79alkg78wjb5cign5l"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.0.0-20200520004742-59133d7f0dd7
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20200520004742-59133d7f0dd7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03js31gnf3hir5dh6q01bj7cs0y4wzyinqg1mvr0nlb83kak9ggq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-crypto-0.0.0-20190308221718-c2843e01d9a2
                        go-golang-org-x-sys-0.0.0-20200323222414-85ca7c5b95cd
                        go-golang-org-x-text-0.3.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.10.1
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.10.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "068mirdbwl9n9dqlvqr489h52wkd90cv1jvng4yp8kv83lhzk2dq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.4.2
                        go-github-com-onsi-ginkgo-1.12.1
                        go-golang-org-x-net-0.0.0-20200520004742-59133d7f0dd7
                        go-golang-org-x-xerrors-0.0.0-20191204190536-9bdfabe68543
                        go-gopkg-in-yaml-v2))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20210112080510-489259a85091
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20210112080510-489259a85091")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n31mqjwz6v53v6sqxxkfkmvp095c8p81iafy0bsj936chr9pa3h"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-1.16.4
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "1.16.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rpzh0vg2k33szcq17rdwjvj3q6djp7vqfvasck40gsibadimnd7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-nxadm-tail-1.4.8
                        go-github-com-onsi-gomega-1.10.1
                        go-golang-org-x-sys-0.0.0-20210112080510-489259a85091
                        go-golang-org-x-tools-0.0.0-20201224043029-2b0845dc783e))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo 2.0 Release Candidate is available!")
    (description "Ginkgo is a BDD-style testing framework for Golang.")
    (license license:expat)))

(define-public go-golang-org-x-net-0.0.0-20210428140749-89ef3d95e781
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20210428140749-89ef3d95e781")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1yih23qrdmm6qmr29gmga6l8pi0qyf10m6fqh4jqvss27lxiam8s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20210423082822-04245dca01da
                        go-golang-org-x-term-0.0.0-20201126162022-7de9c90e9dd1
                        go-golang-org-x-text-0.3.6))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.17.0
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01lxf1ai4grd7akdgrc50rb2g2c5drrc067acndccxzxidi43grh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.2
                        go-github-com-onsi-ginkgo-1.16.4
                        go-golang-org-x-net-0.0.0-20210428140749-89ef3d95e781
                        go-gopkg-in-yaml-v2))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-github-com-yuin-goldmark-1.2.1
  (package
    (name "go-github-com-yuin-goldmark")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yuin/goldmark")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12rsnsf65drcp0jfw2jl9w589vsn3pxdk1zh3v9q908iigngrcmy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/yuin/goldmark"))
    (home-page "https://github.com/yuin/goldmark")
    (synopsis "goldmark")
    (description
     "Package goldmark implements functions to convert markdown text to a desired
format.")
    (license license:expat)))

(define-public go-golang-org-x-crypto-0.0.0-20191011191535-87dc89f01550
  (package
    (name "go-golang-org-x-crypto")
    (version "0.0.0-20191011191535-87dc89f01550")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0z4i1m2yn3f31ci7wvcm2rxkx2yiv7a78mfzklncmsz2k97rlh2g"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list
                        go-golang-org-x-net-0.0.0-20190404232315-eb5bcb51f2a3
                        go-golang-org-x-sys-0.0.0-20190412213103-97732733099d))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.3.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ldgbx2zpprbsfn6p8pfgs4nn87gwbfcv2z0fa7n8alwsq2yw78q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list
                        go-golang-org-x-crypto-0.0.0-20191011191535-87dc89f01550
                        go-golang-org-x-tools-0.0.0-20191119224855-298f0cb1881e
                        go-golang-org-x-xerrors-0.0.0-20191011141410-1b5146add898))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.0.0-20190404232315-eb5bcb51f2a3
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20190404232315-eb5bcb51f2a3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17k4g8krxbl84gzcs275b7gsh66dzm15fdxivjnx9xz8q84l4kby"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-crypto-0.0.0-20190308221718-c2843e01d9a2
                        go-golang-org-x-text-0.3.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.0.0-20190412213103-97732733099d
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20190412213103-97732733099d")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "118hkp01i4z1f5h6hcjm0ff2ngqhrzj1f7731n0kw8dr6hvbx0sw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.0.0-20200622213623-75b288015ac9
  (package
    (name "go-golang-org-x-crypto")
    (version "0.0.0-20200622213623-75b288015ac9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18vlncvvs11ds3zaaziqjlg5s2vcwi3496nn6qv7p0dp94j5pwa2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list
                        go-golang-org-x-net-0.0.0-20190404232315-eb5bcb51f2a3
                        go-golang-org-x-sys-0.0.0-20190412213103-97732733099d))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.0.0-20200930185726-fdedc70b468f
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20200930185726-fdedc70b468f")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1njlfhjbvi4lxvjbq8zswrb0y0q4jd2p6x51h1q6vmyzi9af6869"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.0.0-20201021035429-f5854403a974
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20201021035429-f5854403a974")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vw63zpmhi337f3gc432x3wkib4j2ia8dy7if31wxwb9dgqvy222"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-crypto-0.0.0-20200622213623-75b288015ac9
                        go-golang-org-x-sys-0.0.0-20200930185726-fdedc70b468f
                        go-golang-org-x-text-0.3.3))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.0.0-20201020160332-67f06af15bc9
  (package
    (name "go-golang-org-x-sync")
    (version "0.0.0-20201020160332-67f06af15bc9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "093p4panc808ak5bamzz7m9nb0xxib7778jpnr6f0xkz1n4fzyw5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.0.0-20201224043029-2b0845dc783e
  (package
    (name "go-golang-org-x-tools")
    (version "0.0.0-20201224043029-2b0845dc783e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hn6rbmyhdxfff56iz16yvaxzp6xzz9bc49h106v8rh78iclh7kc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.2.1
                        go-golang-org-x-mod-0.3.0
                        go-golang-org-x-net-0.0.0-20201021035429-f5854403a974
                        go-golang-org-x-sync-0.0.0-20201020160332-67f06af15bc9
                        go-golang-org-x-xerrors-0.0.0-20200804184101-5ec99f83aff1))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.1.3
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dwn62p50fj4gm09g5rfhb510wmwwnycslr0gfpdxkbx74sbbsdb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.17.0
                        go-golang-org-x-sys-0.0.0-20210423082822-04245dca01da
                        go-golang-org-x-tools-0.0.0-20201224043029-2b0845dc783e))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-net-0.0.0-20220225172249-27dd8689420f
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20220225172249-27dd8689420f")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dnim0apnq6lmbmzqbv223vclqk1nbbg7j4id19cf75amwhcwag1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20211216021012-1d35b9e2eb4e
                        go-golang-org-x-term-0.0.0-20210927222741-03fcf44c2211
                        go-golang-org-x-text-0.3.7))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.19.0
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "092phwk97sk4sv0nbx5pfhqs6x3x1lnrjwyda1m6b6zwrfmq5c6i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.2
                        go-github-com-onsi-ginkgo-v2
                        go-golang-org-x-net-0.0.0-20220225172249-27dd8689420f
                        go-gopkg-in-yaml-v2))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20220319134239-a9b59b0215f8
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20220319134239-a9b59b0215f8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pdfnkz6ysi1bx98hgk27wpngs8liawja9adpvbb3ay9223hmaiy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-yuin-goldmark-1.4.1
  (package
    (name "go-github-com-yuin-goldmark")
    (version "1.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yuin/goldmark")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16pal7a57878lxk4qa587r3w0h2finm69h791wgqy6x51vs70wlr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/yuin/goldmark"))
    (home-page "https://github.com/yuin/goldmark")
    (synopsis "goldmark")
    (description
     "Package goldmark implements functions to convert markdown text to a desired
format.")
    (license license:expat)))

(define-public go-golang-org-x-xerrors-0.0.0-20191011141410-1b5146add898
  (package
    (name "go-golang-org-x-xerrors")
    (version "0.0.0-20191011141410-1b5146add898")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/xerrors")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0w2akj91krxjag0xdhsg78470888nicc5ismc2ap9jqpss6v1zih"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/xerrors"))
    (home-page "https://golang.org/x/xerrors")
    (synopsis #f)
    (description "Package xerrors implements functions to manipulate errors.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.6.0-dev.0.20220106191415-9b9b3d81d5e3
  (package
    (name "go-golang-org-x-mod")
    (version "0.6.0-dev.0.20220106191415-9b9b3d81d5e3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0z6ykbphvlq3qm2hs6jw2yqcpv6h838axax86p1aryjv1dv3zhjy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list
                        go-golang-org-x-crypto-0.0.0-20210921155107-089bfa567519
                        go-golang-org-x-tools-0.0.0-20191119224855-298f0cb1881e
                        go-golang-org-x-xerrors-0.0.0-20191011141410-1b5146add898))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.0.0-20211015210444-4f30a5c0130f
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20211015210444-4f30a5c0130f")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zwq1blr55kaskqaq423ciwp5p9ka6wqmc7vi38y4h9b8aq3vang"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20210423082822-04245dca01da
                        go-golang-org-x-term-0.0.0-20201126162022-7de9c90e9dd1
                        go-golang-org-x-text-0.3.6))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.0.0-20210220032951-036812b2e83c
  (package
    (name "go-golang-org-x-sync")
    (version "0.0.0-20210220032951-036812b2e83c")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gl202py3s4gl6arkaxlf8qa6f0jyyg2f95m6f89qnfmr416h85b"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.0.0-20211019181941-9d821ace8654
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20211019181941-9d821ace8654")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "118wvggm5h7hnx61wlg8mr3gvj76775126ic6hq0bsgbggzd4cm7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-xerrors-0.0.0-20200804184101-5ec99f83aff1
  (package
    (name "go-golang-org-x-xerrors")
    (version "0.0.0-20200804184101-5ec99f83aff1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/xerrors")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dbzc3gmf2haazpv7cgmv97rq40g2xzwbglc17vas8dwhgwgwrzb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/xerrors"))
    (home-page "https://golang.org/x/xerrors")
    (synopsis #f)
    (description "Package xerrors implements functions to manipulate errors.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.1.10
  (package
    (name "go-golang-org-x-tools")
    (version "0.1.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1aayyzraia15vmq3df3vnqsrihpzdkwrgk7byasjasv1ypzpxgdg"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.1
                        go-golang-org-x-mod-0.6.0-dev.0.20220106191415-9b9b3d81d5e3
                        go-golang-org-x-net-0.0.0-20211015210444-4f30a5c0130f
                        go-golang-org-x-sync-0.0.0-20210220032951-036812b2e83c
                        go-golang-org-x-sys-0.0.0-20211019181941-9d821ace8654
                        go-golang-org-x-text-0.3.7
                        go-golang-org-x-xerrors-0.0.0-20200804184101-5ec99f83aff1))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.1.4
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1973axfmywz2fxzqr3m7xgfjh2sv8dr9rz8f4hirl47054k4xig4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.19.0
                        go-golang-org-x-sys-0.0.0-20220319134239-a9b59b0215f8
                        go-golang-org-x-tools-0.1.10))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20211216021012-1d35b9e2eb4e
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20211216021012-1d35b9e2eb4e")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09xmnw6hhpqnakm99xxigg0znbx46f084lpacz67p5rbcdngjxis"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.0.0-20220425223048-2871e0cb64e4
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20220425223048-2871e0cb64e4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0m8r3bb534yinay53a9yanyg27mvyxb2jxb6vyrfxvbxz5g0gsb7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20211216021012-1d35b9e2eb4e
                        go-golang-org-x-term-0.0.0-20210927222741-03fcf44c2211
                        go-golang-org-x-text-0.3.7))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.20.1
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.20.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1p2l8516clyqhglnglxpxyckw4lj477k0ap1q4zpc7k3ba7z2n0w"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.2
                        go-github-com-google-go-cmp-0.5.8
                        go-github-com-onsi-ginkgo-v2
                        go-golang-org-x-net-0.0.0-20220425223048-2871e0cb64e4
                        go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-github-com-onsi-ginkgo-2.1.6
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ki33d4hnjdyamgqy11zwv6a75jv033ivzkm48ffdmfnfvbgs1sf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.20.1
                        go-golang-org-x-sys-0.0.0-20220722155257-8c9f86f7a55f
                        go-golang-org-x-tools-0.1.12))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-github-com-onsi-gomega-1.21.1
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.21.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bw3b5q11l3p4bjw1rjlwyq830cykgq0g36ad0bahxsll3dn9w00"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.2
                        go-github-com-google-go-cmp-0.5.8
                        go-github-com-onsi-ginkgo-v2
                        go-golang-org-x-net-0.0.0-20220722155237-a158d28d115b
                        go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-github-com-onsi-ginkgo-2.3.0
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1j0zjyvil6ng3v5752k65rlbp1gmphxi49qrv41di2bcf5hqdbab"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.21.1
                        go-golang-org-x-sys-0.0.0-20220722155257-8c9f86f7a55f
                        go-golang-org-x-tools-0.1.12))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-github-com-onsi-gomega-1.22.1
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.22.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07spvcrnj65d529yhlwb45qpx4zdy60yz26vds9img08cdvl9g75"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.2
                        go-github-com-google-go-cmp-0.5.8
                        go-github-com-onsi-ginkgo-v2
                        go-golang-org-x-net-0.0.0-20220722155237-a158d28d115b
                        go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-github-com-onsi-ginkgo-2.4.0
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0817rvw8lgwjfydhjgmfcirfzjakpjn1bdd1d8iicjdl2h5r8rww"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.3
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.22.1
                        go-golang-org-x-sys-0.1.0
                        go-golang-org-x-tools-0.2.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-github-com-onsi-gomega-1.24.0
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.24.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0g3dp3kzm9i7sbg6dad2a9vrphqwpjjjxjm4sxf8zc0rnbin3sx4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.2
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.1.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-crypto-0.1.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1igzh43n27i0nijhmfp8g51ir0cq8cxjs4glb336l45rs9vyzhr2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.1.0
                             go-golang-org-x-sys-0.1.0
                             go-golang-org-x-term-0.1.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.6.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10vf1rpqqr6sz42gh9d6gbrdvjs8dvcaxmd77m5srscbjnyw1pxh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-crypto-0.1.0
                             go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.1.0
  (package
    (name "go-golang-org-x-term")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yf5cy52fns1aq6af3as5cfjwx689l6mjkrrpgn7bri3jaqcssai"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20210615035016-665e8c7367d1))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.1.0
  (package
    (name "go-golang-org-x-net")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wh3021id07rbjci8hm4nb2ljaaafmvi6x93lsca3cis30af3d2a"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-sys-0.1.0
                             go-golang-org-x-term-0.1.0
                             go-golang-org-x-text-0.4.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.1.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i0pl8cg4mrc6vg206frg6ji556kj3jwz1i29d9q4203n0ffvzif"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.2.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kw4rq0gx0lc50ipsdzhdi45hsdlzcbqjgwdz4fghfak01px3h79"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.6.0
                             go-golang-org-x-net-0.1.0
                             go-golang-org-x-sys-0.1.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.5.0
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18jvida3raflb3r4y10sa7z3q7gr6xa1nnrb97javb4zhyc9v5ld"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.3
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.24.0
                        go-golang-org-x-sys-0.1.0
                        go-golang-org-x-tools-0.2.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.2.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04ffvfsrrf7x758cgs6b3cjsq3gzgwjgxwm8f5475nx7jcrfan2d"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.2.0
  (package
    (name "go-golang-org-x-term")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01r1v0142bwv93dly8x8lk3753yji7bbkzd5mvpd9zr8knajadvb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.2.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.4.0
  (package
    (name "go-golang-org-x-text")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "010lcvxm8zbfh3bn8h0ivcjsr5qr7qvw6r0ainhg4rx4f4gxdbcb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.2.0
  (package
    (name "go-golang-org-x-net")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ssw2acwv2izr6jipgsfah02hcikzmh9bqafxap4d4jb6wfagjnh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-sys-0.2.0
                             go-golang-org-x-term-0.2.0
                             go-golang-org-x-text-0.4.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.24.1
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.24.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fj9bqnqiipvaqmnh4v8zwjqzjgwpkjpr2br3avysw6i610z2is4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.2
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.2.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-mod-0.7.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14r24fq3kn84k2y2jvvg8hwpy52a3q429pimrdwl5zwknbr2awmh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.3.0
  (package
    (name "go-golang-org-x-term")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16s3d62fgdhiqvcib61s5pwxp08hhrmzx8bdv5zk1w1krjizdarl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.3.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.5.0
  (package
    (name "go-golang-org-x-text")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dhc2wcf3h9kiwpcb06lmidxlnl9x6cswimsvm38xwl2lhxnkcyl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.3.0
  (package
    (name "go-golang-org-x-net")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1kvkxyvg2ci04p4h3ay6h53j4izrgyv62ap6k16q6g6cbhsj13iq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-sys-0.3.0
                             go-golang-org-x-term-0.3.0
                             go-golang-org-x-text-0.5.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.4.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ma6k8jhyl3is96gzyg5mzivwpcnglmpkq4mwyy3d6ml3h37kj3i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.7.0
                             go-golang-org-x-net-0.3.0
                             go-golang-org-x-sync-0.1.0
                             go-golang-org-x-sys-0.3.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.7.0
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "178jv660pmx1ix172jn1mcrg5fsb4v7qpl9q7gisq2y4ij392ysi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.3
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.24.1
                        go-golang-org-x-sys-0.3.0
                        go-golang-org-x-tools-0.4.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.4.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fr2d6fnpbqx6n89sg9lsinqkdaw49y068kqj2g0cxlhbh69hzii"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.4.0
  (package
    (name "go-golang-org-x-term")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mhl2cw0f5y40w762ig3pyx1nq0nw5ppn4ag14plwkblblfv20n1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.4.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.6.0
  (package
    (name "go-golang-org-x-text")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03m56jj0x9d0rn0xrq55pc4xvqf2ddb0rd9n58pvqqxr7yyxmvj7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.5.0
  (package
    (name "go-golang-org-x-net")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fidlcn3vcz42v2lc0rpmqh3bz08bcklj6jvnmz2vvgc481ci5hy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-sys-0.4.0
                             go-golang-org-x-term-0.4.0
                             go-golang-org-x-text-0.6.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.26.0
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.26.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1c9qcfbl6wwhzlp80r3yrvbghimi9r3lz78bzc2glas7har26pq7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.2
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.5.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-github-com-onsi-ginkgo-2.8.1
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.8.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14ifc6jn6ihwj81d3zfhb48xjf8hqd39s763jl9zrficqy66k47r"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.3
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.26.0
                        go-golang-org-x-sys-0.5.0
                        go-golang-org-x-tools-0.6.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-github-com-onsi-gomega-1.27.1
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.27.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gky6g6h840fx3x4j60g1zd3gslk1vva470gjhhmwqpn9s0hnav1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.2
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.7.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-github-com-onsi-ginkgo-2.9.0
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1319lsp06i07772j74g11hzmdwbp1q96l1iijgfc3i1n2pq24lzp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.3
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.27.1
                        go-golang-org-x-net-0.7.0
                        go-golang-org-x-sys-0.5.0
                        go-golang-org-x-tools-0.6.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-net-0.7.0
  (package
    (name "go-golang-org-x-net")
    (version "0.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ch88x96in2773ynci7ih2w929qd67mzjqc3nazajcid3ijmh1if"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-sys-0.5.0
                             go-golang-org-x-term-0.5.0
                             go-golang-org-x-text-0.7.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.27.3
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.27.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01w7jxaqaaigf6bkvvay7k8s3cxzk800mjl6l85j0m8yf5f8vala"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.3
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.7.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-github-com-onsi-ginkgo-2.9.1
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0j10hqydxf4lghsbv916w5fxr23dl23parlwqkiqmc4i3gxhw3bv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.3
                        go-github-com-go-task-slim-sprig-0.0.0-20210107165309-348f09dbbbc0
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.27.3
                        go-golang-org-x-net-0.8.0
                        go-golang-org-x-sys-0.6.0
                        go-golang-org-x-tools-0.7.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-github-com-onsi-gomega-1.27.4
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.27.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zf2vqdy0q293z7aw9cpphqgbw7h0jbyn9gmq7fmaadsyydns68n"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.3
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.8.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-mod-0.9.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qk0p2daq5kq5zj9g7gz25apr185yrxnzfi0r063wfs59azi2ax0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.7.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1k31v95wqnpqwjs0sdx3iiffqwcfhjssfazynv0z0fg5szpck5fg"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.9.0
                             go-golang-org-x-net-0.8.0
                             go-golang-org-x-sync-0.1.0
                             go-golang-org-x-sys-0.6.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.9.2
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.9.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1g7nydjxzc18rfgbyxqcrv2c5gm7dwwr70n9x1382b3zvd2l44lm"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.3
                        go-github-com-go-task-slim-sprig-0.0.0-20230315185526-52ccab3ef572
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.27.4
                        go-golang-org-x-net-0.8.0
                        go-golang-org-x-sys-0.6.0
                        go-golang-org-x-tools-0.7.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.6.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13rcrp7gdng5wqh1qd4p21nwjxdjdcnw41gs3yjfshxi52snz81m"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.6.0
  (package
    (name "go-golang-org-x-term")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02ahc5avyfay8jvl8k2lyc8xz2jir5bpbdzxzf36rw0qkig35382"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.6.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.8.0
  (package
    (name "go-golang-org-x-text")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "054dh7bzfswqrq4jl93dv77w7y8kqcdkv5yz03jjn3hcazs3g1b0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.6.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.8.0
  (package
    (name "go-golang-org-x-net")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cv7kblgzrjv1glp99g1csw7hcjniz7zn6c9xfkrj9ysmslsvhyr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-sys-0.6.0
                             go-golang-org-x-term-0.6.0
                             go-golang-org-x-text-0.8.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.27.6
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.27.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "029rwaq4xwmhwam8allj9axvj2d61vdglphymw67anynzvdbj3cx"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.3
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.8.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-github-com-onsi-ginkgo-2.9.5
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.9.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1612wk96whk7z0s0r3n953ad1s8h61yd3g2da7wz5cyg5fjgqxnl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.4
                        go-github-com-go-task-slim-sprig-0.0.0-20230315185526-52ccab3ef572
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.27.6
                        go-golang-org-x-net-0.10.0
                        go-golang-org-x-sys-0.8.0
                        go-golang-org-x-tools-0.9.1))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-github-com-onsi-gomega-1.27.7
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.27.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1d1kn7v6fmkkbm90v5a54k3c03yshbslwvpyqlnmaqfq4067z83b"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.3
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.10.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-tools-0.9.1
  (package
    (name "go-golang-org-x-tools")
    (version "0.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sapbkl1ddiw1llyxv3s1rj5kljcq4l97fclzmwvn8hbg8jszycf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.10.0
                             go-golang-org-x-net-0.10.0
                             go-golang-org-x-sync-0.2.0
                             go-golang-org-x-sys-0.8.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.9.7
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.9.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xqw78bpcdnz211nphfkhwddklj5cxl619q6srdp4djjwk9issgr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.4
                        go-github-com-go-task-slim-sprig-0.0.0-20230315185526-52ccab3ef572
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.27.7
                        go-golang-org-x-net-0.10.0
                        go-golang-org-x-sys-0.8.0
                        go-golang-org-x-tools-0.9.1))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-github-com-onsi-gomega-1.27.8
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.27.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gg4nc9l0r31ac71sngzs8a42cf0arh8cb5q7j6fxc0c1s7avnpi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.3
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.10.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.9.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03z7rr7mmb0dlqbsxj1dai7yiwji4nivv5858ap44wf1ii5vc937"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.10.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14vxddjf85i98ln9lvq5x4p17p4nzvvk8nvjdav96i01kcz5pf6i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.2.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1j2fm6qy52jb3j5gxvgml3kf8nrr8sc1b1ja8wxpcsdnrk73vac4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.9.3
  (package
    (name "go-golang-org-x-tools")
    (version "0.9.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14bdxz7x00lx2xi2m68mmgyd91ksf44gafwwxnx0j94hgmbi14kc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.10.0
                             go-golang-org-x-net-0.10.0
                             go-golang-org-x-sync-0.2.0
                             go-golang-org-x-sys-0.8.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.11.0
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11argv0322j80g0rp9cz6nyf9rd2wapslqmnqmw576w0d8hfy6fh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.4
                        go-github-com-go-task-slim-sprig-0.0.0-20230315185526-52ccab3ef572
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.27.8
                        go-golang-org-x-net-0.10.0
                        go-golang-org-x-sys-0.9.0
                        go-golang-org-x-tools-0.9.3))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-crypto-0.11.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0y877dkc1dlza7n0q37fy9gj3r7i06akgalzq0y3w5mdr77ddlxm"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.10.0
                             go-golang-org-x-sys-0.10.0
                             go-golang-org-x-term-0.10.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.10.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n38psbpy2h8ac2mdvc9w1nysv0fnlgmiahkhqg9p72i28isgyig"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.10.0
  (package
    (name "go-golang-org-x-term")
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19abybnsqix924d9ak4p93bgq1312zp1yk11bilrrmsjplhbrzqf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.10.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.11.0
  (package
    (name "go-golang-org-x-text")
    (version "0.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a0d6f9qqzd9njd8xb59mjrfv5jrz8130crcxbqaiy7lk434nq1k"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.6.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.12.0
  (package
    (name "go-golang-org-x-net")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "002ws2aqp4kmvdb1q3qcx553xvvfipi7pgq4bzqv5h5yin7l21nd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.11.0
                             go-golang-org-x-sys-0.10.0
                             go-golang-org-x-term-0.10.0
                             go-golang-org-x-text-0.11.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.27.10
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.27.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1x64k6llja1s045x94xsc66i3d34wj0irv4qn1mav16jalsaj5dh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.3
                             go-github-com-google-go-cmp-0.5.9
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.12.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-crypto-0.12.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00cg67w0n01a64fc4kqg5j7r47fx5y9vyqlanwb60513dv6lzacs"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.10.0
                             go-golang-org-x-sys-0.11.0
                             go-golang-org-x-term-0.11.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.11.0
  (package
    (name "go-golang-org-x-term")
    (version "0.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03kmj3pbnprpi2pm3bm15z649q9dz9cx7093bs6mz9hhvzyszr4s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.11.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.12.0
  (package
    (name "go-golang-org-x-text")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1w1wwql198k784icbq2vbwvc18lh9pn8bnawpq34cqkar06vzfl0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.6.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.14.0
  (package
    (name "go-golang-org-x-net")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pk9pfd5n5hlg5zx1ab3gfzi6lfcs41dfds6fyn661g5xs00l9s1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.12.0
                             go-golang-org-x-sys-0.11.0
                             go-golang-org-x-term-0.11.0
                             go-golang-org-x-text-0.12.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.11.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pp0479l9w92kr6p97d19s8y0hj16gblg4hvdqqzcrf3d9mr4cs3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.12.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bl2qsxyikrndjmblm96j0jimm4311ddnvr4q2gylq156ylr6xwy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.12.0
                             go-golang-org-x-net-0.14.0
                             go-golang-org-x-sync-0.3.0
                             go-golang-org-x-sys-0.11.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.13.0
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09kbdm8g1pgf3k0nlxvlyflzx20njh9y0nf1apagw1lf6jmbrqrp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.2.4
                        go-github-com-go-task-slim-sprig-0.0.0-20230315185526-52ccab3ef572
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.27.10
                        go-golang-org-x-net-0.14.0
                        go-golang-org-x-sys-0.12.0
                        go-golang-org-x-tools-0.12.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-crypto-0.14.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08124qkp0l0blq6rw68llfbf84kp99255q0yvxyv27c05b0wkh66"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.10.0
                             go-golang-org-x-sys-0.13.0
                             go-golang-org-x-term-0.13.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.13.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "146a87srgp1xv0cmhccnmsjxgg76kvpn67g278zfjyj6pn497f8q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.13.0
  (package
    (name "go-golang-org-x-term")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0r6a4id60b7rqnkcp50w25fyi35xp03z9rpjhdgnndwr6ir7xcxh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.13.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.17.0
  (package
    (name "go-golang-org-x-net")
    (version "0.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17zhim2m0r8nyy18g2lsawxm4rawix2qbjyn80x9vc6jc8fv05m9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.14.0
                             go-golang-org-x-sys-0.13.0
                             go-golang-org-x-term-0.13.0
                             go-golang-org-x-text-0.13.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.30.0
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.30.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sky0y6xl4f9p44xkv8vm5vma8lxkfgxh2mdv59dy8dlfi19kw1i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.3
                             go-github-com-google-go-cmp-0.6.0
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.17.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-mod-0.14.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1r4a4m8v7hlfb82gi9ibzhvwavlbabpy2b98cwsg1y4fsxskkswv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.13.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.18.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.18.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11z7d10m519i3nyzbb4g7731vpwa3x8gv8d1nhghx5qng7aksib2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.10.0
                             go-golang-org-x-sys-0.16.0
                             go-golang-org-x-term-0.16.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.16.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0mq5xbxa030qy6mimq75f2ipc736mfrbwbb6frglnnrjl30207dh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.16.0
  (package
    (name "go-golang-org-x-term")
    (version "0.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1va1iiprhipagdx5vf9yjqdyd79sbgrgj44fcjxwdml8q1r4gagn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.16.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.20.0
  (package
    (name "go-golang-org-x-net")
    (version "0.20.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fawnwri1ygz8w560077q80d9k56vvcf7jrmgix0f1cjqli6sarw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.18.0
                             go-golang-org-x-sys-0.16.0
                             go-golang-org-x-term-0.16.0
                             go-golang-org-x-text-0.14.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.17.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1sj8pqxgkxnl8z7jklljv7fcagdlxaqgjk4yhmg19djvj2vh89an"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.14.0
                             go-golang-org-x-net-0.20.0
                             go-golang-org-x-sync-0.6.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.17.1
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.17.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "089x6pz5563ldbxiwaqvd2g4dqfzlr25dflmas3gfq51ibwzh4vz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.4.1
                        go-github-com-go-task-slim-sprig-0.0.0-20230315185526-52ccab3ef572
                        go-github-com-google-pprof-0.0.0-20210407192527-94a9f03dee38
                        go-github-com-onsi-gomega-1.30.0
                        go-golang-org-x-net-0.20.0
                        go-golang-org-x-sys-0.16.0
                        go-golang-org-x-tools-0.17.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-crypto-0.21.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ivgmb34kvrd6q3bcbvzqf9g2c6f9d27cay3cm07rajapm3ws7rk"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.18.0
                             go-golang-org-x-term-0.18.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.18.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.18.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11p97drmsiyd42bb0pg9j1bshdmkfmjvfmg118x212wafdw77x6l"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.18.0
  (package
    (name "go-golang-org-x-term")
    (version "0.18.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08wfcmy36z3vglq647qyz6l309d2f9bdvvf1ax0qhr65mbsxx74n"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.18.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.23.0
  (package
    (name "go-golang-org-x-net")
    (version "0.23.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0d2mmrpdfrw0wh0j9dzwsrszd3xpd8wqxqhpf7dw30pdib9kj7k4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.21.0
                             go-golang-org-x-sys-0.18.0
                             go-golang-org-x-term-0.18.0
                             go-golang-org-x-text-0.14.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.33.0
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12iwsa1vmm7adapx0jhrvnj3938n69567pckyxra3dfq68z1mcyh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.23.0
                             go-google-golang-org-protobuf-1.33.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-tools-0.20.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.20.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wkvbi6faxlzr1s22swlj2x1qbdk3xkqmq1ll9dsgvcpdkfa9w8i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.17.0 go-golang-org-x-net-0.24.0
                        go-golang-org-x-sync-0.7.0
                        go-golang-org-x-telemetry-0.0.0-20240228155512-f48c80bd79b2))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.17.2
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.17.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0n1fad89sqv5qmqpckxkmm7nfc37dyrcfq12hak8y5p4xm4c9nsa"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.4.1
                        go-github-com-go-task-slim-sprig-3.0.0
                        go-github-com-google-pprof-0.0.0-20240424215950-a892ee059fd6
                        go-github-com-onsi-gomega-1.33.0
                        go-golang-org-x-net-0.24.0
                        go-golang-org-x-sys-0.19.0
                        go-golang-org-x-tools-0.20.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-crypto-0.22.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.22.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pkjm6h4wi4b7im941kr31dmzz0s3gadhdjna9pq9lj1xhpzfbl9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.19.0
                             go-golang-org-x-term-0.19.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.19.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i7nnjbj2h29bw7dmc9c8y3w40yn24z26pvxsm4bcg445ylfbi03"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.19.0
  (package
    (name "go-golang-org-x-term")
    (version "0.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0a47fafggkh3h3xzcgnqjb2fbkih4glwd8vaw81bvckd10rh8p60"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.19.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.24.0
  (package
    (name "go-golang-org-x-net")
    (version "0.24.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i3873xrjsm86hgil28f7hzjpxwzi0jg99974c6rqszdb3b3cmy3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.22.0
                             go-golang-org-x-sys-0.19.0
                             go-golang-org-x-term-0.19.0
                             go-golang-org-x-text-0.14.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.33.1
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.33.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jygwi2lz3q7ri85dxdxf187l1hm7r3i0c843l47iakivmld31x1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                             go-github-com-onsi-ginkgo-v2
                             go-golang-org-x-net-0.24.0
                             go-google-golang-org-protobuf-1.33.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-golang-org-x-tools-0.21.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jgx7hfa4s2q6vdbimvc1hqys2vq7ca7ga3jkfcfhim70ajyj9df"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.17.0
                        go-golang-org-x-net-0.25.0
                        go-golang-org-x-sync-0.7.0
                        go-golang-org-x-telemetry-0.0.0-20240228155512-f48c80bd79b2))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-ginkgo-2.19.0
  (package
    (name "go-github-com-onsi-ginkgo")
    (version "2.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/ginkgo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dwnkcysb5d9dyg8p84hhx5a3sj85g3bwgki1pgay4i8glz7xa7q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/ginkgo/v2"
      #:unpack-path "github.com/onsi/ginkgo"))
    (propagated-inputs (list go-github-com-go-logr-logr-1.4.1
                        go-github-com-go-task-slim-sprig-3.0.0
                        go-github-com-google-pprof-0.0.0-20240424215950-a892ee059fd6
                        go-github-com-onsi-gomega-1.33.1
                        go-golang-org-x-net-0.25.0
                        go-golang-org-x-sys-0.20.0
                        go-golang-org-x-tools-0.21.0))
    (home-page "https://github.com/onsi/ginkgo")
    (synopsis "Ginkgo")
    (description
     "Ginkgo is a testing framework for Go designed to help you write expressive
tests. @@url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}
MIT-Licensed.")
    (license license:expat)))

(define-public go-golang-org-x-mod-0.19.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02wilb8q2bp6qhqcrbjxq1pjy3y5k8p11pxlg481609zx4rjiszc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.13.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.23.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.23.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hr81fr5s39p97m9y3ipma7ryw4nm2246k8ds0flkybzf19mhzbi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.19.0
                        go-golang-org-x-net-0.27.0
                        go-golang-org-x-sync-0.7.0
                        go-golang-org-x-telemetry-0.0.0-20240521205824-bda55230c457))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-exp-0.0.0-20240719175910-8a7402abbf56
  (package
    (name "go-golang-org-x-exp")
    (version "0.0.0-20240719175910-8a7402abbf56")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/exp")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vs5i5v9c7d66myq394z17w0ij9vngqcbqn8nmxkb33kj8s83dc3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/exp"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                             go-golang-org-x-mod-0.19.0
                             go-golang-org-x-tools-0.23.0))
    (home-page "https://golang.org/x/exp")
    (synopsis "exp")
    (description
     "This subrepository holds experimental and deprecated (in the @@code{old}
directory) packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.25.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.25.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cnglyy3fhvnnynazfdrikkwcxv3rlxamvfxink2z241lncvwkxy"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.22.0
                             go-golang-org-x-term-0.22.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.22.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.22.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kpl5hk0zbh5bfschnq64yj1cs7v3l9v6bd1rw5crlfd4hg7xawa"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.22.0
  (package
    (name "go-golang-org-x-term")
    (version "0.22.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0iqh035y65gfm28xp52pnksh49q3nyaz0zrjjj032rs8hv5py75m"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.22.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.16.0
  (package
    (name "go-golang-org-x-text")
    (version "0.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pmn0i1xbpwvzl4cdgmjqcsk9vckhqrq6699fnr9mkglh4xj3p7a"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list
                        go-golang-org-x-tools-0.21.1-0.20240508182429-e35e4ccd0d2d))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.27.0
  (package
    (name "go-golang-org-x-net")
    (version "0.27.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fc6d968yiv2l67z9jg7ssvas1hd1jniqh4m7mmlay0q5gk4vf8s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.25.0
                             go-golang-org-x-sys-0.22.0
                             go-golang-org-x-term-0.22.0
                             go-golang-org-x-text-0.16.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-google-golang-org-protobuf-1.34.1
  (package
    (name "go-google-golang-org-protobuf")
    (version "1.34.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pn0hcxn7bdc1q6cjz8vrari828164f96hhdlr2rgavszcvymdy5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.0
                             go-github-com-google-go-cmp-0.5.5))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-onsi-gomega-1.34.1
  (package
    (name "go-github-com-onsi-gomega")
    (version "1.34.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/onsi/gomega")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0q4z1jxd1ix3wg34riw2m6ivxm9cnwjnsg50rli2d50kymy7qxhn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/onsi/gomega"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-onsi-ginkgo-v2
                        go-golang-org-x-exp-0.0.0-20240719175910-8a7402abbf56
                        go-golang-org-x-net-0.27.0
                        go-google-golang-org-protobuf-1.34.1
                        go-gopkg-in-yaml-v3))
    (home-page "https://github.com/onsi/gomega")
    (synopsis "Using Gomega with Claude Code")
    (description
     "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
    (license license:expat)))

(define-public go-github-com-go-git-go-billy-5.8.0
  (package
    (name "go-github-com-go-git-go-billy")
    (version "5.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-git/go-billy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sgr7m78bnz0g9jkcyg44705m2snqjjd5r01dfyywscxspgfnrb1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-git/go-billy/v5"
      #:unpack-path "github.com/go-git/go-billy"))
    (propagated-inputs (list go-github-com-cyphar-filepath-securejoin-0.3.6
                        go-github-com-onsi-gomega-1.34.1
                        go-github-com-stretchr-testify-1.10.0
                        go-golang-org-x-sys-0.36.0
                        go-gopkg-in-check-v1))
    (home-page "https://github.com/go-git/go-billy")
    (synopsis "go-billy")
    (description
     "The missing interface filesystem abstraction for Go.  Billy implements an
interface based on the @@code{os} standard library, allowing to develop
applications without dependency on the underlying storage.  Makes it virtually
free to implement mocks and testing over filesystem operations.")
    (license license:asl2.0)))

(define-public go-golang-org-x-sys-0.3.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ylhkkx1yd4imzfjwy54ifhph080frzw0qxqm8fchyrb925s4mpz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-go-git-go-billy-5.4.1
  (package
    (name "go-github-com-go-git-go-billy")
    (version "5.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-git/go-billy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0s8b8sydqn8cil1xqnb47cspcfxyg2mx4dxbfgacrmcppkr18s84"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-git/go-billy/v5"
      #:unpack-path "github.com/go-git/go-billy"))
    (propagated-inputs (list go-golang-org-x-sys-0.3.0
                        go-gopkg-in-check-v1))
    (home-page "https://github.com/go-git/go-billy")
    (synopsis "go-billy")
    (description
     "The missing interface filesystem abstraction for Go.  Billy implements an
interface based on the @@code{os} standard library, allowing to develop
applications without dependency on the underlying storage.  Makes it virtually
free to implement mocks and testing over filesystem operations.")
    (license license:asl2.0)))

(define-public go-github-com-go-git-go-git-fixtures-4.3.2-0.20231010084843-55a94097c399
  (package
    (name "go-github-com-go-git-go-git-fixtures")
    (version "4.3.2-0.20231010084843-55a94097c399")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-git/go-git-fixtures")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jrl8hjslqgmwd87q1biwlks2h5297lg6p299k00akz4hvc6n67y"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-git/go-git-fixtures/v4"
      #:unpack-path "github.com/go-git/go-git-fixtures"))
    (propagated-inputs (list go-github-com-go-git-go-billy-5.4.1
                        go-github-com-stretchr-testify-1.8.4
                        go-gopkg-in-check-v1))
    (home-page "https://github.com/go-git/go-git-fixtures")
    (synopsis "go-git-fixtures")
    (description
     "git repository fixtures used by @@url{https://github.com/go-git/go-git,go-git}.")
    (license license:asl2.0)))

(define-public go-google-golang-org-protobuf-1.26.0-rc.1
  (package
    (name "go-google-golang-org-protobuf")
    (version "1.26.0-rc.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1m2jp247qcnix42jncn0q7pwrjgbhiqllb1115hfsz40xfnfhp8j"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.5.5))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-golang-protobuf-1.5.0
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1craaxv34g4g8q3yrv6pr28fx9ihnk7hj5gnbmxcrhcp78423lnf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.5.5
                             go-google-golang-org-protobuf-1.26.0-rc.1))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-golang-org-x-xerrors-0.0.0-20191204190536-9bdfabe68543
  (package
    (name "go-golang-org-x-xerrors")
    (version "0.0.0-20191204190536-9bdfabe68543")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/xerrors")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1yjfi1bk9xb81lqn85nnm13zz725wazvrx3b50hx19qmwg7a4b0c"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/xerrors"))
    (home-page "https://golang.org/x/xerrors")
    (synopsis #f)
    (description "Package xerrors implements functions to manipulate errors.")
    (license license:bsd-3)))

(define-public go-github-com-google-go-cmp-0.5.5
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.5.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-cmp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12fmkdhyv5d4is8s57k78j097zb0phlgnrkqc03agiszxlid69x7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-cmp"))
    (propagated-inputs (list
                        go-golang-org-x-xerrors-0.0.0-20191204190536-9bdfabe68543))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
     "This package is intended to be a more powerful and safer alternative to
@@code{reflect.@code{DeepEqual}} for comparing whether two values are
semantically equal.")
    (license license:bsd-3)))

(define-public go-google-golang-org-protobuf-1.33.0
  (package
    (name "go-google-golang-org-protobuf")
    (version "1.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "063l7mllaaw39m6wcbg75dh9ip57yxga525bg765qjahwg0x83w4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "google.golang.org/protobuf"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.0
                             go-github-com-google-go-cmp-0.5.5))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This project hosts the Go implementation for @@url{https://protobuf.dev,protocol
buffers}, which is a language-neutral, platform-neutral, extensible mechanism
for serializing structured data.  The protocol buffer language is a language for
specifying the schema for structured data.  This schema is compiled into
language specific bindings.  This project provides both a tool to generate Go
code for the protocol buffer language, and also the runtime implementation to
handle serialization of messages in Go.  See the
@@url{https://protobuf.dev/overview,protocol buffer developer guide} for more
information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-golang-protobuf-1.5.4
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.5.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/protobuf")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bk7sa9ymi87hd2fv9jamxnxb3qjriamf2nsm8avp6ka37mrkz01"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/protobuf"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.5.5
                             go-google-golang-org-protobuf-1.33.0))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
     "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-github-com-golang-groupcache-0.0.0-20241129210726-2c02b8208cf8
  (package
    (name "go-github-com-golang-groupcache")
    (version "0.0.0-20241129210726-2c02b8208cf8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/golang/groupcache")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ghz6cv7f23b80rd9309diz4v741xqjncvw3pafzqysbsbfxklh1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/golang/groupcache"))
    (propagated-inputs (list go-github-com-golang-protobuf-1.5.4))
    (home-page "https://github.com/golang/groupcache")
    (synopsis "groupcache")
    (description
     "Package groupcache provides a data loading mechanism with caching and
de-duplication that works across a set of peer processes.")
    (license license:asl2.0)))

(define-public go-github-com-jbenet-go-context-0.0.0-20150711004518-d14ea06fba99
  (package
    (name "go-github-com-jbenet-go-context")
    (version "0.0.0-20150711004518-d14ea06fba99")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jbenet/go-context")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0q91f5549n81w3z5927n4a1mdh220bdmgl42zi3h992dcc4ls0sl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/jbenet/go-context"))
    (home-page "https://github.com/jbenet/go-context")
    (synopsis "go-context - jbenet's CONText EXTensions")
    (description
     "Package context contains some extenstions to go.net/context by @@jbenet.")
    (license license:expat)))

(define-public go-github-com-kevinburke-ssh-config-1.2.0
  (package
    (name "go-github-com-kevinburke-ssh-config")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kevinburke/ssh_config")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jvv3i0g8ll210xlbxy8ywj09gab0im676rmnywh3wlpdhxdkbjd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/kevinburke/ssh_config"))
    (home-page "https://github.com/kevinburke/ssh_config")
    (synopsis "ssh_config")
    (description
     "Package ssh_config provides tools for manipulating SSH config files.")
    (license license:expat)))

(define-public go-github-com-pjbgf-sha1cd-0.3.2
  (package
    (name "go-github-com-pjbgf-sha1cd")
    (version "0.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pjbgf/sha1cd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pvnmhyby1xqjyangjr22rgq1ad2k69arynigdf9rwqszq4y6bxw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/pjbgf/sha1cd"))
    (home-page "https://github.com/pjbgf/sha1cd")
    (synopsis "sha1cd")
    (description
     "Package sha1cd implements collision detection based on the whitepaper
Counter-cryptanalysis from Marc Stevens.  The original ubc implementation was
done by Marc Stevens and Dan Shumow, and can be found at:
@@url{https://github.com/cr-marcstevens/sha1collisiondetection,https://github.com/cr-marcstevens/sha1collisiondetection}.")
    (license license:asl2.0)))

(define-public go-github-com-stretchr-testify-1.4.0
  (package
    (name "go-github-com-stretchr-testify")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/testify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "187i5g88sxfy4vxpm7dw1gwv29pa2qaq475lxrdh5livh69wqfjb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/testify"))
    (propagated-inputs (list go-github-com-davecgh-go-spew-1.1.0
                             go-github-com-pmezard-go-difflib-1.0.0
                             go-github-com-stretchr-objx-0.1.0
                             go-gopkg-in-yaml-v2))
    (home-page "https://github.com/stretchr/testify")
    (synopsis "Testify - Thou Shalt Write Tests")
    (description
     "Module testify is a set of packages that provide many tools for testifying that
your code will behave as you intend.")
    (license license:expat)))

(define-public go-github-com-sergi-go-diff-1.3.2-0.20230802210424-5b0b94c5c0d3
  (package
    (name "go-github-com-sergi-go-diff")
    (version "1.3.2-0.20230802210424-5b0b94c5c0d3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sergi/go-diff")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0aqclkkisspx9jsmarrnm8dnilba1m889am3wlc3wg64ggdg6fqj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/sergi/go-diff"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.4.0))
    (home-page "https://github.com/sergi/go-diff")
    (synopsis "go-diff")
    (description
     "go-diff offers algorithms to perform operations required for synchronizing plain
text:.")
    (license license:expat)))

(define-public go-golang-org-x-term-0.28.0
  (package
    (name "go-golang-org-x-term")
    (version "0.28.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x49bph5m66xfis3djnxz0xyjqb84j4mdvgg5w1mhi21fym9dy6p"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.29.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.32.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.32.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qpd7hzigxiq3hyzxp48c2hv89pc61k4zkir8vaqv3gqgchpmfrc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.29.0
                             go-golang-org-x-term-0.28.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-github-com-skeema-knownhosts-1.3.1
  (package
    (name "go-github-com-skeema-knownhosts")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/skeema/knownhosts")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04lb198n9k9y96v7kvyrvwx2w70kb6jq47p6p19h6wd77c7r0flj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/skeema/knownhosts"))
    (propagated-inputs (list go-golang-org-x-crypto-0.32.0))
    (home-page "https://github.com/skeema/knownhosts")
    (synopsis "knownhosts: enhanced Golang SSH known_hosts management")
    (description
     "Package knownhosts is a thin wrapper around golang.org/x/crypto/ssh/knownhosts,
adding the ability to obtain the list of host key algorithms for a known host.")
    (license license:asl2.0)))

(define-public go-github-com-davecgh-go-spew-1.1.1
  (package
    (name "go-github-com-davecgh-go-spew")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/davecgh/go-spew")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hka6hmyvp701adzag2g26cxdj47g21x6jz4sc6jjz1mn59d474y"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/davecgh/go-spew"))
    (home-page "https://github.com/davecgh/go-spew")
    (synopsis "go-spew")
    (description
     "Go-spew implements a deep pretty printer for Go data structures to aid in
debugging.  A comprehensive suite of tests with 100% test coverage is provided
to ensure proper functionality.  See @@code{test_coverage.txt} for the gocov
coverage report.  Go-spew is licensed under the liberal ISC license, so it may
be used in open source or commercial projects.")
    (license license:isc)))

(define-public go-github-com-davecgh-go-spew-1.1.0
  (package
    (name "go-github-com-davecgh-go-spew")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/davecgh/go-spew")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0d4jfmak5p6lb7n2r6yvf5p1zcw0l8j74kn55ghvr7zr7b7axm6c"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/davecgh/go-spew"))
    (home-page "https://github.com/davecgh/go-spew")
    (synopsis "go-spew")
    (description
     "Go-spew implements a deep pretty printer for Go data structures to aid in
debugging.  A comprehensive suite of tests with 100% test coverage is provided
to ensure proper functionality.  See @@code{test_coverage.txt} for the gocov
coverage report.  Go-spew is licensed under the liberal ISC license, so it may
be used in open source or commercial projects.")
    (license license:isc)))

(define-public go-github-com-pmezard-go-difflib-1.0.0
  (package
    (name "go-github-com-pmezard-go-difflib")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pmezard/go-difflib")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c1cn55m4rypmscgf0rrb88pn58j3ysvc2d0432dp3c6fqg6cnzw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/pmezard/go-difflib"))
    (home-page "https://github.com/pmezard/go-difflib")
    (synopsis "go-difflib")
    (description
     "Go-difflib is a partial port of python 3 difflib package.  Its main goal was to
make unified and context diff available in pure Go, mostly for testing purposes.")
    (license license:bsd-3)))

(define-public go-github-com-stretchr-objx-0.1.0
  (package
    (name "go-github-com-stretchr-objx")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/objx")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19ynspzjdynbi85xw06mh8ad5j0qa1vryvxjgvbnyrr8rbm4vd8w"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/objx"))
    (home-page "https://github.com/stretchr/objx")
    (synopsis "Objx")
    (description
     "Package objx provides utilities for dealing with maps, slices, JSON and other
data.")
    (license license:expat)))

(define-public go-github-com-stretchr-testify-1.7.1
  (package
    (name "go-github-com-stretchr-testify")
    (version "1.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/testify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0k4pcysfr25j2i8s9h0hbx5b1ihz97xh0dqazsik8872h5a18avn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/testify"))
    (propagated-inputs (list go-github-com-davecgh-go-spew-1.1.0
                        go-github-com-pmezard-go-difflib-1.0.0
                        go-github-com-stretchr-objx-0.1.0
                        go-gopkg-in-yaml-v3))
    (home-page "https://github.com/stretchr/testify")
    (synopsis "Testify - Thou Shalt Write Tests")
    (description
     "Module testify is a set of packages that provide many tools for testifying that
your code will behave as you intend.")
    (license license:expat)))

(define-public go-github-com-stretchr-objx-0.4.0
  (package
    (name "go-github-com-stretchr-objx")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/objx")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dygds32qxx6x1x2mmn7msyjr15qi5r70pyzv8dz8cprxq32nzc1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/objx"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.7.1))
    (home-page "https://github.com/stretchr/objx")
    (synopsis "Objx")
    (description
     "Package objx provides utilities for dealing with maps, slices, JSON and other
data.")
    (license license:expat)))

(define-public go-github-com-stretchr-testify-1.8.0
  (package
    (name "go-github-com-stretchr-testify")
    (version "1.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/testify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00jzs0sbdbga24jq2ki6ga22fj6j3za8db20ifzx8pcifmsf4ffq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/testify"))
    (propagated-inputs (list go-github-com-davecgh-go-spew-1.1.1
                             go-github-com-pmezard-go-difflib-1.0.0
                             go-github-com-stretchr-objx-0.4.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/stretchr/testify")
    (synopsis "Testify - Thou Shalt Write Tests")
    (description
     "Module testify is a set of packages that provide many tools for testifying that
your code will behave as you intend.")
    (license license:expat)))

(define-public go-github-com-stretchr-objx-0.5.0
  (package
    (name "go-github-com-stretchr-objx")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/objx")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11y3i96bp6r4x28kpacni7vv94zncpmrj3yr9c33ggwim5i9lij6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/objx"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.8.0))
    (home-page "https://github.com/stretchr/objx")
    (synopsis "Objx")
    (description
     "Package objx provides utilities for dealing with maps, slices, JSON and other
data.")
    (license license:expat)))

(define-public go-github-com-stretchr-testify-1.8.4
  (package
    (name "go-github-com-stretchr-testify")
    (version "1.8.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/testify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1c276wgwlcpksp58ymg4839mcvagghcknb0n35d9ajks2z7g4s2f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/testify"))
    (propagated-inputs (list go-github-com-davecgh-go-spew-1.1.1
                             go-github-com-pmezard-go-difflib-1.0.0
                             go-github-com-stretchr-objx-0.5.0
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/stretchr/testify")
    (synopsis "Testify - Thou Shalt Write Tests")
    (description
     "Module testify is a set of packages that provide many tools for testifying that
your code will behave as you intend.")
    (license license:expat)))

(define-public go-github-com-stretchr-objx-0.5.2
  (package
    (name "go-github-com-stretchr-objx")
    (version "0.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/objx")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jcxpfgfpk82lryjkhbd5dy7xzx08d7b9dvbx4bpkmjvn6p339jl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/objx"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.8.4))
    (home-page "https://github.com/stretchr/objx")
    (synopsis "Objx")
    (description
     "Package objx provides utilities for dealing with maps, slices, JSON and other
data.")
    (license license:expat)))

(define-public go-github-com-stretchr-testify-1.10.0
  (package
    (name "go-github-com-stretchr-testify")
    (version "1.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/testify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0g1bdpqih38a7dl1malahz5x4ag01adk61gx47jg2534cqzvid05"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/testify"))
    (propagated-inputs (list go-github-com-davecgh-go-spew-1.1.1
                             go-github-com-pmezard-go-difflib-1.0.0
                             go-github-com-stretchr-objx-0.5.2
                             go-gopkg-in-yaml-v3))
    (home-page "https://github.com/stretchr/testify")
    (synopsis "Testify - Thou Shalt Write Tests")
    (description
     "Module testify is a set of packages that provide many tools for testifying that
your code will behave as you intend.")
    (license license:expat)))

(define-public go-github-com-stretchr-testify-1.2.2
  (package
    (name "go-github-com-stretchr-testify")
    (version "1.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stretchr/testify")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dlszlshlxbmmfxj5hlwgv3r22x0y1af45gn1vd198nvvs3pnvfs"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/stretchr/testify"))
    (home-page "https://github.com/stretchr/testify")
    (synopsis "Testify - Thou Shalt Write Tests")
    (description
     "Module testify is a set of packages that provide many tools for testifying that
your code will behave as you intend.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20191026070338-33540a1f6037
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20191026070338-33540a1f6037")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fjcv0vzvi6za0b4xmnk3932pr9f9gczzf03y0kgq3ry9rqg169y"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-sirupsen-logrus-1.7.0
  (package
    (name "go-github-com-sirupsen-logrus")
    (version "1.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sirupsen/logrus")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a59pw7zimvm8k423iq9l4f4qjj1ia1xc6pkmhwl2mxc46y2n442"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/sirupsen/logrus"))
    (propagated-inputs (list go-github-com-stretchr-testify-1.2.2
                        go-golang-org-x-sys-0.0.0-20191026070338-33540a1f6037))
    (home-page "https://github.com/sirupsen/logrus")
    (synopsis "Logrus")
    (description
     "Package logrus is a structured logger for Go, completely API compatible with the
standard library logger.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20210124154548-22da62e12c0c
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20210124154548-22da62e12c0c")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17gp3dl75wq3x7j9z1pqgcyvjhvy9jaln1wbscy57al3whdsjp07"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-microsoft-go-winio-0.5.2
  (package
    (name "go-github-com-microsoft-go-winio")
    (version "0.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/microsoft/go-winio")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19rzcwq07c2y7c06pkjjc8pbg68a24g1khwp7cdc5ypfzj509sc3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/Microsoft/go-winio"))
    (propagated-inputs (list go-github-com-sirupsen-logrus-1.7.0
                        go-golang-org-x-sys-0.0.0-20210124154548-22da62e12c0c))
    (home-page "https://github.com/Microsoft/go-winio")
    (synopsis "go-winio")
    (description
     "This package provides utilities for efficiently performing Win32 IO operations
in Go.  Currently, this package is provides support for genreal IO and
management of.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.0.0-20210423082822-04245dca01da
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20210423082822-04245dca01da")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11is2c5cpxk0gf2mxza2wpzfcf71fxb9b3in77f6w2q0pr68ykzx"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.3.6
  (package
    (name "go-golang-org-x-text")
    (version "0.3.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wzhvdb059vrp2cczqw422ajrb9sbs4l3qd020hlngj33qfhxah0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list
                        go-golang-org-x-tools-0.0.0-20180917221912-90fa682c2a6e))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.0.0-20211112202133-69e39bad7dc2
  (package
    (name "go-golang-org-x-net")
    (version "0.0.0-20211112202133-69e39bad7dc2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yvg72fb037yh4xvjyfgrr8nsbz7nfiiksvq0a5922z255anamy6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list
                        go-golang-org-x-sys-0.0.0-20210423082822-04245dca01da
                        go-golang-org-x-term-0.0.0-20201126162022-7de9c90e9dd1
                        go-golang-org-x-text-0.3.6))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.0.0-20220622213112-05595931fe9d
  (package
    (name "go-golang-org-x-crypto")
    (version "0.0.0-20220622213112-05595931fe9d")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0anhfyxcvp34ky9y52lh80dc7d9204cnzdrpqhks1znahyazd90p"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list
                        go-golang-org-x-net-0.0.0-20211112202133-69e39bad7dc2
                        go-golang-org-x-sys-0.0.0-20210615035016-665e8c7367d1
                        go-golang-org-x-term-0.0.0-20201126162022-7de9c90e9dd1))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.0.0-20220715151400-c0bba94af5f8
  (package
    (name "go-golang-org-x-sys")
    (version "0.0.0-20220715151400-c0bba94af5f8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l55yp8fy2yd18hjxq4w44hrhyz41i64ccz1fnc5z7w8rxypfm3q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-xanzy-ssh-agent-0.3.3
  (package
    (name "go-github-com-xanzy-ssh-agent")
    (version "0.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xanzy/ssh-agent")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ryv8aa4g7467baydjwgjbd4r8rp29xzgr3jzk0c7k8xl83lcylp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/xanzy/ssh-agent"))
    (propagated-inputs (list go-github-com-microsoft-go-winio-0.5.2
                        go-golang-org-x-crypto-0.0.0-20220622213112-05595931fe9d
                        go-golang-org-x-sys-0.0.0-20220715151400-c0bba94af5f8))
    (home-page "https://github.com/xanzy/ssh-agent")
    (synopsis "ssh-agent")
    (description
     "Create a new
@@url{https://godoc.org/golang.org/x/crypto/ssh/agent#Agent,agent.Agent} on any
type of OS (so including Windows) from any @@url{https://golang.org,Go}
application.")
    (license license:asl2.0)))

(define-public go-golang-org-x-crypto-0.45.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.45.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0v2rs45lpbfflsxlbz3zddj0hrplymqw26c6qxy50cn52i5a0nxj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.47.0
                             go-golang-org-x-sys-0.38.0
                             go-golang-org-x-term-0.37.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-github-com-go-git-go-git-5.17.2
  (package
    (name "go-github-com-go-git-go-git")
    (version "5.17.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-git/go-git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0akrvypfz2c6s7g2mrndmg7yfywvpa85mp7lddq0h72yxp6g75cq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/go-git/go-git/v5"
      #:unpack-path "github.com/go-git/go-git"))
    (propagated-inputs (list go-dario-cat-mergo-1.0.0
                        go-github-com-armon-go-socks5-0.0.0-20160902184237-e75332964ef5
                        go-github-com-elazarl-goproxy-1.7.2
                        go-github-com-emirpasic-gods-1.18.1
                        go-github-com-gliderlabs-ssh-0.3.8
                        go-github-com-go-git-gcfg-1.5.1-0.20230307220236-3a3c6141e376
                        go-github-com-go-git-go-billy-5.8.0
                        go-github-com-go-git-go-git-fixtures-4.3.2-0.20231010084843-55a94097c399
                        go-github-com-golang-groupcache-0.0.0-20241129210726-2c02b8208cf8
                        go-github-com-google-go-cmp-0.7.0
                        go-github-com-jbenet-go-context-0.0.0-20150711004518-d14ea06fba99
                        go-github-com-kevinburke-ssh-config-1.2.0
                        go-github-com-pjbgf-sha1cd-0.3.2
                        go-github-com-protonmail-go-crypto-1.1.6
                        go-github-com-sergi-go-diff-1.3.2-0.20230802210424-5b0b94c5c0d3
                        go-github-com-skeema-knownhosts-1.3.1
                        go-github-com-stretchr-testify-1.10.0
                        go-github-com-xanzy-ssh-agent-0.3.3
                        go-golang-org-x-crypto-0.45.0
                        go-golang-org-x-net-0.47.0
                        go-golang-org-x-sys-0.38.0
                        go-golang-org-x-text-0.31.0
                        go-gopkg-in-check-v1))
    (home-page "https://github.com/go-git/go-git")
    (synopsis "Project Status")
    (description
     "This package provides a highly extensible git implementation in pure Go.")
    (license license:asl2.0)))

(define-public go-github-com-google-go-cmp-0.7.0
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-cmp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cys8lz68za30z5cabvwrpnv2pg1ppqxdncmiz8iy2j624a5kg15"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-cmp"))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
     "This package is intended to be a more powerful and safer alternative to
@@code{reflect.@code{DeepEqual}} for comparing whether two values are
semantically equal.")
    (license license:bsd-3)))

(define-public go-github-com-hashicorp-golang-lru-2.0.7
  (package
    (name "go-github-com-hashicorp-golang-lru")
    (version "2.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hashicorp/golang-lru")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0lb2ylv2bz6lsqhn6c2hsafjjcx0hsdbah6arhb778g3xbkpgvf3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/hashicorp/golang-lru/v2"
      #:unpack-path "github.com/hashicorp/golang-lru"))
    (home-page "https://github.com/hashicorp/golang-lru")
    (synopsis "golang-lru")
    (description
     "Package lru provides three different LRU caches of varying sophistication.")
    (license license:mpl2.0)))

(define-public go-github-com-matryer-is-1.4.1
  (package
    (name "go-github-com-matryer-is")
    (version "1.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/matryer/is")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04wgh8j2n19a5a4p8jjnya6yl5dm07kbbcz8gq6gj980bd9fk1ir"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/matryer/is"))
    (home-page "https://github.com/matryer/is")
    (synopsis "is")
    (description
     "Package is provides a lightweight extension to the standard library's testing
capabilities.")
    (license license:expat)))

(define-public go-golang-org-x-net-0.51.0
  (package
    (name "go-golang-org-x-net")
    (version "0.51.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07kaj9fa5g9yqc7mnm200d2w4hzldcvxdw01lg4cwn6g2iaykc3c"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.48.0
                             go-golang-org-x-sys-0.41.0
                             go-golang-org-x-term-0.40.0
                             go-golang-org-x-text-0.34.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.49.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.49.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16ckj8bqc76cqazxsbck76094ra0ndkkv5c3x6zvxc8fnhq9g5pl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.51.0
                             go-golang-org-x-sys-0.42.0
                             go-golang-org-x-term-0.41.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.41.0
  (package
    (name "go-golang-org-x-term")
    (version "0.41.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i013fx5jk4962izr9f897h04b0im4akydhasm7gx145x5z6218i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.42.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.48.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.48.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ml7qabakjv3lcsv2pkc0h3092547z30pn8qwdiy7vf7hrssqa6g"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.49.0
                             go-golang-org-x-sys-0.41.0
                             go-golang-org-x-term-0.40.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.40.0
  (package
    (name "go-golang-org-x-term")
    (version "0.40.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1x6m4cxk8h88gacxjc6vsaj585zwc8dzpgxwgbq6fwg6l1519vxn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.41.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.34.0
  (package
    (name "go-golang-org-x-text")
    (version "0.34.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10qhscx7zdack9b5ynjiiyk2pl2c5jfamvwgjfhpnnhxgp6jr8rc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.41.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.50.0
  (package
    (name "go-golang-org-x-net")
    (version "0.50.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0azrbdpydjdjg63rj51blwjlqaplwbd5yi9dy4fyxd38wm36yyq3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.48.0
                             go-golang-org-x-sys-0.41.0
                             go-golang-org-x-term-0.40.0
                             go-golang-org-x-text-0.34.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.47.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.47.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07zig5a9agval88irwa4imbl2rkfb4h368gai4zh0dxqvwkwni7q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.48.0
                             go-golang-org-x-sys-0.40.0
                             go-golang-org-x-term-0.39.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.39.0
  (package
    (name "go-golang-org-x-term")
    (version "0.39.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hb99x8d8jpc2q5w4xlhmhasqvr3y32p47b4hik543nr95bgh8vn"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.40.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.33.0
  (package
    (name "go-golang-org-x-text")
    (version "0.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16zd4n6mi1rb1givbc1vfnalh98ssyfzcw6xyyawr8iyckxgil1f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.40.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.49.0
  (package
    (name "go-golang-org-x-net")
    (version "0.49.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0z3j6cp7hx2hinm8wj483rqf0xqish2yvyan4lad9xhfdhyvmcka"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.47.0
                             go-golang-org-x-sys-0.40.0
                             go-golang-org-x-term-0.39.0
                             go-golang-org-x-text-0.33.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.31.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.31.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03jwr0fkyg3kbp7vrc0q9wdmiqn1rxswqh8r4znqqhbpq5fwksvq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.39.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.46.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.46.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07qn22z6xfs3d0jximgssasx580z8kwz9qacdac4sgdpc1kmqn82"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.47.0
                             go-golang-org-x-sys-0.39.0
                             go-golang-org-x-term-0.38.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.39.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.39.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "070pvn1p797j0fpzz9rc94ysr4j7bsfrgqzd6350wgnkffn76hiq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.38.0
  (package
    (name "go-golang-org-x-term")
    (version "0.38.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1k5cc7frng4dzflq0acz2c64kdcq74jll115x6iah9n6apvrgag3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.39.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.44.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.44.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00yfs8a1ky7jr24rrwq406fyhx71bgywliffb74cjy4rhsm208l5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.46.0
                             go-golang-org-x-sys-0.38.0
                             go-golang-org-x-term-0.37.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.37.0
  (package
    (name "go-golang-org-x-term")
    (version "0.37.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i54d199c3v4kscwry1nzd9kb9x49bcrfsrwkhhw1rnxsja9kcy3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.38.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.31.0
  (package
    (name "go-golang-org-x-text")
    (version "0.31.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cnrjnyhlkxcs1gkl5dlx5kcfzv88z8sg1j7jf8b9c9bimjijnx9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.38.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.47.0
  (package
    (name "go-golang-org-x-net")
    (version "0.47.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0f31sk5xwkdrfj62j2xw4y6ll2w5wwdzppxsj23d0z0qvl4n18fs"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.44.0
                             go-golang-org-x-sys-0.38.0
                             go-golang-org-x-term-0.37.0
                             go-golang-org-x-text-0.31.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20251111182119-bc8e575c7b54
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20251111182119-bc8e575c7b54")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hgay2m1j2xzfgx4i1psnc1hgdryl3948qjknbyml3r92jhixgk2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.30.0
                             go-golang-org-x-sync-0.18.0
                             go-golang-org-x-sys-0.38.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.39.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.39.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0f1p38k2dw3pisp0pkw4cb49wv9mmiv6cz1yncvi000pamdg0j6k"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.30.0
                        go-golang-org-x-net-0.47.0
                        go-golang-org-x-sync-0.18.0
                        go-golang-org-x-telemetry-0.0.0-20251111182119-bc8e575c7b54))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.32.0
  (package
    (name "go-golang-org-x-text")
    (version "0.32.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gypmskpr1zpvdi0a5zxl6xnk43gb16fwr1bdg0kx6x55hl1z46s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.39.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.48.0
  (package
    (name "go-golang-org-x-net")
    (version "0.48.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wbdyjs97a24h4dg3rfq27zwcbm7szjnpa88vj3n1hc9r1v5v6m1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.46.0
                             go-golang-org-x-sys-0.39.0
                             go-golang-org-x-term-0.38.0
                             go-golang-org-x-text-0.32.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.45.0
  (package
    (name "go-golang-org-x-net")
    (version "0.45.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02iifaz05s2cddpypzx2va23z7i0dw4z1fri6gl8hj74p1ssp886"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.42.0
                             go-golang-org-x-sys-0.36.0
                             go-golang-org-x-term-0.35.0
                             go-golang-org-x-text-0.29.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.43.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.43.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1d49g86ndfzj40nrichhhsknn6lgl1gh8862dmgsx0l0885kik9i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.45.0
                             go-golang-org-x-sys-0.37.0
                             go-golang-org-x-term-0.36.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.36.0
  (package
    (name "go-golang-org-x-term")
    (version "0.36.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13xd1frw2jzqbd8743m5zhrq6asz9ar1maxd3cbk3rzybc9wx0p5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.37.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.30.0
  (package
    (name "go-golang-org-x-text")
    (version "0.30.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pgpfzk86wqf6k2fbrxa80pz1jx6y4dfr4dr26pwsw6j7l3s5pby"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.37.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.46.0
  (package
    (name "go-golang-org-x-net")
    (version "0.46.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zb45fmiwsi8nq56wfzk83q7ksqk8jaw8rlpnxv929c419gi8h0s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.43.0
                             go-golang-org-x-sys-0.37.0
                             go-golang-org-x-term-0.36.0
                             go-golang-org-x-text-0.30.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.42.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.42.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1l51p6db9sha2c6f8hqanp60ziy4f79gniz3blbi0vvd7pwm73hd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.43.0
                             go-golang-org-x-sys-0.36.0
                             go-golang-org-x-term-0.35.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.35.0
  (package
    (name "go-golang-org-x-term")
    (version "0.35.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1496a1k8fn9yf3sn5j65cjvbkagp1g6981ssgbxrnc7lllaflw6g"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.36.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.29.0
  (package
    (name "go-golang-org-x-text")
    (version "0.29.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bqawr6mmljgcv18zvhfnn6wbgwn7swcmsvb8s2a4j8cdl67hgyc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.36.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.44.0
  (package
    (name "go-golang-org-x-net")
    (version "0.44.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0f20m4j0ml1jpx5y0ki12f0dykg67mqqb21w80x68w3yp4flpybi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.42.0
                             go-golang-org-x-sys-0.36.0
                             go-golang-org-x-term-0.35.0
                             go-golang-org-x-text-0.29.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.41.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.41.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rwnx3ry7yl0jkl9gxw8xgm2dbpmswa62y4b4sjsnlkqv8zyw0c0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.42.0
                             go-golang-org-x-sys-0.35.0
                             go-golang-org-x-term-0.34.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.34.0
  (package
    (name "go-golang-org-x-term")
    (version "0.34.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xflwjirg5hmz6k0ycawdd77z4g4hwi4cw261fd28lc4bsafi8kx"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.35.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.28.0
  (package
    (name "go-golang-org-x-text")
    (version "0.28.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1b6zgs0daqk271i520172149k8i15fl28shrhivikr7z13szcf96"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.35.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.43.0
  (package
    (name "go-golang-org-x-net")
    (version "0.43.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zjpf0db94rqpdspmk7mr80hb4djj95lnnmmd9lc02zcb90f5zbd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.41.0
                             go-golang-org-x-sys-0.35.0
                             go-golang-org-x-term-0.34.0
                             go-golang-org-x-text-0.28.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.40.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.40.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bk2bdlxkk3xfb5jgg9ign35r8dz6925fdpfzyrlyjsj7xfhw4yi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.41.0
                             go-golang-org-x-sys-0.34.0
                             go-golang-org-x-term-0.33.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.33.0
  (package
    (name "go-golang-org-x-term")
    (version "0.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zw8wr9i07lr900pha6ly3kayj7v6nkmbljdxvaw9g1bi7aibmh6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.34.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.27.0
  (package
    (name "go-golang-org-x-text")
    (version "0.27.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rzblw21c1bqpfyxd9miw5p61f96pd5s0n0n8vnzsic2j4zwkqhw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.34.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.42.0
  (package
    (name "go-golang-org-x-net")
    (version "0.42.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0srzxz44nrl7v5ian4kf4k9a9733cinzn260j7zfq8885dxaa633"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.40.0
                             go-golang-org-x-sys-0.34.0
                             go-golang-org-x-term-0.33.0
                             go-golang-org-x-text-0.27.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.25.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.25.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fxrnmqcs91avhc5bsxsr1l4dnalbii1cc63mkkbma1b4z75csii"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.13.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.39.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.39.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0mdw49a6w7iwydsh53cj6ymq6qnx0zhjcv13dph1cy5a0vn9hgh5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.33.0
                             go-golang-org-x-term-0.32.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.24.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.24.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17sjk98d3qwh9s6gqjmfy07z0gyj5hyv5a9kyg4si3yjfzbnwhx7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.13.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.38.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.38.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wx7wf3ifb10cx2yckm925a9ydy5bw3iv664cma27abkfssj07ba"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.33.0
                             go-golang-org-x-term-0.32.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.33.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19m090xd3abysvk1y07fhhd025k3s456i71ww0pq0b2pzsva5ra2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.32.0
  (package
    (name "go-golang-org-x-term")
    (version "0.32.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09q25x265yyy4jfjqpm10x8jai30wcbhb7bqgkjll4gw2sz3zhz1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.33.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-github-com-google-go-cmp-0.6.0
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-cmp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n1j4hi50bl05pyys4i7y417k9g6k1blslj27z327qny7kkdl2ma"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/google/go-cmp"))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
     "This package is intended to be a more powerful and safer alternative to
@@code{reflect.@code{DeepEqual}} for comparing whether two values are
semantically equal.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.19.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17cl6lik51fqz0mwwsfnbbxgx1lky8smv3z2r03k7fdar4n68d6v"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.10.0
                             go-golang-org-x-sys-0.17.0
                             go-golang-org-x-term-0.17.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.17.0
  (package
    (name "go-golang-org-x-term")
    (version "0.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1h01ircszw707fssvhggqk8gv1bydg0hzx57xxm0zwfyy5c3nall"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.17.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.14.0
  (package
    (name "go-golang-org-x-text")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10mgwlhhyqrxmbrznsx1fdnk43fkn2mbjbcmwkhv0aps74l1xzkl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.6.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.21.0
  (package
    (name "go-golang-org-x-net")
    (version "0.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1k06xgjzz72fmfp2x5nhlsl2r6dg3fhwf7xrg2zzbapdjcramy1d"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.19.0
                             go-golang-org-x-sys-0.17.0
                             go-golang-org-x-term-0.17.0
                             go-golang-org-x-text-0.14.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.23.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.23.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0q92kp8nwa8msgs0bsrypa85mqvpa23pvsv4pwnmfsk5cl76ldnf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.20.0
                             go-golang-org-x-term-0.20.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.20.0
  (package
    (name "go-golang-org-x-term")
    (version "0.20.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cj4k893215sfrn8x3smmz9wps5h4vd02lw6kz4d94nqjra8wkwi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.20.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.15.0
  (package
    (name "go-golang-org-x-text")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "196y4ijjwl01v9si1s0signbhnhcbmcigyndbsvbl8gsyrxfvx3i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.6.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.25.0
  (package
    (name "go-golang-org-x-net")
    (version "0.25.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17ipy444cd74vh8h3vbyg835gwcrg93advsy5kb6x3qdnrf5yc92"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.23.0
                             go-golang-org-x-sys-0.20.0
                             go-golang-org-x-term-0.20.0
                             go-golang-org-x-text-0.15.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.15.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1024mn5jnpmqmqzll0n30knsjxk66a85hrhifcdzfsjkfr1ylwl5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.13.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.6.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wpwi7rji6abjhlirh91gqwi81vv8is580jnm949n393zjrsdf1c"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.17.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yqbn48bfkggn1hhw10jxg5gfmmw5kfvqcxnxim7i9k20b2b4sr6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20240228155512-f48c80bd79b2
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20240228155512-f48c80bd79b2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bbpilv20k8jb0k2gyx3ybx7v5gd2dqqsh0v6rjva08b7bvixc96"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.15.0
                             go-golang-org-x-sync-0.6.0
                             go-golang-org-x-sys-0.17.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.21.1-0.20240508182429-e35e4ccd0d2d
  (package
    (name "go-golang-org-x-tools")
    (version "0.21.1-0.20240508182429-e35e4ccd0d2d")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02vkqazcf0qnrl4wyngayl53lypm2998cava1lxs4blsb8kh0jcq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.17.0
                        go-golang-org-x-net-0.25.0
                        go-golang-org-x-sync-0.7.0
                        go-golang-org-x-telemetry-0.0.0-20240228155512-f48c80bd79b2))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.25.0
  (package
    (name "go-golang-org-x-text")
    (version "0.25.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1r9532ml0psfby89agf20q23qzwfikhydl8q77ad5y73xvdx89lf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list
                        go-golang-org-x-tools-0.21.1-0.20240508182429-e35e4ccd0d2d))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.40.0
  (package
    (name "go-golang-org-x-net")
    (version "0.40.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zsh08wbamzlvlwvlw6slgcqhaa59rwz9pq01lbyjigw6cfww406"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.38.0
                             go-golang-org-x-sys-0.33.0
                             go-golang-org-x-term-0.32.0
                             go-golang-org-x-text-0.25.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.14.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gpa1v6wnp1bszk5iyiakq1j37icgxswj3iysdrdyp0yadw0pm30"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.33.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1lbb4y1c5b4719pdhfcb90sdzagzsb2lw5hx8gizsba3cj0r0f25"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.24.0
                        go-golang-org-x-net-0.40.0
                        go-golang-org-x-sync-0.14.0
                        go-golang-org-x-telemetry-0.0.0-20240521205824-bda55230c457))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.26.0
  (package
    (name "go-golang-org-x-text")
    (version "0.26.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0r2hc94xskj6z7pxhcamrn4420bwkl04y2aa0asskshag05c0mlk"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.33.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.41.0
  (package
    (name "go-golang-org-x-net")
    (version "0.41.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1y2j7wj0y603h30hv1lx7h3gbwiiwi2mwl22rr2z06k6ngr65ypb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.39.0
                             go-golang-org-x-sys-0.33.0
                             go-golang-org-x-term-0.32.0
                             go-golang-org-x-text-0.26.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.15.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0hfxqj3cf6a06xk5nf2wn8drp413a6fxg359ccb81w87dy31xzi5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.12.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vzhyzdrbsbav968s1aqzi9x4dynqzd0qfsyp6fz6m8y4cxik11p"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.8.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1p81niiin8dwyrjl2xsc95136w3vdw4kmj0w3mlh0vh5v134s4xq"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.8.0
  (package
    (name "go-golang-org-x-term")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1c2y6ln6yqi9rrsn2i2yp8zga8j1vp0jcxd6152r8r92bhnsrgqf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.8.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.9.0
  (package
    (name "go-golang-org-x-text")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1krb09z7vcl99h7a1ac47n4s13mjp0x549y4s49k2ncrqddwklf7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.6.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.10.0
  (package
    (name "go-golang-org-x-net")
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1m27i5hpk2bdljz6zk8p6270bk6yrn6n5rnynr71ff2rh18s4h8y"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-sys-0.8.0
                             go-golang-org-x-term-0.8.0
                             go-golang-org-x-text-0.9.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.13.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1lx4zhl8mazi8n16ns55zkh9hl870ij1ag9an3bfzp0ppf5y9sif"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.10.0
                             go-golang-org-x-sys-0.12.0
                             go-golang-org-x-term-0.12.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.12.0
  (package
    (name "go-golang-org-x-term")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ir2n7m5gm6bs2j9nidp09cxlv6190nq3lmnqsavvzmgxb92hn9l"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.12.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.8.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dnzhiqgx33r2l0bz4amx52cmmw0wz4cvpm6ax5gq4ax6agk6998"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.5.0
  (package
    (name "go-golang-org-x-term")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yiyjhyzsq7iml85nry5c7jlazrqlywkvgpllhcw23k4ndgy4w3z"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.5.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.7.0
  (package
    (name "go-golang-org-x-text")
    (version "0.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17k7rgmv976ihfzwr8a5gfb65m1gdp1a4s4mk0fn38dwmxgig3k5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.1.12))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.6.0
  (package
    (name "go-golang-org-x-net")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0mgh4rzxn1rwb17h8wbgzq7jsics03vrm8k9vbykvi90ra87ihbv"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-sys-0.5.0
                             go-golang-org-x-term-0.5.0
                             go-golang-org-x-text-0.7.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.5.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ypmc9bbxxz1wjl8bp2233x7qgfpiz72d0smm0jng1z5bdjmayx7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.1.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07qrhni6f5hh5p95k1yk6s4wsj341q663irvx6rllrxfsymj6a0z"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.6.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12gl0k0653zgsims5rgqm9pcgw76yxldkng9987c0k3ysx75z5sf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.8.0
                             go-golang-org-x-net-0.6.0
                             go-golang-org-x-sync-0.1.0
                             go-golang-org-x-sys-0.5.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.13.0
  (package
    (name "go-golang-org-x-text")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15k0hrivb22qwifiimqaz36xcyr86ml4h27s4jlczmybqly7hlwg"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.6.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.15.0
  (package
    (name "go-golang-org-x-net")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0z49cp7lwcksqqrhq03lbs6xxn8xil0ahanp6xkkyrv60d5n0j4k"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.13.0
                             go-golang-org-x-sys-0.12.0
                             go-golang-org-x-term-0.12.0
                             go-golang-org-x-text-0.13.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.12.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pjv2zmjqwfbn399smanczsy2lqfmyscjrd9jx2nci5rm7r6fds7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.3.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jmkqah45db9nz6yjdd8vvanpjfzb5lsv6bxf0d1dih4zhp4l8kc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.13.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08ak79na26dm4xq071pr6qf3gxqd9h84pygcch4lh3yvnqssybfc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.4.13
                             go-golang-org-x-mod-0.12.0
                             go-golang-org-x-net-0.15.0
                             go-golang-org-x-sync-0.3.0
                             go-golang-org-x-sys-0.12.0))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.17.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1spva76nman7p8hy484vql57gwrfzkg8cbvbi12il0gy0afq9mp9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.13.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.7.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "03yq3pnjwqxqy1cvbkaa39ca2b9cli1k5wnz76l3a65n9fafai6q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.20.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.20.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1c0534cl6mm3x4gi3cf9x6kdg1v5xdd5rsm0iqjnj7yxinmb8gw6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20240521205824-bda55230c457
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20240521205824-bda55230c457")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pnij6aljk9lrgrw4zd3gdsa5jwqz3zrn1197zh8k2rm07ywbpkp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.17.0
                             go-golang-org-x-sync-0.7.0
                             go-golang-org-x-sys-0.20.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.34.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.34.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gin77ikq2kzbqpyjp87ndkcpdsn3dnh6bh4j2038dzqh0kgdqqb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.25.0
                        go-golang-org-x-net-0.41.0
                        go-golang-org-x-sync-0.15.0
                        go-golang-org-x-telemetry-0.0.0-20240521205824-bda55230c457))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.26.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.26.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kxra52rzrlnfkwfpl1sjb31n0nx0rrd6d9qhm5mz95sn11vcwm8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.34.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20250710130107-8d8967aff50b
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20250710130107-8d8967aff50b")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0g4hrzj2mkmijb7q6pdwkdg882qbz346cs571lrfmrp0kjyxaig3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.26.0
                             go-golang-org-x-sync-0.16.0
                             go-golang-org-x-sys-0.34.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.35.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.35.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0lk3y09hhvn8r4335cadhpnfk4dbk12khaasbr4yg9gpywidz7c7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.26.0
                        go-golang-org-x-net-0.42.0
                        go-golang-org-x-sync-0.16.0
                        go-golang-org-x-telemetry-0.0.0-20250710130107-8d8967aff50b))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.27.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.27.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1sc4khiag5xdjmm898iaifxmh1az8a5rc0bic5ylxkcpkkiddn1j"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.35.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.16.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jq6fx9wv0hmg247dlg718ickgv49ddmm1imsbg34cwy8i2878mj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.35.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.35.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01k7rkyqvf99m24xcfjdpkrad22rvvs9xp91l1sbsyjgzzy8g620"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20250807160809-1a19826ec488
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20250807160809-1a19826ec488")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vriymj4kgjcl6x32mssa5ibbw20ljd0z1z288nh0rf13bijdjm9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.27.0
                             go-golang-org-x-sync-0.16.0
                             go-golang-org-x-sys-0.35.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.36.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.36.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15lxq0hwj85brz97mdjjbnj6h504n33ssx3cxzx32g87x3lz34md"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.27.0
                        go-golang-org-x-net-0.43.0
                        go-golang-org-x-sync-0.16.0
                        go-golang-org-x-telemetry-0.0.0-20250807160809-1a19826ec488))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.28.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.28.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wwcxzq7qahnvbfinwhz31mriqq43z480vyn82yambnahq7gl452"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.36.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20250908211612-aef8a434d053
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20250908211612-aef8a434d053")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0z8hhil19l1l9qc4ricgb512lhqhi6mahas1yxrnf2zfz7lsimlr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.28.0
                             go-golang-org-x-sync-0.17.0
                             go-golang-org-x-sys-0.36.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.37.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.37.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l0srynl2cikmz089q5vqgifz6ll2ic1762fbfvak26vqbcx0knz"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.28.0
                        go-golang-org-x-net-0.44.0
                        go-golang-org-x-sync-0.17.0
                        go-golang-org-x-telemetry-0.0.0-20250908211612-aef8a434d053))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.29.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.29.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cc79540hc7yjwmqi6574808i3i3p0n8q49fp7vccb86qgms1rcc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.37.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.17.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bga9sfiwqxs7g913p7b355hg30agw58h5f5k7rzgpsai37nbkik"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20251008203120-078029d740a8
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20251008203120-078029d740a8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0h0yk9xlc1zi72fsg4pvl3f4a53ygd2wv186gyx84ibq620a2a09"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.29.0
                             go-golang-org-x-sync-0.17.0
                             go-golang-org-x-sys-0.37.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.38.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.38.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wg5cjz0skwafi1riqm7l06s9p1jbsijym5s7w8nc2cyq1cwi0w4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.29.0
                        go-golang-org-x-net-0.46.0
                        go-golang-org-x-sync-0.17.0
                        go-golang-org-x-telemetry-0.0.0-20251008203120-078029d740a8))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.30.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.30.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1q8argakyi6x65kisydgkzicz28i03r31bb3bdrp7d5j08kxinv4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.38.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20251203150158-8fff8a5912fc
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20251203150158-8fff8a5912fc")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vlml5zadv8gjcsvh72bahrs2vfbcpgx39hr0035q654ypglj1bm"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.30.0
                             go-golang-org-x-sync-0.18.0
                             go-golang-org-x-sys-0.38.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.40.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.40.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05prg8ay4z0f49g13mm9b1iwqpsq6kaw0qcafmbmz95rgbvzfrfr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.31.0
                        go-golang-org-x-net-0.48.0
                        go-golang-org-x-sync-0.19.0
                        go-golang-org-x-telemetry-0.0.0-20251203150158-8fff8a5912fc))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.32.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.32.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sf1jpxakgb3wlhyjfrhrbypj7xccvqanqmxzyqhyhm5bniq12q9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.40.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.40.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.40.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rygxjhh29hjzr6jni6kxaib1c9d6mp2wvjngfzdpxxmm9rk9r3d"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20260109210033-bd525da824e2
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20260109210033-bd525da824e2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "06iz0ga0lrxzqf2fyrngy9x6cnx6rvrcnfgk2f2gm4r3y0690f4m"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.32.0
                             go-golang-org-x-sync-0.19.0
                             go-golang-org-x-sys-0.40.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.41.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.41.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vn6a2an85732n23xz4i8z9jk4wqnxxhrp1wd77zs2n3yny8m3yw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.32.0
                        go-golang-org-x-net-0.49.0
                        go-golang-org-x-sync-0.19.0
                        go-golang-org-x-telemetry-0.0.0-20260109210033-bd525da824e2))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-mod-0.33.0
  (package
    (name "go-golang-org-x-mod")
    (version "0.33.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/mod")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0g1g82lzcrn11b33aw1gs8k3whf7l76kgzxr49126shbyq6dxaws"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/mod"))
    (propagated-inputs (list go-golang-org-x-tools-0.41.0))
    (home-page "https://golang.org/x/mod")
    (synopsis "mod")
    (description
     "This repository holds packages for writing tools that work directly with Go
module mechanics.  That is, it is for direct manipulation of Go modules
themselves.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.19.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.19.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ykjzxskvy1jbvyp2svd766jiyv3m0rqg89ifg7flllrqbx5kd25"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.41.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.41.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "015ip5ifzl21k50d6a5labxk967cjir905cg3xb2spslsnp0304v"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-telemetry-0.0.0-20260209163413-e7419c687ee4
  (package
    (name "go-golang-org-x-telemetry")
    (version "0.0.0-20260209163413-e7419c687ee4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/telemetry")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wr4b40lwzpac2n9ipz5lmq6p973g5mr2im38dy3816lbg84rp38"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/telemetry"))
    (propagated-inputs (list go-golang-org-x-mod-0.33.0
                             go-golang-org-x-sync-0.19.0
                             go-golang-org-x-sys-0.41.0))
    (home-page "https://golang.org/x/telemetry")
    (synopsis "Go Telemetry")
    (description
     "This repository holds the Go Telemetry server code and libraries, used for
hosting @@url{https://telemetry.go.dev,telemetry.go.dev} and instrumenting Go
toolchain programs with opt-in telemetry.")
    (license license:bsd-3)))

(define-public go-golang-org-x-tools-0.42.0
  (package
    (name "go-golang-org-x-tools")
    (version "0.42.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0206hl6v7gy7cxwamjapa1zr2n3clj0vaqwyy6izcw18faga466i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/tools"))
    (propagated-inputs (list go-github-com-google-go-cmp-0.6.0
                        go-github-com-yuin-goldmark-1.4.13
                        go-golang-org-x-mod-0.33.0
                        go-golang-org-x-net-0.50.0
                        go-golang-org-x-sync-0.19.0
                        go-golang-org-x-telemetry-0.0.0-20260209163413-e7419c687ee4))
    (home-page "https://golang.org/x/tools")
    (synopsis "Go Tools")
    (description
     "This repository provides the @@code{golang.org/x/tools} module, comprising
various tools and packages mostly for static analysis of Go programs, some of
which are listed below.  Use the \"Go reference\" link above for more information
about any package.")
    (license license:bsd-3)))

(define-public go-golang-org-x-text-0.35.0
  (package
    (name "go-golang-org-x-text")
    (version "0.35.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/text")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ak185y6q2gbpmihlgj5aaynbnkm139h3lrmycrb4lp93r2jxfpx"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/text"))
    (propagated-inputs (list go-golang-org-x-tools-0.42.0))
    (home-page "https://golang.org/x/text")
    (synopsis "Go Text")
    (description
     "text is a repository of text-related packages related to internationalization
(i18n) and localization (l10n), such as character encodings, text
transformations, and locale-specific text handling.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.52.0
  (package
    (name "go-golang-org-x-net")
    (version "0.52.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "152pzw1bnfv7byp0pm31gj3rn4z3l8qs14g1zmidm5b12j90c1jd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.49.0
                             go-golang-org-x-sys-0.42.0
                             go-golang-org-x-term-0.41.0
                             go-golang-org-x-text-0.35.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.43.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.43.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18by7v7gvbanxkqjdadisgc7hgsn580yy5zj42wgiv642qd2r11g"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.42.0
  (package
    (name "go-golang-org-x-term")
    (version "0.42.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ms3xm3m17ba2y7vk1mhyqjgzf15qn00v8hb340xivga0yy86a0l"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.43.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-crypto-0.50.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.50.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rk47vw7sirdakvl0z1ffgrsd1xm285i3wv6xbm47b8irvailxxf"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.52.0
                             go-golang-org-x-sys-0.43.0
                             go-golang-org-x-term-0.42.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sync-0.20.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.20.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0inbjipc9a1ai7r1ar4hqgq1d2js5w2v6cnda3l5msna4y227dy9"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-time-0.15.0
  (package
    (name "go-golang-org-x-time")
    (version "0.15.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/time")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qgpq5qdkhx82b0p6616qzsw3a2hgkfzpxwqvhyvk7vhmq1vhgg4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/time"))
    (home-page "https://golang.org/x/time")
    (synopsis "Go Time")
    (description "This repository provides supplementary Go time packages.")
    (license license:bsd-3)))

(define-public go-charm-land-wish-2.0.1
  (package
    (name "go-charm-land-wish")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/wish")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12nq327n2scg4wz3ib75g0151vbmgkqwd5llfz0y80xq9wdfc027"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "charm.land/wish/v2"
      #:unpack-path "charm.land/wish"))
    (propagated-inputs (list go-charm-land-bubbletea-2.0.2
                        go-charm-land-log-2.0.0
                        go-github-com-charmbracelet-colorprofile-0.4.3
                        go-github-com-charmbracelet-keygen-0.5.4
                        go-github-com-charmbracelet-ssh-0.0.0-20250826160808-ebfa259c7309
                        go-github-com-go-git-go-git-5.17.2
                        go-github-com-google-go-cmp-0.7.0
                        go-github-com-hashicorp-golang-lru-v2
                        go-github-com-matryer-is-1.4.1
                        go-golang-org-x-crypto-0.50.0
                        go-golang-org-x-sync-0.20.0
                        go-golang-org-x-time-0.15.0))
    (home-page "https://charm.land/wish")
    (synopsis "Wish")
    (description "Package wish provides utilities for building SSH servers.")
    (license license:expat)))

(define-public go-golang-org-x-sync-0.21.0
  (package
    (name "go-golang-org-x-sync")
    (version "0.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11ix8kkmd7nyarahg3b7j1yp85dgh9cikn3mlva3xbv4pmawyzns"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sync"))
    (home-page "https://golang.org/x/sync")
    (synopsis "Go Sync")
    (description
     "This repository provides Go concurrency primitives in addition to the ones
provided by the language and \"sync\" and \"sync/atomic\" packages.")
    (license license:bsd-3)))

(define-public go-github-com-charmbracelet-ultraviolet-0.0.0-20260703014108-f5a850f9c2b7
  (package
    (name "go-github-com-charmbracelet-ultraviolet")
    (version "0.0.0-20260703014108-f5a850f9c2b7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/ultraviolet")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0psakkpv8vvvfsf2b9lyvlq9xcmpicky12yxdqrqn1rnmwpm4rki"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/ultraviolet"))
    (propagated-inputs (list go-github-com-charmbracelet-colorprofile-0.4.3
                        go-github-com-charmbracelet-x-ansi-0.11.7
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-charmbracelet-x-termios-0.1.1
                        go-github-com-charmbracelet-x-windows-0.2.2
                        go-github-com-clipperhouse-uax29-2.7.0
                        go-github-com-lucasb-eyer-go-colorful-1.4.0
                        go-github-com-muesli-cancelreader-0.2.2
                        go-github-com-rivo-uniseg-0.4.7
                        go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
                        go-golang-org-x-sync-0.21.0
                        go-golang-org-x-sys-0.46.0))
    (home-page "https://github.com/charmbracelet/ultraviolet")
    (synopsis "Ultraviolet")
    (description
     "Package uv (Ultraviolet) provides primitives for building terminal user
interfaces in Go.")
    (license license:expat)))

(define-public go-charm-land-bubbletea-2.0.8
  (package
    (name "go-charm-land-bubbletea")
    (version "2.0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/bubbletea")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1m0mb529gn47vy3j7nm6bx832hvq7sna9q1icl0cgw4r1afs3x0q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "charm.land/bubbletea/v2"
      #:unpack-path "charm.land/bubbletea"))
    (propagated-inputs (list go-github-com-charmbracelet-colorprofile-0.4.3
                        go-github-com-charmbracelet-ultraviolet-0.0.0-20260703014108-f5a850f9c2b7
                        go-github-com-charmbracelet-x-ansi-0.11.7
                        go-github-com-charmbracelet-x-exp-golden-0.0.0-20241212170349-ad4b7ae0f25f
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-lucasb-eyer-go-colorful-1.4.0
                        go-github-com-muesli-cancelreader-0.2.2
                        go-golang-org-x-sys-0.46.0))
    (home-page "https://charm.land/bubbletea")
    (synopsis "Bubble Tea")
    (description
     "Package tea provides a framework for building rich terminal user interfaces
based on the paradigms of The Elm Architecture.  It's well-suited for simple and
complex terminal applications, either inline, full-window, or a mix of both.
It's been battle-tested in several large projects and is production-ready.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-ultraviolet-0.0.0-20260525132238-948f4557a654
  (package
    (name "go-github-com-charmbracelet-ultraviolet")
    (version "0.0.0-20260525132238-948f4557a654")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/ultraviolet")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1r4rk2qv9db6iglxg116vzr0z8hjvkpqcm11qimgc9idlzb3ssrs"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/ultraviolet"))
    (propagated-inputs (list go-github-com-charmbracelet-colorprofile-0.4.3
                        go-github-com-charmbracelet-x-ansi-0.11.7
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-charmbracelet-x-termios-0.1.1
                        go-github-com-charmbracelet-x-windows-0.2.2
                        go-github-com-clipperhouse-uax29-2.7.0
                        go-github-com-lucasb-eyer-go-colorful-1.4.0
                        go-github-com-muesli-cancelreader-0.2.2
                        go-github-com-rivo-uniseg-0.4.7
                        go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
                        go-golang-org-x-sync-0.20.0
                        go-golang-org-x-sys-0.45.0))
    (home-page "https://github.com/charmbracelet/ultraviolet")
    (synopsis "Ultraviolet")
    (description
     "Package uv (Ultraviolet) provides primitives for building terminal user
interfaces in Go.")
    (license license:expat)))

(define-public go-charm-land-bubbletea-2.0.7
  (package
    (name "go-charm-land-bubbletea")
    (version "2.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/bubbletea")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02shwpml0jzw7nyr9bv72vzjd5blxqabs5z0l9w9gpaslnf40ajc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "charm.land/bubbletea/v2"
      #:unpack-path "charm.land/bubbletea"))
    (propagated-inputs (list go-github-com-charmbracelet-colorprofile-0.4.3
                        go-github-com-charmbracelet-ultraviolet-0.0.0-20260525132238-948f4557a654
                        go-github-com-charmbracelet-x-ansi-0.11.7
                        go-github-com-charmbracelet-x-exp-golden-0.0.0-20241212170349-ad4b7ae0f25f
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-lucasb-eyer-go-colorful-1.4.0
                        go-github-com-muesli-cancelreader-0.2.2
                        go-golang-org-x-sys-0.45.0))
    (home-page "https://charm.land/bubbletea")
    (synopsis "Bubble Tea")
    (description
     "Package tea provides a framework for building rich terminal user interfaces
based on the paradigms of The Elm Architecture.  It's well-suited for simple and
complex terminal applications, either inline, full-window, or a mix of both.
It's been battle-tested in several large projects and is production-ready.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.45.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.45.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12agfwdvgamd88rkczfqc8ag4mc8hlj0ilvnvpw0kk0ick8xndx0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-charm-land-lipgloss-2.0.4
  (package
    (name "go-charm-land-lipgloss")
    (version "2.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/lipgloss")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1j7m4ljwg19dkznv8d353chx18ghsrkc42aw4hzply12p2cpcpw8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "charm.land/lipgloss/v2"
      #:unpack-path "charm.land/lipgloss"))
    (propagated-inputs (list go-github-com-aymanbagabas-go-udiff-0.4.1
                        go-github-com-charmbracelet-colorprofile-0.4.3
                        go-github-com-charmbracelet-ultraviolet-0.0.0-20251205161215-1948445e3318
                        go-github-com-charmbracelet-x-ansi-0.11.7
                        go-github-com-charmbracelet-x-exp-golden-0.0.0-20250806222409-83e3a29d542f
                        go-github-com-charmbracelet-x-term-0.2.2
                        go-github-com-clipperhouse-displaywidth-0.11.0
                        go-github-com-lucasb-eyer-go-colorful-1.4.0
                        go-github-com-rivo-uniseg-0.4.7
                        go-golang-org-x-sys-0.45.0))
    (home-page "https://charm.land/lipgloss")
    (synopsis "Lip Gloss")
    (description
     "Package lipgloss provides style definitions for nice terminal layouts.  Built
with TUIs in mind.")
    (license license:expat)))

(define-public go-github-com-makenowjust-heredoc-1.0.0
  (package
    (name "go-github-com-makenowjust-heredoc")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/makenowjust/heredoc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18f21zm8n2wlnkz1ylw8rcxmqxyv2rlz8749yfqggm2m0m2884pj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/MakeNowJust/heredoc"))
    (home-page "https://github.com/MakeNowJust/heredoc")
    (synopsis "heredoc")
    (description
     "Package heredoc provides creation of here-documents from raw strings.")
    (license license:expat)))

(define-public go-github-com-atotto-clipboard-0.1.4
  (package
    (name "go-github-com-atotto-clipboard")
    (version "0.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/atotto/clipboard")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ycd8zkgsq9iil9svhlwvhcqwcd7vik73nf8rnyfnn10gpjx97k5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/atotto/clipboard"))
    (home-page "https://github.com/atotto/clipboard")
    (synopsis "Clipboard for Go")
    (description "Package clipboard read/write on clipboard.")
    (license license:bsd-3)))

(define-public go-github-com-charmbracelet-harmonica-0.2.0
  (package
    (name "go-github-com-charmbracelet-harmonica")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/harmonica")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1aasg0c0xxhwav4ivm1mqmsqab6lk407xky8c19pb85r1hdbq0n7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/harmonica"))
    (home-page "https://github.com/charmbracelet/harmonica")
    (synopsis "Harmonica")
    (description
     "Package harmonica is a set of physics-based animation tools for 2D and 3D
applications.  There's a spring animation simulator for for smooth, realistic
motion and a projectile simulator well suited for projectiles and particles.")
    (license license:expat)))

(define-public go-github-com-dustin-go-humanize-1.0.1
  (package
    (name "go-github-com-dustin-go-humanize")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dustin/go-humanize")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1iyhd90pnmxh64nhsh6k02c1b1glpmhh4whga9jgb9g0i5hz3sya"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/dustin/go-humanize"))
    (home-page "https://github.com/dustin/go-humanize")
    (synopsis "Humane Units")
    (description
     "Package humanize converts boring ugly numbers to human-friendly strings and
back.")
    (license license:expat)))

(define-public go-github-com-mattn-go-runewidth-0.0.24
  (package
    (name "go-github-com-mattn-go-runewidth")
    (version "0.0.24")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mattn/go-runewidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "139p1fw908c5wd2njpw9725kcbzp12df5adyiw178kd595kaysxp"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mattn/go-runewidth"))
    (propagated-inputs (list go-github-com-clipperhouse-uax29-2.2.0))
    (home-page "https://github.com/mattn/go-runewidth")
    (synopsis "go-runewidth")
    (description
     "This package provides functions to get fixed width of the character or string.")
    (license license:expat)))

(define-public go-github-com-kylelemons-godebug-1.1.0
  (package
    (name "go-github-com-kylelemons-godebug")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kylelemons/godebug")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dkk3friykg8p6wgqryx6745ahhb9z1j740k7px9dac6v5xjp78c"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/kylelemons/godebug"))
    (home-page "https://github.com/kylelemons/godebug")
    (synopsis "Pretty Printing for Go")
    (description
     "Have you ever wanted to get a pretty-printed version of a Go data structure,
complete with indentation? I have found this especially useful in unit tests and
in debugging my code, and thus godebug was born!")
    (license license:asl2.0)))

(define-public go-github-com-sahilm-fuzzy-0.1.3
  (package
    (name "go-github-com-sahilm-fuzzy")
    (version "0.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sahilm/fuzzy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mn8813fbfigkh3z71lzqclxgfj2dfxjxp9nxrv1z076z1aj51c8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/sahilm/fuzzy"))
    (propagated-inputs (list go-github-com-kylelemons-godebug-1.1.0))
    (home-page "https://github.com/sahilm/fuzzy")
    (synopsis "fuzzy")
    (description
     "Package fuzzy provides fuzzy string matching optimized for filenames and code
symbols in the style of Sublime Text, VSCode, @code{IntelliJ} IDEA et al.")
    (license license:expat)))

(define-public go-charm-land-bubbles-2.1.1
  (package
    (name "go-charm-land-bubbles")
    (version "2.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/bubbles")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i91gqgqpxvlwca7r633ckvni5y530vild3y75ri75vg4myr2hfb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "charm.land/bubbles/v2"
      #:unpack-path "charm.land/bubbles"))
    (propagated-inputs (list go-charm-land-bubbletea-2.0.7
                        go-charm-land-lipgloss-2.0.4
                        go-github-com-atotto-clipboard-0.1.4
                        go-github-com-charmbracelet-harmonica-0.2.0
                        go-github-com-charmbracelet-x-ansi-0.11.7
                        go-github-com-charmbracelet-x-exp-golden-0.0.0-20250806222409-83e3a29d542f
                        go-github-com-dustin-go-humanize-1.0.1
                        go-github-com-makenowjust-heredoc-1.0.0
                        go-github-com-mattn-go-runewidth-0.0.24
                        go-github-com-rivo-uniseg-0.4.7
                        go-github-com-sahilm-fuzzy-0.1.3))
    (home-page "https://charm.land/bubbles")
    (synopsis "Bubbles")
    (description
     "Package bubbles provides some components for Bubble Tea applications.  These
components are used in production in Glow, Charm and many other applications.")
    (license license:expat)))

(define-public go-github-com-alecthomas-repr-0.4.0
  (package
    (name "go-github-com-alecthomas-repr")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alecthomas/repr")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ikvl78dighkn87bxk6gki4wcz9f138n7kbqkagj5vbdb690yjkl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/alecthomas/repr"))
    (home-page "https://github.com/alecthomas/repr")
    (synopsis "Python's repr() for Go")
    (description
     "Package repr attempts to represent Go values in a form that can be
copy-and-pasted into source code directly.")
    (license license:expat)))

(define-public go-github-com-hexops-gotextdiff-1.0.3
  (package
    (name "go-github-com-hexops-gotextdiff")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hexops/gotextdiff")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1vgq6w0cfhr76qlczgm5khsj1wnjkva0vhkh3qspaa1nkfw3jny1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/hexops/gotextdiff"))
    (home-page "https://github.com/hexops/gotextdiff")
    (synopsis "gotextdiff - unified text diffing in Go")
    (description "package gotextdiff supports a pluggable diff algorithm.")
    (license license:bsd-3)))

(define-public go-github-com-alecthomas-assert-2.11.0
  (package
    (name "go-github-com-alecthomas-assert")
    (version "2.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alecthomas/assert")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dvpz4xpx58q3nfwxcsci60c9zxmbmhr6pwr4mc7pgycdjr1cn6r"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/alecthomas/assert/v2"
      #:unpack-path "github.com/alecthomas/assert"))
    (propagated-inputs (list go-github-com-alecthomas-repr-0.4.0
                             go-github-com-hexops-gotextdiff-1.0.3))
    (home-page "https://github.com/alecthomas/assert")
    (synopsis "A simple assertion library using Go generics")
    (description
     "Package assert provides type-safe assertions with clean error messages.")
    (license license:expat)))

(define-public go-github-com-alecthomas-repr-0.5.1
  (package
    (name "go-github-com-alecthomas-repr")
    (version "0.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alecthomas/repr")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c3wws37bbxycnq4zg35bjw4hy0wq3pv4f123lk7mfg0kvkp9h73"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/alecthomas/repr"))
    (home-page "https://github.com/alecthomas/repr")
    (synopsis "Python's repr() for Go")
    (description
     "Package repr attempts to represent Go values in a form that can be
copy-and-pasted into source code directly.")
    (license license:expat)))

(define-public go-github-com-dlclark-regexp2-1.11.5
  (package
    (name "go-github-com-dlclark-regexp2")
    (version "1.11.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dlclark/regexp2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i5c7ak8r4wwlyrx5f1mdipqk6p6ms1jgclb7hlb4qgy83c7xplc"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/dlclark/regexp2"))
    (home-page "https://github.com/dlclark/regexp2")
    (synopsis "regexp2 - full featured regular expressions for Go")
    (description
     "Package regexp2 is a regexp package that has an interface similar to Go's
framework regexp engine but uses a more feature full regex engine behind the
scenes.")
    (license license:expat)))

(define-public go-github-com-alecthomas-chroma-2.20.0
  (package
    (name "go-github-com-alecthomas-chroma")
    (version "2.20.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/alecthomas/chroma")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05w4hnfcxqdlsz7mkc0m3jbp1aj67wzyhq5jh8ldfgnyjnlafia3"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/alecthomas/chroma/v2"
      #:unpack-path "github.com/alecthomas/chroma"))
    (propagated-inputs (list go-github-com-alecthomas-assert-v2
                             go-github-com-alecthomas-repr-0.5.1
                             go-github-com-dlclark-regexp2-1.11.5))
    (home-page "https://github.com/alecthomas/chroma")
    (synopsis "A general purpose syntax highlighter in pure Go")
    (description
     "Package chroma takes source code and other structured text and converts it into
syntax highlighted HTML, ANSI- coloured text, etc.")
    (license #f)))

(define-public go-github-com-charmbracelet-colorprofile-0.2.3-0.20250311203215-f60798e515dc
  (package
    (name "go-github-com-charmbracelet-colorprofile")
    (version "0.2.3-0.20250311203215-f60798e515dc")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/colorprofile")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05d7dnqkncc1j2lfyw7c7l3mv328wp3qxvaq23rjz4xalwm1zp5y"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/colorprofile"))
    (propagated-inputs (list go-github-com-charmbracelet-x-ansi-0.8.0
                        go-github-com-charmbracelet-x-term-0.2.1
                        go-github-com-lucasb-eyer-go-colorful-1.2.0
                        go-github-com-xo-terminfo-0.0.0-20220910002029-abceb7e1c41e
                        go-golang-org-x-sys-0.30.0))
    (home-page "https://github.com/charmbracelet/colorprofile")
    (synopsis "Colorprofile")
    (description
     "Package colorprofile provides a way to downsample ANSI escape sequence colors
and styles automatically based on output, environment variables, and Terminfo
databases.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-ansi-0.8.0
  (package
    (name "go-github-com-charmbracelet-x-ansi")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "ansi"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17gxmjaa08glhlxmjqdpsvr8dpw9jnkgx534j0i75wk3np9fji5g"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/ansi"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-lucasb-eyer-go-colorful-1.2.0
                             go-github-com-mattn-go-runewidth-0.0.16
                             go-github-com-rivo-uniseg-0.4.7))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package ansi defines common ANSI escape sequences based on the ECMA-48 specs.")
    (license license:expat)))

(define-public go-golang-org-x-sys-0.26.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.26.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qdg8lrc5f8527adc9xarp4dm30i2la02h7x3nhj6486vlkw762a"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-github-com-charmbracelet-x-term-0.2.1
  (package
    (name "go-github-com-charmbracelet-x-term")
    (version "0.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "term"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1shw55110fnn4xz80wmgr18czmiil6z1j064m90iw8c7j9llfzn5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/term"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-golang-org-x-sys-0.26.0))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package term provides a platform-independent interfaces for interacting with
Terminal and TTY devices.")
    (license license:expat)))

(define-public go-github-com-mattn-go-runewidth-0.0.16
  (package
    (name "go-github-com-mattn-go-runewidth")
    (version "0.0.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mattn/go-runewidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0d7wbfz1kd3m0a4sx0ijrnbn4kw3bhn6myvnk76s19h8zjvafbrl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mattn/go-runewidth"))
    (propagated-inputs (list go-github-com-rivo-uniseg-0.2.0))
    (home-page "https://github.com/mattn/go-runewidth")
    (synopsis "go-runewidth")
    (description
     "This package provides functions to get fixed width of the character or string.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-cellbuf-0.0.13
  (package
    (name "go-github-com-charmbracelet-x-cellbuf")
    (version "0.0.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "cellbuf"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hx2dcxr40vs73xmhx0yhhafhjhns064zl9i5wskdyp47nl3z81w"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/cellbuf"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list
                        go-github-com-charmbracelet-colorprofile-0.2.3-0.20250311203215-f60798e515dc
                        go-github-com-charmbracelet-x-ansi-0.8.0
                        go-github-com-charmbracelet-x-term-0.2.1
                        go-github-com-mattn-go-runewidth-0.0.16
                        go-github-com-rivo-uniseg-0.4.7))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package cellbuf provides terminal cell buffer functionality.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-lipgloss-1.1.1-0.20250404203927-76690c660834
  (package
    (name "go-github-com-charmbracelet-lipgloss")
    (version "1.1.1-0.20250404203927-76690c660834")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/lipgloss")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jldm4r64mfay3d82d9k4cw6b50phrck6s94x9a0x779z88bjx6r"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/lipgloss"))
    (propagated-inputs (list go-github-com-aymanbagabas-go-udiff-0.2.0
                        go-github-com-charmbracelet-x-ansi-0.8.0
                        go-github-com-charmbracelet-x-cellbuf-0.0.13
                        go-github-com-charmbracelet-x-exp-golden-0.0.0-20240806155701-69247e0abc2a
                        go-github-com-muesli-termenv-0.16.0
                        go-github-com-rivo-uniseg-0.4.7))
    (home-page "https://github.com/charmbracelet/lipgloss")
    (synopsis "Lip Gloss")
    (description
     "Style definitions for nice terminal layouts.  Built with TUIs in mind.")
    (license license:expat)))

(define-public go-github-com-bits-and-blooms-bitset-1.24.0
  (package
    (name "go-github-com-bits-and-blooms-bitset")
    (version "1.24.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bits-and-blooms/bitset")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1sdmxk47iq6racm18dix326d9p4hrndisdxfbrmgw7gg34g52w1b"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/bits-and-blooms/bitset"))
    (home-page "https://github.com/bits-and-blooms/bitset")
    (synopsis "bitset")
    (description
     "Package bitset implements bitsets, a mapping between non-negative integers and
boolean values.  It should be more efficient than map[uint] bool.")
    (license license:bsd-3)))

(define-public go-github-com-rivo-uniseg-0.2.0
  (package
    (name "go-github-com-rivo-uniseg")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rivo/uniseg")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0j7h22vfmjj562vr8gpsyrkrwp1pq9ayh5fylv24skxb467g9f0q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/rivo/uniseg"))
    (home-page "https://github.com/rivo/uniseg")
    (synopsis "Unicode Text Segmentation for Go")
    (description
     "Package uniseg implements Unicode Text Segmentation, Unicode Line Breaking, and
string width calculation for monospace fonts.  Unicode Text Segmentation
conforms to Unicode Standard Annex #29
(@@url{https://unicode.org/reports/tr29/,https://unicode.org/reports/tr29/}) and
Unicode Line Breaking conforms to Unicode Standard Annex #14
(@@url{https://unicode.org/reports/tr14/,https://unicode.org/reports/tr14/}).")
    (license license:expat)))

(define-public go-github-com-mattn-go-runewidth-0.0.17
  (package
    (name "go-github-com-mattn-go-runewidth")
    (version "0.0.17")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mattn/go-runewidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "185mrzq3sa3liddpnq2pi4b3crxspwcmkbnjb122i1wrwlbzgrjx"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mattn/go-runewidth"))
    (propagated-inputs (list go-github-com-rivo-uniseg-0.2.0))
    (home-page "https://github.com/mattn/go-runewidth")
    (synopsis "go-runewidth")
    (description
     "This package provides functions to get fixed width of the character or string.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-ansi-0.10.2
  (package
    (name "go-github-com-charmbracelet-x-ansi")
    (version "0.10.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "ansi"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dp8ifp78lzh0pg86fnjmix1yvwzbifa7rz8x6hhgz0asdjm2j9j"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/ansi"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-bits-and-blooms-bitset-1.24.0
                             go-github-com-lucasb-eyer-go-colorful-1.3.0
                             go-github-com-mattn-go-runewidth-0.0.17
                             go-github-com-rivo-uniseg-0.4.7))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package ansi defines common ANSI escape sequences based on the ECMA-48 specs.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-exp-golden-0.0.0-20240806155701-69247e0abc2a
  (package
    (name "go-github-com-charmbracelet-x-exp-golden")
    (version "0.0.0-20240806155701-69247e0abc2a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "exp/golden"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0g8s2vp0zvd0c9diafgl4iw78y1xzxjaiylwnsar04gwzx4jqlx2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/exp/golden"
      #:unpack-path "github.com/charmbracelet/x"))
    (propagated-inputs (list go-github-com-aymanbagabas-go-udiff-0.2.0))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package golden provides a helper function to assert the output of tests.")
    (license license:expat)))

(define-public go-github-com-charmbracelet-x-exp-slice-0.0.0-20250327172914-2fdc97757edf
  (package
    (name "go-github-com-charmbracelet-x-exp-slice")
    (version "0.0.0-20250327172914-2fdc97757edf")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/x")
             (commit (go-version->git-ref version
                                          #:subdir "exp/slice"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0aj5gx0d5dffm1mfyd81h72kfn5mdmri4s6k0vyarrl013xb6rdj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/x/exp/slice"
      #:unpack-path "github.com/charmbracelet/x"))
    (home-page "https://github.com/charmbracelet/x")
    (synopsis #f)
    (description
     "Package slice provides utility functions for working with slices in Go.")
    (license license:expat)))

(define-public go-github-com-aymerick-douceur-0.2.0
  (package
    (name "go-github-com-aymerick-douceur")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aymerick/douceur")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hfysznib0fqbp8vqxpk0xiggpp0ayk2bsddi36vbg6f8zq5f81n"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/aymerick/douceur"))
    (home-page "https://github.com/aymerick/douceur")
    (synopsis "douceur")
    (description
     "This package provides a simple CSS parser and inliner in Golang.")
    (license license:expat)))

(define-public go-golang-org-x-crypto-0.24.0
  (package
    (name "go-golang-org-x-crypto")
    (version "0.24.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/crypto")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "065429cblmdqh9knxhbj7l6xwav5r693i9dg77ym67zy4kfgi6v8"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/crypto"))
    (propagated-inputs (list go-golang-org-x-net-0.21.0
                             go-golang-org-x-sys-0.21.0
                             go-golang-org-x-term-0.21.0))
    (home-page "https://golang.org/x/crypto")
    (synopsis "Go Cryptography")
    (description
     "This repository holds supplementary Go cryptography packages.")
    (license license:bsd-3)))

(define-public go-golang-org-x-sys-0.21.0
  (package
    (name "go-golang-org-x-sys")
    (version "0.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/sys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "000fcyi863sbmamdn3cwfv3s3z9ls5l34xnjavcbgjs591ghki8y"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/sys"))
    (home-page "https://golang.org/x/sys")
    (synopsis "sys")
    (description
     "This repository holds supplemental Go packages for low-level interactions with
the operating system.")
    (license license:bsd-3)))

(define-public go-golang-org-x-term-0.21.0
  (package
    (name "go-golang-org-x-term")
    (version "0.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/term")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dnvwqj8adjinaha80ahmsapglq67x4ixn70j34y9mscy2wbn6fd"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/term"))
    (propagated-inputs (list go-golang-org-x-sys-0.21.0))
    (home-page "https://golang.org/x/term")
    (synopsis "Go terminal/console support")
    (description
     "Package term provides support functions for dealing with terminals, as commonly
found on UNIX systems.")
    (license license:bsd-3)))

(define-public go-golang-org-x-net-0.26.0
  (package
    (name "go-golang-org-x-net")
    (version "0.26.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://go.googlesource.com/net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1m79qyjbg53pybf0f1fnmdbc0sjwfvmdy1rri04bfd8i07fkgxjr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "golang.org/x/net"))
    (propagated-inputs (list go-golang-org-x-crypto-0.24.0
                             go-golang-org-x-sys-0.21.0
                             go-golang-org-x-term-0.21.0
                             go-golang-org-x-text-0.16.0))
    (home-page "https://golang.org/x/net")
    (synopsis "Go Networking")
    (description "This repository holds supplementary Go networking packages.")
    (license license:bsd-3)))

(define-public go-github-com-microcosm-cc-bluemonday-1.0.27
  (package
    (name "go-github-com-microcosm-cc-bluemonday")
    (version "1.0.27")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/microcosm-cc/bluemonday")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jzh55x7zff2i3j28mk1gr5xsmyvfb3dkkdy10vhygabs5mv550i"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/microcosm-cc/bluemonday"))
    (propagated-inputs (list go-github-com-aymerick-douceur-0.2.0
                             go-golang-org-x-net-0.26.0))
    (home-page "https://github.com/microcosm-cc/bluemonday")
    (synopsis "bluemonday")
    (description
     "Package bluemonday provides a way of describing an allowlist of HTML elements
and attributes as a policy, and for that policy to be applied to untrusted
strings from users that may contain markup.  All elements and attributes not on
the allowlist will be stripped.")
    (license license:bsd-3)))

(define-public go-github-com-rivo-uniseg-0.1.0
  (package
    (name "go-github-com-rivo-uniseg")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rivo/uniseg")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0flpc1px1l6b1lxzhdxi0mvpkkjchppvgxshxxnlmm40s76i9ww5"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/rivo/uniseg"))
    (home-page "https://github.com/rivo/uniseg")
    (synopsis "Unicode Text Segmentation for Go")
    (description
     "Package uniseg implements Unicode Text Segmentation, Unicode Line Breaking, and
string width calculation for monospace fonts.  Unicode Text Segmentation
conforms to Unicode Standard Annex #29
(@@url{https://unicode.org/reports/tr29/,https://unicode.org/reports/tr29/}) and
Unicode Line Breaking conforms to Unicode Standard Annex #14
(@@url{https://unicode.org/reports/tr14/,https://unicode.org/reports/tr14/}).")
    (license license:expat)))

(define-public go-github-com-mattn-go-runewidth-0.0.12
  (package
    (name "go-github-com-mattn-go-runewidth")
    (version "0.0.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mattn/go-runewidth")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10m8k25anr79mirr9azap3c3a7wxn67qk774xd8hhqa1ffbicxib"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mattn/go-runewidth"))
    (propagated-inputs (list go-github-com-rivo-uniseg-0.1.0))
    (home-page "https://github.com/mattn/go-runewidth")
    (synopsis "go-runewidth")
    (description
     "This package provides functions to get fixed width of the character or string.")
    (license license:expat)))

(define-public go-github-com-muesli-reflow-0.3.0
  (package
    (name "go-github-com-muesli-reflow")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/reflow")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09zcz2cqdwgj1ilya5pqwndryk6lansn87x63fcm8j1xn74vd2ry"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/muesli/reflow"))
    (propagated-inputs (list go-github-com-mattn-go-runewidth-0.0.12))
    (home-page "https://github.com/muesli/reflow")
    (synopsis "reflow")
    (description
     "This package provides a collection of ANSI-aware methods and @@code{io.Writers}
helping you to transform blocks of text.  This means you can still style your
terminal output with ANSI escape sequences without them affecting the reflow
operations & algorithms.")
    (license license:expat)))

(define-public go-github-com-aymanbagabas-go-osc52-2.0.1
  (package
    (name "go-github-com-aymanbagabas-go-osc52")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aymanbagabas/go-osc52")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1y4y49zys7fi5wpicpdmjqnk0mb6569zg546km02yck2349jl538"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/aymanbagabas/go-osc52/v2"
      #:unpack-path "github.com/aymanbagabas/go-osc52"))
    (home-page "https://github.com/aymanbagabas/go-osc52")
    (synopsis "go-osc52")
    (description
     "OSC52 is a terminal escape sequence that allows copying text to the clipboard.")
    (license license:expat)))

(define-public go-github-com-lucasb-eyer-go-colorful-1.2.0
  (package
    (name "go-github-com-lucasb-eyer-go-colorful")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lucasb-eyer/go-colorful")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08c3fkf27r16izjjd4w94xd1z7w1r4mdalbl53ms2ka2j465s3qs"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/lucasb-eyer/go-colorful"))
    (home-page "https://github.com/lucasb-eyer/go-colorful")
    (synopsis "go-colorful")
    (description
     "The colorful package provides all kinds of functions for working with colors.")
    (license license:expat)))

(define-public go-github-com-mattn-go-isatty-0.0.20
  (package
    (name "go-github-com-mattn-go-isatty")
    (version "0.0.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mattn/go-isatty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0g63n9wpb991qnq9mn2kvd8jk1glrp6gnd851kvwz2wmzdkggiga"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mattn/go-isatty"))
    (propagated-inputs (list go-golang-org-x-sys-0.6.0))
    (home-page "https://github.com/mattn/go-isatty")
    (synopsis "go-isatty")
    (description "Package isatty implements interface to isatty.")
    (license license:expat)))

(define-public go-github-com-muesli-termenv-0.16.0
  (package
    (name "go-github-com-muesli-termenv")
    (version "0.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/termenv")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a480qidxxf590na6jlrg9lswdl6sbzi0i4j4bpkn3x89gmkvzah"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/muesli/termenv"))
    (propagated-inputs (list go-github-com-aymanbagabas-go-osc52-v2
                             go-github-com-lucasb-eyer-go-colorful-1.2.0
                             go-github-com-mattn-go-isatty-0.0.20
                             go-github-com-rivo-uniseg-0.4.7
                             go-golang-org-x-sys-0.30.0))
    (home-page "https://github.com/muesli/termenv")
    (synopsis "Features")
    (description
     "@@code{termenv} lets you safely use advanced styling options on the terminal.
It gathers information about the terminal environment in terms of its ANSI &
color support and offers you convenient methods to colorize and style your
output, without you having to deal with all kinds of weird ANSI escape sequences
and color conversions.")
    (license license:expat)))

(define-public go-github-com-yuin-goldmark-1.7.13
  (package
    (name "go-github-com-yuin-goldmark")
    (version "1.7.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yuin/goldmark")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "183v5bzgwr7ibbj6srnaaq7n98xqifaswa0c01yf693p5l6q3q6m"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/yuin/goldmark"))
    (home-page "https://github.com/yuin/goldmark")
    (synopsis "goldmark")
    (description
     "Package goldmark implements functions to convert markdown text to a desired
format.")
    (license license:expat)))

(define-public go-github-com-yuin-goldmark-1.7.10
  (package
    (name "go-github-com-yuin-goldmark")
    (version "1.7.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yuin/goldmark")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l4si9fn1yfdnl43gilxy5dkjzgkkvck3ajdmhd42pxkwmd3ljks"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/yuin/goldmark"))
    (home-page "https://github.com/yuin/goldmark")
    (synopsis "goldmark")
    (description
     "Package goldmark implements functions to convert markdown text to a desired
format.")
    (license license:expat)))

(define-public go-github-com-yuin-goldmark-emoji-1.0.6
  (package
    (name "go-github-com-yuin-goldmark-emoji")
    (version "1.0.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yuin/goldmark-emoji")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09n5ws797ma47kj0jwg0g2gkwq899kb40ny62r9f44wg6dkrpppr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/yuin/goldmark-emoji"))
    (propagated-inputs (list go-github-com-yuin-goldmark-1.7.10))
    (home-page "https://github.com/yuin/goldmark-emoji")
    (synopsis "goldmark-emoji")
    (description
     "package emoji is a extension for the
goldmark(@@url{http://github.com/yuin/goldmark,http://github.com/yuin/goldmark}).")
    (license license:expat)))

(define-public go-github-com-charmbracelet-glamour-1.0.0
  (package
    (name "go-github-com-charmbracelet-glamour")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/charmbracelet/glamour")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l5k360q84j5ly7jqws3zlrwdjrk0wk0ymjj8i9jadghdv5r5v8h"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/charmbracelet/glamour"))
    (propagated-inputs (list go-github-com-alecthomas-chroma-v2
                        go-github-com-charmbracelet-lipgloss-1.1.1-0.20250404203927-76690c660834
                        go-github-com-charmbracelet-x-ansi-0.10.2
                        go-github-com-charmbracelet-x-exp-golden-0.0.0-20240806155701-69247e0abc2a
                        go-github-com-charmbracelet-x-exp-slice-0.0.0-20250327172914-2fdc97757edf
                        go-github-com-microcosm-cc-bluemonday-1.0.27
                        go-github-com-muesli-reflow-0.3.0
                        go-github-com-muesli-termenv-0.16.0
                        go-github-com-yuin-goldmark-1.7.13
                        go-github-com-yuin-goldmark-emoji-1.0.6
                        go-golang-org-x-term-0.36.0
                        go-golang-org-x-text-0.30.0))
    (home-page "https://github.com/charmbracelet/glamour")
    (synopsis "Glamour")
    (description
     "Package glamour lets you render markdown documents & templates on ANSI
compatible terminals.  You can create your own stylesheet or simply use one of
the stylish defaults.")
    (license license:expat)))

(define-public go-github-com-russross-blackfriday-2.1.0
  (package
    (name "go-github-com-russross-blackfriday")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/russross/blackfriday")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0d1rg1drrfmabilqjjayklsz5d0n3hkf979sr3wsrw92bfbkivs7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/russross/blackfriday/v2"
      #:unpack-path "github.com/russross/blackfriday"))
    (home-page "https://github.com/russross/blackfriday")
    (synopsis "Blackfriday")
    (description "Package blackfriday is a markdown processor.")
    (license license:bsd-2)))

(define-public go-github-com-cpuguy83-go-md2man-2.0.1
  (package
    (name "go-github-com-cpuguy83-go-md2man")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cpuguy83/go-md2man")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "051ljpzf1f5nh631lvn53ziclkzmx5lza8545mkk6wxdfnfdcx8f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/cpuguy83/go-md2man/v2"
      #:unpack-path "github.com/cpuguy83/go-md2man"))
    (propagated-inputs (list go-github-com-russross-blackfriday-v2))
    (home-page "https://github.com/cpuguy83/go-md2man")
    (synopsis "go-md2man")
    (description "Converts markdown into roff (man pages).")
    (license license:expat)))

(define-public go-github-com-inconshreveable-mousetrap-1.0.0
  (package
    (name "go-github-com-inconshreveable-mousetrap")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/inconshreveable/mousetrap")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mn0kg48xkd74brf48qf5hzp0bc6g8cf5a77w895rl3qnlpfw152"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/inconshreveable/mousetrap"))
    (home-page "https://github.com/inconshreveable/mousetrap")
    (synopsis "mousetrap")
    (description "mousetrap is a tiny library that answers a single question.")
    (license license:asl2.0)))

(define-public go-github-com-spf13-pflag-1.0.5
  (package
    (name "go-github-com-spf13-pflag")
    (version "1.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spf13/pflag")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gpmacngd0gpslnbkzi263f5ishigzgh6pbdv9hp092rnjl4nd31"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/spf13/pflag"))
    (home-page "https://github.com/spf13/pflag")
    (synopsis "Description")
    (description
     "Package pflag is a drop-in replacement for Go's flag package, implementing
POSIX/GNU-style --flags.")
    (license license:bsd-3)))

(define-public go-github-com-muesli-coral-1.0.0
  (package
    (name "go-github-com-muesli-coral")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/coral")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "116rhk0slb635divb4k4b2i1a9yk315vp2vj6wh8j88vxvn7xxpr"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/muesli/coral"))
    (propagated-inputs (list go-github-com-cpuguy83-go-md2man-v2
                             go-github-com-inconshreveable-mousetrap-1.0.0
                             go-github-com-spf13-pflag-1.0.5
                             go-gopkg-in-yaml-v2))
    (home-page "https://github.com/muesli/coral")
    (synopsis "Coral Preamble")
    (description
     "Package coral is a commander providing a simple interface to create powerful
modern CLI interfaces.  In addition to providing an interface, Cobra
simultaneously provides a controller to organize your application code.")
    (license license:asl2.0)))
