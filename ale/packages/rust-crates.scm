;;; rust-crates.scm --- fuentes de crates.io generadas por `guix import crate`
;;;
;;; Generado en vivo (2026-08-01) con:
;;;   guix import crate --lockfile=Cargo.lock librepods
;;; dentro de una VM Guix 1.5.0 real, contra el Cargo.lock real de
;;; kavishdevar/librepods (commit 672e65ad36ee..., rama linux/rust,
;;; ver pkgs/librepods.scm). 576 crates -- todo hash es real, verificado
;;; contra crates.io por el importador, ninguno fabricado a mano.
;;;
;;; NO editar a mano salvo para resolver un TODO puntual que deje el
;;; importador (crates con sospecha de código vendorizado) -- para
;;; regenerar tras un cambio de Cargo.lock, volver a correr el comando
;;; de arriba y reemplazar este archivo entero.

(define-module (ale packages rust-crates)
  #:use-module (guix build-system cargo)
  #:export (lookup-cargo-inputs))

(define rust-ab-glyph-0.2.32
  (crate-source "ab_glyph" "0.2.32"
                "1hkc7y8yjd261d5cm9771dawnwc26rgdlniv3jysb3n3f9s4bh01"))

(define rust-ab-glyph-rasterizer-0.1.10
  (crate-source "ab_glyph_rasterizer" "0.1.10"
                "065n6bj7kqk6f12336lm87fqmvf4lxg7rkg2j56nix228jmgnvrn"))

(define rust-adler2-2.0.1
  (crate-source "adler2" "2.0.1"
                "1ymy18s9hs7ya1pjc9864l30wk8p2qfqdi7mhhcc5nfakxbij09j"))

(define rust-aes-0.9.0-rc.4
  (crate-source "aes" "0.9.0-rc.4"
                "18yj3z9v1g29m6lkncwshgl6rq4spkxabx71qa0x36kxlh47w284"))

(define rust-ahash-0.8.12
  (crate-source "ahash" "0.8.12"
                "0xbsp9rlm5ki017c0w6ay8kjwinwm8knjncci95mii30rmwz25as"))

(define rust-aho-corasick-1.1.4
  (crate-source "aho-corasick" "1.1.4"
                "00a32wb2h07im3skkikc495jvncf62jl6s96vwc7bhi70h9imlyx"))

(define rust-aligned-0.4.3
  (crate-source "aligned" "0.4.3"
                "1186lhb3gb4x6spzw7ff0zcraa8cr9zqk4ldpm5g1vb2ijc0higf"))

(define rust-aligned-vec-0.6.4
  (crate-source "aligned-vec" "0.6.4"
                "16vnf78hvfix5cwzd5xs5a2g6afmgb4h7n6yfsc36bv0r22072fw"))

(define rust-android-activity-0.6.1
  (crate-source "android-activity" "0.6.1"
                "1k8v4mw8kijvmjmqwr05cjvk2arklx2968bjjpa5szc5aaq1nahg"))

(define rust-android-build-0.1.3
  (crate-source "android-build" "0.1.3"
                "1zdqn0h2kya3f05g55vg8x53ixh7khrmd5r3rw44cl2x2xj4rb4c"))

(define rust-android-properties-0.2.2
  (crate-source "android-properties" "0.2.2"
                "016slvg269c0y120p9qd8vdfqa2jbw4j0g18gfw6p3ain44v4zpw"))

(define rust-android-system-properties-0.1.5
  (crate-source "android_system_properties" "0.1.5"
                "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1"))

(define rust-anstream-1.0.0
  (crate-source "anstream" "1.0.0"
                "13d2bj0xfg012s4rmq44zc8zgy1q8k9yp7yhvfnarscnmwpj2jl2"))

(define rust-anstyle-1.0.14
  (crate-source "anstyle" "1.0.14"
                "0030szmgj51fxkic1hpakxxgappxzwm6m154a3gfml83lq63l2wl"))

(define rust-anstyle-parse-1.0.0
  (crate-source "anstyle-parse" "1.0.0"
                "03hkv2690s0crssbnmfkr76kw1k7ah2i6s5amdy9yca2n8w7zkjj"))

(define rust-anstyle-query-1.1.5
  (crate-source "anstyle-query" "1.1.5"
                "1p6shfpnbghs6jsa0vnqd8bb8gd7pjd0jr7w0j8jikakzmr8zi20"))

(define rust-anstyle-wincon-3.0.11
  (crate-source "anstyle-wincon" "3.0.11"
                "0zblannm70sk3xny337mz7c6d8q8i24vhbqi42ld8v7q1wjnl7i9"))

(define rust-anyhow-1.0.102
  (crate-source "anyhow" "1.0.102"
                "0b447dra1v12z474c6z4jmicdmc5yxz5bakympdnij44ckw2s83z"))

(define rust-approx-0.5.1
  (crate-source "approx" "0.5.1"
                "1ilpv3dgd58rasslss0labarq7jawxmivk17wsh8wmkdm3q15cfa"))

(define rust-arbitrary-1.4.2
  (crate-source "arbitrary" "1.4.2"
                "1wcbi4x7i3lzcrkjda4810nqv03lpmvfhb0a85xrq1mbqjikdl63"))

(define rust-arg-enum-proc-macro-0.3.4
  (crate-source "arg_enum_proc_macro" "0.3.4"
                "1sjdfd5a8j6r99cf0bpqrd6b160x9vz97y5rysycsjda358jms8a"))

(define rust-arrayref-0.3.9
  (crate-source "arrayref" "0.3.9"
                "1jzyp0nvp10dmahaq9a2rnxqdd5wxgbvp8xaibps3zai8c9fi8kn"))

(define rust-arrayvec-0.7.6
  (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-as-raw-xcb-connection-1.0.1
  (crate-source "as-raw-xcb-connection" "1.0.1"
                "0sqgpz2ymv5yx76r5j2npjq2x5qvvqnw0vrs35cyv30p3pfp2m8p"))

(define rust-as-slice-0.2.1
  (crate-source "as-slice" "0.2.1"
                "05j52y1ws8kir5zjxnl48ann0if79sb56p9nm76hvma01r7nnssi"))

(define rust-ash-0.38.0+1.3.281
  (crate-source "ash" "0.38.0+1.3.281"
                "0vx4yf689v1rc680jvy8bnysx5sgd8f33wnp2vqaizh0v0v4kd0b"))

(define rust-async-broadcast-0.7.2
  (crate-source "async-broadcast" "0.7.2"
                "0ckmqcwyqwbl2cijk1y4r0vy60i89gqc86ijrxzz5f2m4yjqfnj3"))

(define rust-async-channel-2.5.0
  (crate-source "async-channel" "2.5.0"
                "1ljq24ig8lgs2555myrrjighycpx2mbjgrm3q7lpa6rdsmnxjklj"))

(define rust-async-executor-1.14.0
  (crate-source "async-executor" "1.14.0"
                "0al1rmxjy7p7r6h50z698q5lwssqs5a2vzmqbazm1z2sv1rgjsy9"))

(define rust-async-io-2.6.0
  (crate-source "async-io" "2.6.0"
                "1z16s18bm4jxlmp6rif38mvn55442yd3wjvdfhvx4hkgxf7qlss5"))

(define rust-async-lock-3.4.2
  (crate-source "async-lock" "3.4.2"
                "04c3xrrdrfrvh9v0ajxrangpy38qi76qq268zslphnxxjqjpy3r9"))

(define rust-async-process-2.5.0
  (crate-source "async-process" "2.5.0"
                "0xfswxmng6835hjlfhv7k0jrfp7czqxpfj6y2s5dsp05q0g94l7w"))

(define rust-async-recursion-1.1.1
  (crate-source "async-recursion" "1.1.1"
                "04ac4zh8qz2xjc79lmfi4jlqj5f92xjvfaqvbzwkizyqd4pl4hrv"))

(define rust-async-signal-0.2.13
  (crate-source "async-signal" "0.2.13"
                "0k66mpb3xp86hj4vxs7w40v7qz2jfbblrm9ddc5mglwwynxp1h23"))

(define rust-async-task-4.7.1
  (crate-source "async-task" "4.7.1"
                "1pp3avr4ri2nbh7s6y9ws0397nkx1zymmcr14sq761ljarh3axcb"))

(define rust-async-trait-0.1.89
  (crate-source "async-trait" "0.1.89"
                "1fsxxmz3rzx1prn1h3rs7kyjhkap60i7xvi0ldapkvbb14nssdch"))

(define rust-atomic-waker-1.1.2
  (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-autocfg-1.5.0
  (crate-source "autocfg" "1.5.0"
                "1s77f98id9l4af4alklmzq46f21c980v13z2r1pcxx6bqgw0d1n0"))

(define rust-av-scenechange-0.14.1
  (crate-source "av-scenechange" "0.14.1"
                "1543y7riwcy4mmsgcalxcm3bnb41hvwiqiz774nbj68fq9vischg"))

(define rust-av1-grain-0.2.5
  (crate-source "av1-grain" "0.2.5"
                "1y3p43i5xncbny0pfh8kw09am3l3mgyg82ln65r3f434443xpzcc"))

(define rust-avif-serialize-0.8.8
  (crate-source "avif-serialize" "0.8.8"
                "0gd5hr9vd2rkf9gn60f39rham6lzn8a4cdy0p57ihrxx0zq84l1p"))

(define rust-bit-set-0.8.0
  (crate-source "bit-set" "0.8.0"
                "18riaa10s6n59n39vix0cr7l2dgwdhcpbcm97x1xbyfp1q47x008"))

(define rust-bit-vec-0.8.0
  (crate-source "bit-vec" "0.8.0"
                "1xxa1s2cj291r7k1whbxq840jxvmdsq9xgh7bvrxl46m80fllxjy"))

(define rust-bit-field-0.10.3
  (crate-source "bit_field" "0.10.3"
                "1ikhbph4ap4w692c33r8bbv6yd2qxm1q3f64845grp1s6b3l0jqy"))

(define rust-bitflags-1.3.2
  (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-bitflags-2.11.0
  (crate-source "bitflags" "2.11.0"
                "1bwjibwry5nfwsfm9kjg2dqx5n5nja9xymwbfl6svnn8jsz6ff44"))

(define rust-bitstream-io-4.9.0
  (crate-source "bitstream-io" "4.9.0"
                "0mqpwqy8cqnaqr4wkpk7qy7fjp4x6vxaf8z2hprbvimj3nfvvm30"))

(define rust-block-0.1.6
  (crate-source "block" "0.1.6"
                "16k9jgll25pzsq14f244q22cdv0zb4bqacldg3kx6h89d7piz30d"))

(define rust-block2-0.5.1
  (crate-source "block2" "0.5.1"
                "0pyiha5his2grzqr3mynmq244laql2j20992i59asp0gy7mjw4rc"))

(define rust-block2-0.6.2
  (crate-source "block2" "0.6.2"
                "1xcfllzx6c3jc554nmb5qy6xmlkl6l6j5ib4wd11800n0n3rvsyd"))

(define rust-blocking-1.6.2
  (crate-source "blocking" "1.6.2"
                "08bz3f9agqlp3102snkvsll6wc9ag7x5m1xy45ak2rv9pq18sgz8"))

(define rust-bluer-0.17.4
  (crate-source "bluer" "0.17.4"
                "00d9n6gx05kr8yr08nyzcpsmay41961sdvmhr2an86b0bhpi2s5g"))

(define rust-built-0.8.0
  (crate-source "built" "0.8.0"
                "0r5f08lpjsr6j5ajkbmd0ymfmajpq8ddbfvi8ji8rx48y88qzbgl"))

(define rust-bumpalo-3.20.2
  (crate-source "bumpalo" "3.20.2"
                "1jrgxlff76k9glam0akhwpil2fr1w32gbjdf5hpipc7ld2c7h82x"))

(define rust-bytemuck-1.25.0
  (crate-source "bytemuck" "1.25.0"
                "1v1z32igg9zq49phb3fra0ax5r2inf3aw473vldnm886sx5vdvy8"))

(define rust-bytemuck-derive-1.10.2
  (crate-source "bytemuck_derive" "1.10.2"
                "1zvmjmw1sdmx9znzm4dpbb2yvz9vyim8w6gp4z256l46qqdvvazr"))

(define rust-byteorder-lite-0.1.0
  (crate-source "byteorder-lite" "0.1.0"
                "15alafmz4b9az56z6x7glcbcb6a8bfgyd109qc3bvx07zx4fj7wg"))

(define rust-bytes-1.11.1
  (crate-source "bytes" "1.11.1"
                "0czwlhbq8z29wq0ia87yass2mzy1y0jcasjb8ghriiybnwrqfx0y"))

(define rust-calloop-0.13.0
  (crate-source "calloop" "0.13.0"
                "1v5zgidnhsyml403rzr7vm99f8q6r5bxq5gxyiqkr8lcapwa57dr"))

(define rust-calloop-0.14.4
  (crate-source "calloop" "0.14.4"
                "1xsd8xk53v9zbvhjy7ynf4gya9s4rvvh8jqx9psi1b2v6rw9kgsd"))

(define rust-calloop-wayland-source-0.3.0
  (crate-source "calloop-wayland-source" "0.3.0"
                "086x5mq16prrcwd9k6bw9an0sp8bj9l5daz4ziz5z4snf2c6m9lm"))

(define rust-calloop-wayland-source-0.4.1
  (crate-source "calloop-wayland-source" "0.4.1"
                "1yi1c23naqhd8m94q3v366s4cak8l50zy7ldrkqfn0hajkqgr3hk"))

(define rust-cc-1.2.58
  (crate-source "cc" "1.2.58"
                "1qb0zyqhn8pqzdp7d3scm19zmvgvbyh3iabmj1q7fc4ynva2isg1"))

(define rust-cesu8-1.1.0
  (crate-source "cesu8" "1.1.0"
                "0g6q58wa7khxrxcxgnqyi9s1z2cjywwwd3hzr5c55wskhx6s0hvd"))

(define rust-cfg-if-1.0.4
  (crate-source "cfg-if" "1.0.4"
                "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k"))

(define rust-cfg-aliases-0.2.1
  (crate-source "cfg_aliases" "0.2.1"
                "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))

(define rust-cipher-0.5.1
  (crate-source "cipher" "0.5.1"
                "1skqij7dx6glllvr3x59w5nzv07zaqh7j4zb7828k8hvzqkq4kg3"))

(define rust-clap-4.6.0
  (crate-source "clap" "4.6.0"
                "0l8k0ja5rf4hpn2g98bqv5m6lkh2q6b6likjpmm6fjw3cxdsz4xi"))

(define rust-clap-builder-4.6.0
  (crate-source "clap_builder" "4.6.0"
                "17q6np22yxhh5y5v53y4l31ps3hlaz45mvz2n2nicr7n3c056jki"))

(define rust-clap-derive-4.6.0
  (crate-source "clap_derive" "4.6.0"
                "0snapc468s7n3avr33dky4y7rmb7ha3qsp9l0k5vh6jacf5bs40i"))

(define rust-clap-lex-1.1.0
  (crate-source "clap_lex" "1.1.0"
                "1ycqkpygnlqnndghhcxjb44lzl0nmgsia64x9581030yifxs7m68"))

(define rust-clipboard-win-5.4.1
  (crate-source "clipboard-win" "5.4.1"
                "1m44gqy11rq1ww7jls86ppif98v6kv2wkwk8p17is86zsdq3gq5x"))

(define rust-clipboard-macos-0.1.1
  (crate-source "clipboard_macos" "0.1.1"
                "13zkbmnsl2c98452kvia7vr2ywwl123bj2q81diw78vv0jm4lzwv"))

(define rust-clipboard-wayland-0.2.2
  (crate-source "clipboard_wayland" "0.2.2"
                "1f1prf3qhww5qqbbqbf27ygq103z9r1b678cs4lpg672qimqhgq0"))

(define rust-clipboard-x11-0.4.3
  (crate-source "clipboard_x11" "0.4.3"
                "1m2szxgxk8s8j7anp73pdijdp50yvnjhakscj8wzvnpza8sf6qxx"))

(define rust-codespan-reporting-0.12.0
  (crate-source "codespan-reporting" "0.12.0"
                "108g41xqzhr8fx8hlpy5qzmqq8ylldbj37wndkaqm34yy1d2wvgy"))

(define rust-color-quant-1.1.0
  (crate-source "color_quant" "1.1.0"
                "12q1n427h2bbmmm1mnglr57jaz2dj9apk0plcxw7nwqiai7qjyrx"))

(define rust-colorchoice-1.0.5
  (crate-source "colorchoice" "1.0.5"
                "0w75k89hw39p0mnnhlrwr23q50rza1yjki44qvh2mgrnj065a1qx"))

(define rust-combine-4.6.7
  (crate-source "combine" "4.6.7"
                "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms"))

(define rust-concurrent-queue-2.5.0
  (crate-source "concurrent-queue" "2.5.0"
                "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c"))

(define rust-core-foundation-0.9.4
  (crate-source "core-foundation" "0.9.4"
                "13zvbbj07yk3b61b8fhwfzhy35535a583irf23vlcg59j7h9bqci"))

(define rust-core-foundation-0.10.1
  (crate-source "core-foundation" "0.10.1"
                "1xjns6dqf36rni2x9f47b65grxwdm20kwdg9lhmzdrrkwadcv9mj"))

(define rust-core-foundation-sys-0.8.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-core-graphics-0.23.2
  (crate-source "core-graphics" "0.23.2"
                "10dhv3gk4kmbzl14xxkrhhky4fdp8h6nzff6h0019qgr6nz84xy0"))

(define rust-core-graphics-types-0.1.3
  (crate-source "core-graphics-types" "0.1.3"
                "1bxg8nxc8fk4kxnqyanhf36wq0zrjr552c58qy6733zn2ihhwfa5"))

(define rust-core-graphics-types-0.2.0
  (crate-source "core-graphics-types" "0.2.0"
                "1sqka1rz84lr3p69i1s6lggnpnznmrw4ngc5q76w9xhky80s2i1x"))

(define rust-core2-0.4.0
  (crate-source "core2" "0.4.0"
                "01f5xv0kf3ds3xm7byg78hycbanb8zlpvsfv4j47y46n3bpsg6xl"))

(define rust-core-maths-0.1.1
  (crate-source "core_maths" "0.1.1"
                "0c0dv11ixxpc9bsx5xasvl98mb1dlprzcm6qq6ls3nsygw0mwx3p"))

(define rust-cosmic-text-0.15.0
  (crate-source "cosmic-text" "0.15.0"
                "0dvpwc4rb7gysrd7sir10k2hk2j2vis6xn35wg5s6mws78l54f0p"))

(define rust-cpubits-0.1.0
  (crate-source "cpubits" "0.1.0"
                "0qaqgwvjhks29a59sw06w9n8c90vbmidfbfz2jj6wa8d0x1wbw2y"))

(define rust-cpufeatures-0.2.17
  (crate-source "cpufeatures" "0.2.17"
                "10023dnnaghhdl70xcds12fsx2b966sxbxjq5sxs49mvxqw5ivar"))

(define rust-crc32fast-1.5.0
  (crate-source "crc32fast" "1.5.0"
                "04d51liy8rbssra92p0qnwjw8i9rm9c4m3bwy19wjamz1k4w30cl"))

(define rust-crossbeam-deque-0.8.6
  (crate-source "crossbeam-deque" "0.8.6"
                "0l9f1saqp1gn5qy0rxvkmz4m6n7fc0b3dbm6q1r5pmgpnyvi3lcx"))

(define rust-crossbeam-epoch-0.9.18
  (crate-source "crossbeam-epoch" "0.9.18"
                "03j2np8llwf376m3fxqx859mgp9f83hj1w34153c7a9c7i5ar0jv"))

(define rust-crossbeam-utils-0.8.21
  (crate-source "crossbeam-utils" "0.8.21"
                "0a3aa2bmc8q35fb67432w16wvi54sfmb69rk9h5bhd18vw0c99fh"))

(define rust-crunchy-0.2.4
  (crate-source "crunchy" "0.2.4"
                "1mbp5navim2qr3x48lyvadqblcxc1dm0lqr0swrkkwy2qblvw3s6"))

(define rust-cryoglyph-0.1.0
  (crate-source "cryoglyph" "0.1.0"
                "06f5dvmsirrkrrpnyv92gdcsd7801a9n7cbgfdhx9nycvddpkg08"))

(define rust-crypto-common-0.2.1
  (crate-source "crypto-common" "0.2.1"
                "041p8bs680hrg6rhicfifn19cfvybq9aya5i4i0k08d9byqpnwkp"))

(define rust-ctor-lite-0.1.2
  (crate-source "ctor-lite" "0.1.2"
                "007342zvk2i8d9xz7n9wjxmlx55ry3prfm8ynwvbg3h6wb1d0qp1"))

(define rust-cursor-icon-1.2.0
  (crate-source "cursor-icon" "1.2.0"
                "0bvkw7ak1mqwcpkgd9lh7n00hcvlh87jfl7188f231nz6zfy2ypj"))

(define rust-custom-debug-0.6.2
  (crate-source "custom_debug" "0.6.2"
                "13i9cldd9glg8k25z5ll5wb083rnl07pl7bzhwgf3cv7jnnx39rd"))

(define rust-custom-debug-derive-0.6.2
  (crate-source "custom_debug_derive" "0.6.2"
                "04cw7wqf42rjnah5b79vpwawh94m5rjjbrrb9xicgxjjhvdcw1x7"))

(define rust-darling-0.20.11
  (crate-source "darling" "0.20.11"
                "1vmlphlrlw4f50z16p4bc9p5qwdni1ba95qmxfrrmzs6dh8lczzw"))

(define rust-darling-core-0.20.11
  (crate-source "darling_core" "0.20.11"
                "0bj1af6xl4ablnqbgn827m43b8fiicgv180749f5cphqdmcvj00d"))

(define rust-darling-macro-0.20.11
  (crate-source "darling_macro" "0.20.11"
                "1bbfbc2px6sj1pqqq97bgqn6c8xdnb2fmz66f7f40nrqrcybjd7w"))

(define rust-dbus-0.9.10
  (crate-source "dbus" "0.9.10"
                "1m252djlnskgb89i2177yf9w6p4nx9475gamc8ryxaz7sxlamcr1"))

(define rust-dbus-crossroads-0.5.3
  (crate-source "dbus-crossroads" "0.5.3"
                "1s24yk48jkvkkvgplgjrrqvzy365pmz6nv17c1v6dfhz32yz1gv4"))

(define rust-dbus-tokio-0.7.6
  (crate-source "dbus-tokio" "0.7.6"
                "04xd3z2dnjv4d45kj3wqnwbnwllrp1zsg8v3q0qp2rxwb7a8hxh0"))

(define rust-dispatch-0.2.0
  (crate-source "dispatch" "0.2.0"
                "0fwjr9b7582ic5689zxj8lf7zl94iklhlns3yivrnv8c9fxr635x"))

(define rust-dispatch2-0.3.1
  (crate-source "dispatch2" "0.3.1"
                "0f5xmnbzpaz1g80m27kd804p75nswh0ikb6wvqh4ba3x9rz3c3hy"))

(define rust-displaydoc-0.2.5
  (crate-source "displaydoc" "0.2.5"
                "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))

(define rust-dlib-0.5.3
  (crate-source "dlib" "0.5.3"
                "0jpr4smrwrv8xj70mz4ixnbc6ljm82f12z2mz1hv89056y3wv3mb"))

(define rust-document-features-0.2.12
  (crate-source "document-features" "0.2.12"
                "0qcgpialq3zgvjmsvar9n6v10rfbv6mk6ajl46dd4pj5hn3aif6l"))

(define rust-downcast-rs-1.2.1
  (crate-source "downcast-rs" "1.2.1"
                "1lmrq383d1yszp7mg5i7i56b17x2lnn3kb91jwsq0zykvg2jbcvm"))

(define rust-dpi-0.1.2
  (crate-source "dpi" "0.1.2"
                "0xhsvzgjvdch2fwmfc9vkb708b0q59b6imypyjlgbiigyb74rcfq"))

(define rust-either-1.15.0
  (crate-source "either" "1.15.0"
                "069p1fknsmzn9llaizh77kip0pqmcwpdsykv2x30xpjyija5gis8"))

(define rust-endi-1.1.1
  (crate-source "endi" "1.1.1"
                "16a0076dx41vgrzzimm9clcym77h732czqjiajanmzvd1i1y5dv6"))

(define rust-enumflags2-0.7.12
  (crate-source "enumflags2" "0.7.12"
                "1vzcskg4dca2jiflsfx1p9yw1fvgzcakcs7cpip0agl51ilgf9qh"))

(define rust-enumflags2-derive-0.7.12
  (crate-source "enumflags2_derive" "0.7.12"
                "09rqffacafl1b83ir55hrah9gza0x7pzjn6lr6jm76fzix6qmiv7"))

(define rust-env-filter-1.0.1
  (crate-source "env_filter" "1.0.1"
                "1vvf9xhaxm0m78bp23b8j3cbv1vm5vffn3gaas27mc64rhm0rs9j"))

(define rust-env-logger-0.11.10
  (crate-source "env_logger" "0.11.10"
                "0smmk1hqzk7z91rg7fdq98d03gh9kidkd0ymim43zb4n457w0886"))

(define rust-equator-0.4.2
  (crate-source "equator" "0.4.2"
                "1z760z5r0haxjyakbqxvswrz9mq7c29arrivgq8y1zldhc9v44a7"))

(define rust-equator-macro-0.4.2
  (crate-source "equator-macro" "0.4.2"
                "1cqzx3cqn9rxln3a607xr54wippzff56zs5chqdf3z2bnks3rwj4"))

(define rust-equivalent-1.0.2
  (crate-source "equivalent" "1.0.2"
                "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7"))

(define rust-errno-0.3.14
  (crate-source "errno" "0.3.14"
                "1szgccmh8vgryqyadg8xd58mnwwicf39zmin3bsn63df2wbbgjir"))

(define rust-error-code-3.3.2
  (crate-source "error-code" "3.3.2"
                "0nacxm9xr3s1rwd6fabk3qm89fyglahmbi4m512y0hr8ym6dz8ny"))

(define rust-etagere-0.2.15
  (crate-source "etagere" "0.2.15"
                "0hjkik00nl8bm9fafpzqkb6yah3mkphc21zpc159a5fwwncvz2gw"))

(define rust-euclid-0.22.14
  (crate-source "euclid" "0.22.14"
                "01ksjl4vb8ms89laswnjpld3z4n6c1s7qlqq0djx3imiwdjm787i"))

(define rust-event-listener-5.4.1
  (crate-source "event-listener" "5.4.1"
                "1asnp3agbr8shcl001yd935m167ammyi8hnvl0q1ycajryn6cfz1"))

(define rust-event-listener-strategy-0.5.4
  (crate-source "event-listener-strategy" "0.5.4"
                "14rv18av8s7n8yixg38bxp5vg2qs394rl1w052by5npzmbgz7scb"))

(define rust-exr-1.74.0
  (crate-source "exr" "1.74.0"
                "1gk3cc2qkfm0jqw4v1d7g4c356k9iz583bq17iiwp8kalm1y0023"))

(define rust-fastrand-2.3.0
  (crate-source "fastrand" "2.3.0"
                "1ghiahsw1jd68df895cy5h3gzwk30hndidn3b682zmshpgmrx41p"))

(define rust-fax-0.2.6
  (crate-source "fax" "0.2.6"
                "1ax0jmvsszxd03hj6ga1kyl7gaqcfw0akg2wf0q6gk9pizaffpgh"))

(define rust-fax-derive-0.2.0
  (crate-source "fax_derive" "0.2.0"
                "0zap434zz4xvi5rnysmwzzivig593b4ng15vwzwl7js2nw7s3b50"))

(define rust-fdeflate-0.3.7
  (crate-source "fdeflate" "0.3.7"
                "130ga18vyxbb5idbgi07njymdaavvk6j08yh1dfarm294ssm6s0y"))

(define rust-find-msvc-tools-0.1.9
  (crate-source "find-msvc-tools" "0.1.9"
                "10nmi0qdskq6l7zwxw5g56xny7hb624iki1c39d907qmfh3vrbjv"))

(define rust-flate2-1.1.9
  (crate-source "flate2" "1.1.9"
                "0g2pb7cxnzcbzrj8bw4v6gpqqp21aycmf6d84rzb6j748qkvlgw4"))

(define rust-fnv-1.0.7
  (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foldhash-0.1.5
  (crate-source "foldhash" "0.1.5"
                "1wisr1xlc2bj7hk4rgkcjkz3j2x4dhd1h9lwk7mj8p71qpdgbi6r"))

(define rust-foldhash-0.2.0
  (crate-source "foldhash" "0.2.0"
                "1nvgylb099s11xpfm1kn2wcsql080nqmnhj1l25bp3r2b35j9kkp"))

(define rust-font-types-0.10.1
  (crate-source "font-types" "0.10.1"
                "1idqs7pfv9134fzkfykjcg5x34gfjclpqqccln7d9jxv0ks599ir"))

(define rust-font-types-0.11.1
  (crate-source "font-types" "0.11.1"
                "1wixmb7a5ww9y7vry586p4pjbfxgwix9n5cribr8l6cibixrm0kk"))

(define rust-fontconfig-parser-0.5.8
  (crate-source "fontconfig-parser" "0.5.8"
                "0ijnbzg31sl6v49g7q2l7sl76hjj8z0hvlsz77cdvm029vi77ixv"))

(define rust-fontdb-0.23.0
  (crate-source "fontdb" "0.23.0"
                "0199vry9x8zn9ix4x4rqvv53dy2ryhy68l53jwr580hj7ndphzj5"))

(define rust-foreign-types-0.5.0
  (crate-source "foreign-types" "0.5.0"
                "0rfr2zfxnx9rz3292z5nyk8qs2iirznn5ff3rd4vgdwza6mdjdyp"))

(define rust-foreign-types-macros-0.2.3
  (crate-source "foreign-types-macros" "0.2.3"
                "0hjpii8ny6l7h7jpns2cp9589016l8mlrpaigcnayjn9bdc6qp0s"))

(define rust-foreign-types-shared-0.3.1
  (crate-source "foreign-types-shared" "0.3.1"
                "0nykdvv41a3d4py61bylmlwjhhvdm0b3bcj9vxhqgxaxnp5ik6ma"))

(define rust-futures-0.3.32
  (crate-source "futures" "0.3.32"
                "0b9q86r5ar18v5xjiyqn7sb8sa32xv98qqnfz779gl7ns7lpw54b"))

(define rust-futures-channel-0.3.32
  (crate-source "futures-channel" "0.3.32"
                "07fcyzrmbmh7fh4ainilf1s7gnwvnk07phdq77jkb9fpa2ffifq7"))

(define rust-futures-core-0.3.32
  (crate-source "futures-core" "0.3.32"
                "07bbvwjbm5g2i330nyr1kcvjapkmdqzl4r6mqv75ivvjaa0m0d3y"))

(define rust-futures-executor-0.3.32
  (crate-source "futures-executor" "0.3.32"
                "17aplz3ns74qn7a04qg7qlgsdx5iwwwkd4jvdfra6hl3h4w9rwms"))

(define rust-futures-io-0.3.32
  (crate-source "futures-io" "0.3.32"
                "063pf5m6vfmyxj74447x8kx9q8zj6m9daamj4hvf49yrg9fs7jyf"))

(define rust-futures-lite-2.6.1
  (crate-source "futures-lite" "2.6.1"
                "1ba4dg26sc168vf60b1a23dv1d8rcf3v3ykz2psb7q70kxh113pp"))

(define rust-futures-macro-0.3.32
  (crate-source "futures-macro" "0.3.32"
                "0ys4b1lk7s0bsj29pv42bxsaavalch35rprp64s964p40c1bfdg8"))

(define rust-futures-sink-0.3.32
  (crate-source "futures-sink" "0.3.32"
                "14q8ml7hn5a6gyy9ri236j28kh0svqmrk4gcg0wh26rkazhm95y3"))

(define rust-futures-task-0.3.32
  (crate-source "futures-task" "0.3.32"
                "14s3vqf8llz3kjza33vn4ixg6kwxp61xrysn716h0cwwsnri2xq3"))

(define rust-futures-util-0.3.32
  (crate-source "futures-util" "0.3.32"
                "1mn60lw5kh32hz9isinjlpw34zx708fk5q1x0m40n6g6jq9a971q"))

(define rust-gethostname-1.1.0
  (crate-source "gethostname" "1.1.0"
                "1n6bj9gh503ggjblfjcai96gmxynxsrykaynljlrfdra34q95m0v"))

(define rust-getrandom-0.3.4
  (crate-source "getrandom" "0.3.4"
                "1zbpvpicry9lrbjmkd4msgj3ihff1q92i334chk7pzf46xffz7c9"))

(define rust-getrandom-0.4.2
  (crate-source "getrandom" "0.4.2"
                "0mb5833hf9pvn9dhvxjgfg5dx0m77g8wavvjdpvpnkp9fil1xr8d"))

(define rust-gif-0.14.1
  (crate-source "gif" "0.14.1"
                "0pn3ldqjk0ng1vbc3r3zqqrnjkn6s3f3ndk96lhhrn0q82l2ppzm"))

(define rust-gl-generator-0.14.0
  (crate-source "gl_generator" "0.14.0"
                "0k8j1hmfnff312gy7x1aqjzcm8zxid7ij7dlb8prljib7b1dz58s"))

(define rust-glam-0.14.0
  (crate-source "glam" "0.14.0"
                "1njk0cskaspc62ywxlzpiszbcb9hhh1yqg2ka105sg0hxgajhf9k"))

(define rust-glam-0.15.2
  (crate-source "glam" "0.15.2"
                "0jx587lxz9v9m0ph4dlshfgy0abax1zhlbjj5nvkchz4ir7mbfrs"))

(define rust-glam-0.16.0
  (crate-source "glam" "0.16.0"
                "05izbgx93hnjk200144h9yxhy51cbygp2bbaqdj8czngki3w09j1"))

(define rust-glam-0.17.3
  (crate-source "glam" "0.17.3"
                "0xm7jdygbxchdvk6k1l1pdag843nkwdm8fikwgp0i1gxgawk45z0"))

(define rust-glam-0.18.0
  (crate-source "glam" "0.18.0"
                "0d7f7f7cdbahxk677k6l8h7r4bxxni24nzdndwr8wyx71d4kwnjj"))

(define rust-glam-0.19.0
  (crate-source "glam" "0.19.0"
                "1jjia0nva5p7ca3dma8jhzxd4dmczgbhn3b338ffh5hmg7k0k19b"))

(define rust-glam-0.20.5
  (crate-source "glam" "0.20.5"
                "0pv7n634vw2hn9fmi915pzgangyljgsp4m5505c3zq2bfiz9agpl"))

(define rust-glam-0.21.3
  (crate-source "glam" "0.21.3"
                "05c8r639hz3ydlhbhv6d9z6193iivi8276zz2fq3hqw6ci8am3si"))

(define rust-glam-0.22.0
  (crate-source "glam" "0.22.0"
                "0x57gyrxyfs409b3f5i64yy2pbcgkr2qkq8v3a0mmm8vdkargx8j"))

(define rust-glam-0.23.0
  (crate-source "glam" "0.23.0"
                "076mdgmy38lhlvgng74iy2sr3iih58gx5qcz20g0hmamv6dgsjlf"))

(define rust-glam-0.24.2
  (crate-source "glam" "0.24.2"
                "0ibrq68ldg1gyynb5ss5hx0gr6p3397cfclh1xrl5prba4bqqhdm"))

(define rust-glam-0.25.0
  (crate-source "glam" "0.25.0"
                "1cr80mz1qyc73fvp2d93d4g2svv675fmcrkrzi0bpyajpvcna5hm"))

(define rust-glam-0.27.0
  (crate-source "glam" "0.27.0"
                "1fawkrkbivdds5lzczk1rx37b7s3apl2cywch7s5ad1yfbkff1cy"))

(define rust-glam-0.28.0
  (crate-source "glam" "0.28.0"
                "152sjv2ffb84a28zb4yklkxn5f20idz4xdmkq28wy8c4gszy96kp"))

(define rust-glam-0.29.3
  (crate-source "glam" "0.29.3"
                "1vmkzrpsz3ay9c1cabs5ns149z3dyxkf8ywzmkg9578w9inz9awb"))

(define rust-glam-0.30.10
  (crate-source "glam" "0.30.10"
                "1a9as4c2sm3z9sczl2m6gn8fsfmg4iw8rrpinv8i58iphhz47z0r"))

(define rust-glam-0.31.1
  (crate-source "glam" "0.31.1"
                "1rsv5f5fb70bfm6ji37pv66g7gf9f4bb8yqf9skib38bm4p6nvsm"))

(define rust-glam-0.32.1
  (crate-source "glam" "0.32.1"
                "186cjxn5qknagm31vmxvxk1kwwrfvv6cqj99nvvcngh6bdllj1zp"))

(define rust-glow-0.16.0
  (crate-source "glow" "0.16.0"
                "022z12nlyfpy36fvp2szq792xix1xbgkznpmicf1c404sxhfmrf5"))

(define rust-glutin-wgl-sys-0.6.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "glutin_wgl_sys" "0.6.1"
                "0gng2810jb5x133lmy17qifjx6s90lnprm86afg7mfls505y0kic"))

(define rust-gpu-alloc-0.6.0
  (crate-source "gpu-alloc" "0.6.0"
                "0wd1wq7qs8ja0cp37ajm9p1r526sp6w0kvjp3xx24jsrjfx2vkgv"))

(define rust-gpu-alloc-types-0.3.0
  (crate-source "gpu-alloc-types" "0.3.0"
                "190wxsp9q8c59xybkfrlzqqyrxj6z39zamadk1q7v0xad2s07zwq"))

(define rust-gpu-allocator-0.27.0
  (crate-source "gpu-allocator" "0.27.0"
                "1kfa6kvvslmrr63p4n5fsm8myp03xi5lzylywys9f0l0xyjs4lf1"))

(define rust-gpu-descriptor-0.3.2
  (crate-source "gpu-descriptor" "0.3.2"
                "1jm0acxkw9lrzzcbvjqynwdr53qsqz7vx5d8c8h77qq5j4s8775q"))

(define rust-gpu-descriptor-types-0.2.0
  (crate-source "gpu-descriptor-types" "0.2.0"
                "14ab90klss7w0ybj95fcnqxjsjya17xjhf576dpvi4zq5ml45wpx"))

(define rust-guillotiere-0.6.2
  (crate-source "guillotiere" "0.6.2"
                "10m7fhp5kzf09kz08k6apkbzblriyqynjl1wwa9i7jrnq1jmhbdn"))

(define rust-half-2.7.1
  (crate-source "half" "2.7.1"
                "0jyq42xfa6sghc397mx84av7fayd4xfxr4jahsqv90lmjr5xi8kf"))

(define rust-harfrust-0.3.2
  (crate-source "harfrust" "0.3.2"
                "1n5r45i2f8w71ia9vql7c8da1qxd7j3hfxpylc98l7f72bdj1h4j"))

(define rust-hashbrown-0.15.5
  (crate-source "hashbrown" "0.15.5"
                "189qaczmjxnikm9db748xyhiw04kpmhm9xj9k9hg0sgx7pjwyacj"))

(define rust-hashbrown-0.16.1
  (crate-source "hashbrown" "0.16.1"
                "004i3njw38ji3bzdp9z178ba9x3k0c1pgy8x69pj7yfppv4iq7c4"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-hermit-abi-0.5.2
  (crate-source "hermit-abi" "0.5.2"
                "1744vaqkczpwncfy960j2hxrbjl1q01csm84jpd9dajbdr2yy3zw"))

(define rust-hex-0.4.3
  (crate-source "hex" "0.4.3"
                "0w1a4davm1lgzpamwnba907aysmlrnygbqmfis2mqjx5m552a93z"))

(define rust-hexf-parse-0.2.1
  (crate-source "hexf-parse" "0.2.1"
                "1pr3a3sk66ddxdyxdxac7q6qaqjcn28v0njy22ghdpfn78l8d9nz"))

(define rust-hybrid-array-0.4.10
  (crate-source "hybrid-array" "0.4.10"
                "055jvmp7rsb44z5aimj9zbam9y33nplyagik38m0xd36yy6cyi1r"))

(define rust-iced-0.14.0
  (crate-source "iced" "0.14.0"
                "1cqzf3fzcwn4j696yzrpb8k5ar8fv8xdp8sphczn9flkdh1023h0"))

(define rust-iced-core-0.14.0
  (crate-source "iced_core" "0.14.0"
                "11cxf8scyvx4r722q1dj9agyxg02m51yfai5d5z3wh4rsqvikawi"))

(define rust-iced-debug-0.14.0
  (crate-source "iced_debug" "0.14.0"
                "1gm05qhb89xd625c7gz42wlgp8ar9vy3cghhyi9hwqjs46q5l0r5"))

(define rust-iced-futures-0.14.0
  (crate-source "iced_futures" "0.14.0"
                "02nz7wm85xmhl2ls8dyiab6dp80fmwcc0diw573vxps2mp68a34c"))

(define rust-iced-graphics-0.14.0
  (crate-source "iced_graphics" "0.14.0"
                "00m18kxq58xwb6i81393r1m4jb14np8zm9cgyram05f4rv1a2k13"))

(define rust-iced-program-0.14.0
  (crate-source "iced_program" "0.14.0"
                "0wx6whk9s61y6knmlcznkq7sc6m1gcrsq3dhis6ninkwjk1gxykd"))

(define rust-iced-renderer-0.14.0
  (crate-source "iced_renderer" "0.14.0"
                "01dcbnp2l7ssg7yvk92qwqz44py60xynribfk1vw1s084j0c0315"))

(define rust-iced-runtime-0.14.0
  (crate-source "iced_runtime" "0.14.0"
                "1m589zs8dk07vha6jfa1aik6b56lr0vf6hij31s6dh74kj0rp26i"))

(define rust-iced-tiny-skia-0.14.0
  (crate-source "iced_tiny_skia" "0.14.0"
                "0gfcx5i1qbr3ppja1p99xbm6xcy1zzyjj8szzx593g53fn5wy2py"))

(define rust-iced-wgpu-0.14.0
  (crate-source "iced_wgpu" "0.14.0"
                "04qwaqqaxj79pq7fql7989f84h020q04b4sp0ahzi80ckfcll57z"))

(define rust-iced-widget-0.14.2
  (crate-source "iced_widget" "0.14.2"
                "1aspx7drf0sprvgl4p7rz16hdlqidjp2phcbirhw429i1px6lndi"))

(define rust-iced-winit-0.14.0
  (crate-source "iced_winit" "0.14.0"
                "0x9d2qixfzbsiyhvayjb021c724bcygr6zbhp7iisban8zfbwzcb"))

(define rust-id-arena-2.3.0
  (crate-source "id-arena" "2.3.0"
                "0m6rs0jcaj4mg33gkv98d71w3hridghp5c4yr928hplpkgbnfc1x"))

(define rust-ident-case-1.0.1
  (crate-source "ident_case" "1.0.1"
                "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))

(define rust-image-0.25.10
  (crate-source "image" "0.25.10"
                "0131b9fsd5grxf3lchfs2ci0rg8ga2mh1ygai7k2zh1k8cwq1aw5"))

(define rust-image-webp-0.2.4
  (crate-source "image-webp" "0.2.4"
                "1hz814csyi9283vinzlkix6qpnd6hs3fkw7xl6z2zgm4w7rrypjj"))

(define rust-imageproc-0.26.1
  (crate-source "imageproc" "0.26.1"
                "0f36wkn2vv23qpsw1ml4xyxnkcpbh12h102qbz3ar288b7d4d02s"))

(define rust-imgref-1.12.0
  (crate-source "imgref" "1.12.0"
                "1j3iwdal9mdkmyrsms3lz4n1bxxxjxss2jvbmh662fns63fcxig7"))

(define rust-indexmap-2.13.0
  (crate-source "indexmap" "2.13.0"
                "05qh5c4h2hrnyypphxpwflk45syqbzvqsvvyxg43mp576w2ff53p"))

(define rust-inout-0.2.2
  (crate-source "inout" "0.2.2"
                "1iq39s01d3y56j2r6hf75yqhpa7s2ifwr316yzyi0879a9jcwl22"))

(define rust-interpolate-name-0.2.4
  (crate-source "interpolate_name" "0.2.4"
                "0q7s5mrfkx4p56dl8q9zq71y1ysdj4shh6f28qf9gly35l21jj63"))

(define rust-is-terminal-polyfill-1.70.2
  (crate-source "is_terminal_polyfill" "1.70.2"
                "15anlc47sbz0jfs9q8fhwf0h3vs2w4imc030shdnq54sny5i7jx6"))

(define rust-itertools-0.14.0
  (crate-source "itertools" "0.14.0"
                "118j6l1vs2mx65dqhwyssbrxpawa90886m3mzafdvyip41w2q69b"))

(define rust-itoa-1.0.18
  (crate-source "itoa" "1.0.18"
                "10jnd1vpfkb8kj38rlkn2a6k02afvj3qmw054dfpzagrpl6achlg"))

(define rust-jiff-0.2.23
  (crate-source "jiff" "0.2.23"
                "0nc37n7jvgrzxdkcgc2hsfdf70lfagigjalh4igjrm5njvf4cd8s"))

(define rust-jiff-static-0.2.23
  (crate-source "jiff-static" "0.2.23"
                "192ss3cnixvg79cpa76clwkhn4mmz10vnwsbf7yjw8i484s8p31a"))

(define rust-jni-0.21.1
  (crate-source "jni" "0.21.1"
                "15wczfkr2r45slsljby12ymf2hij8wi5b104ghck9byjnwmsm1qs"))

(define rust-jni-0.22.4
  (crate-source "jni" "0.22.4"
                "161lza8gz071h22pgyqyx4n91ixd691z2dbb1pq2g97k5i49mzay"))

(define rust-jni-macros-0.22.4
  (crate-source "jni-macros" "0.22.4"
                "18v02mcn5c7mb2yw6r930xg6ynsn7hwkxv8z2kdhn3qprjn0j0d0"))

(define rust-jni-sys-0.3.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "jni-sys" "0.3.1"
                "0n1j8fbz081w1igfrpc79n6vgm7h3ik34nziy5fjgq5nz7hm59j1"))

(define rust-jni-sys-0.4.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "jni-sys" "0.4.1"
                "1wlahx6f2zhczdjqyn8mk7kshb8x5vsd927sn3lvw41rrf47ldy6"))

(define rust-jni-sys-macros-0.4.1
  (crate-source "jni-sys-macros" "0.4.1"
                "0r32gbabrak15a7p487765b5wc0jcna2yv88mk6m1zjqyi1bkh1q"))

(define rust-jobserver-0.1.34
  (crate-source "jobserver" "0.1.34"
                "0cwx0fllqzdycqn4d6nb277qx5qwnmjdxdl0lxkkwssx77j3vyws"))

(define rust-js-sys-0.3.94
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "js-sys" "0.3.94"
                "1nb4fr7c78mrrdhmg04nbac1zvd5z3panvqka8sy30nfh3py411f"))

(define rust-kamadak-exif-0.6.1
  (crate-source "kamadak-exif" "0.6.1"
                "0ds8k36qi88mzhx5fm1cgbxg0s4kmyiibmqpl5asvvvlfc6dhc0i"))

(define rust-khronos-egl-6.0.0
  (crate-source "khronos-egl" "6.0.0"
                "0xnzdx0n1bil06xmh8i1x6dbxvk7kd2m70bbm6nw1qzc43r1vbka"))

(define rust-khronos-api-3.1.0
  (crate-source "khronos_api" "3.1.0"
                "1p0xj5mlbagqyvvnv8wmv3cr7l9y1m153888pxqwg3vk3mg5inz2"))

(define rust-ksni-0.3.3
  (crate-source "ksni" "0.3.3"
                "091aqlxxhsyrw0iii1zh7l65wfs1cnrdr6sxnb2j9khlkw49rcmm"))

(define rust-kurbo-0.10.4
  (crate-source "kurbo" "0.10.4"
                "0h1lqqdxv2xd5lyvpfsw01hyjpzkms03sdndwxkpvs93v7mx860n"))

(define rust-lazy-static-1.5.0
  (crate-source "lazy_static" "1.5.0"
                "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))

(define rust-leb128fmt-0.1.0
  (crate-source "leb128fmt" "0.1.0"
                "1chxm1484a0bly6anh6bd7a99sn355ymlagnwj3yajafnpldkv89"))

(define rust-lebe-0.5.3
  (crate-source "lebe" "0.5.3"
                "1f459clndzzm35nyd15vj5dlasyagfasp7hcgl6lh2b658rs6ybs"))

(define rust-libc-0.2.184
  (crate-source "libc" "0.2.184"
                "1bz4525m7lwzr63iidh7lp9ppz2c9va1pn6fyjh5wsp1ajjd5xa8"))

(define rust-libdbus-sys-0.2.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libdbus-sys" "0.2.7"
                "0hzhq0dz6lfzmhsym9m95cfhjzrwq74qdg85xkpg2012sj4lg31j"))

(define rust-libfuzzer-sys-0.4.12
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libfuzzer-sys" "0.4.12"
                "13ghagfsynmqda1pkpalila6kf0llqxh3214ynzi5knqgldnhapi"))

(define rust-libloading-0.8.9
  (crate-source "libloading" "0.8.9"
                "0mfwxwjwi2cf0plxcd685yxzavlslz7xirss3b9cbrzyk4hv1i6p"))

(define rust-libm-0.2.16
  (crate-source "libm" "0.2.16"
                "10brh0a3qjmbzkr5mf5xqi887nhs5y9layvnki89ykz9xb1wxlmn"))

(define rust-libpulse-binding-2.30.1
  (crate-source "libpulse-binding" "2.30.1"
                "15x3srbvqmwmhk20q9binq3cwakj59pgwnp61xl77qqnkq2b77lh"))

(define rust-libpulse-sys-1.23.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libpulse-sys" "1.23.0"
                "0qayl38603vlzrfb9n2p2mqn0jfpxg9225nc57w8ks92if272hyp"))

(define rust-libredox-0.1.15
  (crate-source "libredox" "0.1.15"
                "022g34brmdis15kji0w9kla6xk6098xvs416ihgnn92isj7z9nvx"))

(define rust-lilt-0.8.1
  (crate-source "lilt" "0.8.1"
                "1bap1s8l2vzyxbing3z2jh4l4s376l1wbqcvz99hbcpnxzjn4xgn"))

(define rust-linebender-resource-handle-0.1.1
  (crate-source "linebender_resource_handle" "0.1.1"
                "1x34mrmqan0m3m9xf2iy6vpkcx6vwiiyzm2g3ixqdi56rimzz9fl"))

(define rust-linux-raw-sys-0.4.15
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.4.15"
                "1aq7r2g7786hyxhv40spzf2nhag5xbw2axxc1k8z5k1dsgdm4v6j"))

(define rust-linux-raw-sys-0.12.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.12.1"
                "0lwasljrqxjjfk9l2j8lyib1babh2qjlnhylqzl01nihw14nk9ij"))

(define rust-litrs-1.0.0
  (crate-source "litrs" "1.0.0"
                "14p0kzzkavnngvybl88nvfwv031cc2qx4vaxpfwsiifm8grdglqi"))

(define rust-lock-api-0.4.14
  (crate-source "lock_api" "0.4.14"
                "0rg9mhx7vdpajfxvdjmgmlyrn20ligzqvn8ifmaz7dc79gkrjhr2"))

(define rust-log-0.4.29
  (crate-source "log" "0.4.29"
                "15q8j9c8g5zpkcw0hnd6cf2z7fxqnvsjh3rw5mv5q10r83i34l2y"))

(define rust-loop9-0.1.5
  (crate-source "loop9" "0.1.5"
                "0qphc1c0cbbx43pwm6isnwzwbg6nsxjh7jah04n1sg5h4p0qgbhg"))

(define rust-lru-0.16.3
  (crate-source "lru" "0.16.3"
                "14z5yxcp3f63lgw8yxr486g9yz7cfqbmkadfwgw36vy0jbslgp51"))

(define rust-macaddr-1.0.1
  (crate-source "macaddr" "1.0.1"
                "1n5jxn79krlql810c4w3hdkvyqc01141dc5y6fr9sxff2yy0pvms"))

(define rust-malloc-buf-0.0.6
  (crate-source "malloc_buf" "0.0.6"
                "1jqr77j89pwszv51fmnknzvd53i1nkmcr8rjrvcxhm4dx1zr1fv2"))

(define rust-matrixmultiply-0.3.10
  (crate-source "matrixmultiply" "0.3.10"
                "020sqwg3cvprfasbszqbnis9zx6c3w9vlkfidyimgblzdq0y6vd0"))

(define rust-maybe-rayon-0.1.1
  (crate-source "maybe-rayon" "0.1.1"
                "06cmvhj4n36459g327ng5dnj8d58qs472pv5ahlhm7ynxl6g78cf"))

(define rust-memchr-2.8.0
  (crate-source "memchr" "2.8.0"
                "0y9zzxcqxvdqg6wyag7vc3h0blhdn7hkq164bxyx2vph8zs5ijpq"))

(define rust-memmap2-0.9.10
  (crate-source "memmap2" "0.9.10"
                "1qz0n4ch68pz2mp07sdwnk27imdjjqy6aqir3hp9j4g0iw19hh3i"))

(define rust-memoffset-0.9.1
  (crate-source "memoffset" "0.9.1"
                "12i17wh9a9plx869g7j4whf62xw68k5zd4k0k5nh6ys5mszid028"))

(define rust-metal-0.32.0
  (crate-source "metal" "0.32.0"
                "01g6a10l2p576ibybz0v9hignw7qj0r6d513qbf2vxrzcxpmmh80"))

(define rust-miniz-oxide-0.8.9
  (crate-source "miniz_oxide" "0.8.9"
                "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz"))

(define rust-mio-1.2.0
  (crate-source "mio" "1.2.0"
                "1hanrh4fwsfkdqdaqfidz48zz1wdix23zwn3r2x78am0garfbdsh"))

(define rust-moxcms-0.8.1
  (crate-source "moxcms" "0.8.1"
                "0jz4fd5f7pdn1rngqc96lxriqjkym1lswdhdbjr037s8p9ac31dv"))

(define rust-mundy-0.2.2
  (crate-source "mundy" "0.2.2"
                "12vy5rlllwhdc0w7zdhm44w9j7sm2aqlw88571ll7v4lw74i6f2j"))

(define rust-mutate-once-0.1.2
  (crate-source "mutate_once" "0.1.2"
                "1byj4yz6h0mdx3mmj0mq23ma59kw41pckspr2gz8rl22k0y27lhk"))

(define rust-naga-27.0.3
  (crate-source "naga" "27.0.3"
                "1n57m5hwi42mk57ljz7manc45b8ky8890891y86yw4cb1rgz4v06"))

(define rust-nalgebra-0.34.2
  (crate-source "nalgebra" "0.34.2"
                "02m7102xrslyxf55pjp5kpdhvv9d2gb08n08i63birn7yl7ylxnz"))

(define rust-ndk-0.9.0
  (crate-source "ndk" "0.9.0"
                "1m32zpmi5w1pf3j47k6k5fw395dc7aj8d0mdpsv53lqkprxjxx63"))

(define rust-ndk-context-0.1.1
  (crate-source "ndk-context" "0.1.1"
                "12sai3dqsblsvfd1l1zab0z6xsnlha3xsfl7kagdnmj3an3jvc17"))

(define rust-ndk-sys-0.6.0+11769913
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "ndk-sys" "0.6.0+11769913"
                "0wx8r6pji20if4xs04g73gxl98nmjrfc73z0v6w1ypv6a4qdlv7f"))

(define rust-new-debug-unreachable-1.0.6
  (crate-source "new_debug_unreachable" "1.0.6"
                "11phpf1mjxq6khk91yzcbd3ympm78m3ivl7xg6lg2c0lf66fy3k5"))

(define rust-nix-0.29.0
  (crate-source "nix" "0.29.0"
                "0ikvn7s9r2lrfdm3mx1h7nbfjvcc6s9vxdzw7j5xfkd2qdnp9qki"))

(define rust-nom-8.0.0
  (crate-source "nom" "8.0.0"
                "01cl5xng9d0gxf26h39m0l8lprgpa00fcc75ps1yzgbib1vn35yz"))

(define rust-noop-proc-macro-0.3.0
  (crate-source "noop_proc_macro" "0.3.0"
                "1j2v1c6ric4w9v12h34jghzmngcwmn0hll1ywly4h6lcm4rbnxh6"))

(define rust-num-0.4.3
  (crate-source "num" "0.4.3"
                "08yb2fc1psig7pkzaplm495yp7c30m4pykpkwmi5bxrgid705g9m"))

(define rust-num-bigint-0.4.6
  (crate-source "num-bigint" "0.4.6"
                "1f903zd33i6hkjpsgwhqwi2wffnvkxbn6rv4mkgcjcqi7xr4zr55"))

(define rust-num-complex-0.4.6
  (crate-source "num-complex" "0.4.6"
                "15cla16mnw12xzf5g041nxbjjm9m85hdgadd5dl5d0b30w9qmy3k"))

(define rust-num-derive-0.4.2
  (crate-source "num-derive" "0.4.2"
                "00p2am9ma8jgd2v6xpsz621wc7wbn1yqi71g15gc3h67m7qmafgd"))

(define rust-num-integer-0.1.46
  (crate-source "num-integer" "0.1.46"
                "13w5g54a9184cqlbsq80rnxw4jj4s0d8wv75jsq5r2lms8gncsbr"))

(define rust-num-iter-0.1.45
  (crate-source "num-iter" "0.1.45"
                "1gzm7vc5g9qsjjl3bqk9rz1h6raxhygbrcpbfl04swlh0i506a8l"))

(define rust-num-rational-0.4.2
  (crate-source "num-rational" "0.4.2"
                "093qndy02817vpgcqjnj139im3jl7vkq4h68kykdqqh577d18ggq"))

(define rust-num-traits-0.2.19
  (crate-source "num-traits" "0.2.19"
                "0h984rhdkkqd4ny9cif7y2azl3xdfb7768hb9irhpsch4q3gq787"))

(define rust-num-enum-0.7.6
  (crate-source "num_enum" "0.7.6"
                "09kg0c2y08npdv0c9dbm4m9a9wz8w2qaiqqxl4gj3v22hj1wl2sx"))

(define rust-num-enum-derive-0.7.6
  (crate-source "num_enum_derive" "0.7.6"
                "1y0x9z49s27vdas6mglqbv02sgkdmbr8ns2kwspzrp2ra81rh2b8"))

(define rust-objc-0.2.7
  (crate-source "objc" "0.2.7"
                "1cbpf6kz8a244nn1qzl3xyhmp05gsg4n313c9m3567625d3innwi"))

(define rust-objc-sys-0.3.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "objc-sys" "0.3.5"
                "0423gry7s3rmz8s3pzzm1zy5mdjif75g6dbzc2lf2z0c77fipffd"))

(define rust-objc2-0.5.2
  (crate-source "objc2" "0.5.2"
                "015qa2d3vh7c1j2736h5wjrznri7x5ic35vl916c22gzxva8b9s6"))

(define rust-objc2-0.6.4
  (crate-source "objc2" "0.6.4"
                "17x8qpl512frscfqbmgjr20kg3y4r0xdqxphja17dz5f0znsh4is"))

(define rust-objc2-app-kit-0.2.2
  (crate-source "objc2-app-kit" "0.2.2"
                "1zqyi5l1bm26j1bgmac9783ah36m5kcrxlqp5carglnpwgcrms74"))

(define rust-objc2-app-kit-0.3.2
  (crate-source "objc2-app-kit" "0.3.2"
                "132ijwni8lsi8phq7wnmialkxp46zx998fns3zq5np0ya1mr77nl"))

(define rust-objc2-cloud-kit-0.2.2
  (crate-source "objc2-cloud-kit" "0.2.2"
                "02dhjvmcq8c2bwj31jx423jygif1scs9f0lmlab0ayhw75b3ppbl"))

(define rust-objc2-cloud-kit-0.3.2
  (crate-source "objc2-cloud-kit" "0.3.2"
                "0714xrydi9wvh25s2110sjfpx9mv4xs9p4ys71q8fhxvh3c79bbk"))

(define rust-objc2-contacts-0.2.2
  (crate-source "objc2-contacts" "0.2.2"
                "12a8m927xrrxa54xhqhqnkkl1a6l07pyrpnqfk9jz09kkh755zx5"))

(define rust-objc2-core-data-0.2.2
  (crate-source "objc2-core-data" "0.2.2"
                "1vvk8zjylfjjj04dzawydmqqz5ajvdkhf22cnb07ihbiw14vyzv1"))

(define rust-objc2-core-data-0.3.2
  (crate-source "objc2-core-data" "0.3.2"
                "1ylqsa6hpma7k4090pkil8b7c0i8dcxnh46zwhnfidgv7rjjlh0b"))

(define rust-objc2-core-foundation-0.3.2
  (crate-source "objc2-core-foundation" "0.3.2"
                "0dnmg7606n4zifyjw4ff554xvjmi256cs8fpgpdmr91gckc0s61a"))

(define rust-objc2-core-graphics-0.3.2
  (crate-source "objc2-core-graphics" "0.3.2"
                "01x8413pxq0m5rwidlaczni8v5cz9dc3xqzq8l9zlpl9cv8cj8p0"))

(define rust-objc2-core-image-0.2.2
  (crate-source "objc2-core-image" "0.2.2"
                "102csfb82zi2sbzliwsfd589ckz0gysf7y6434c9zj97lmihj9jm"))

(define rust-objc2-core-image-0.3.2
  (crate-source "objc2-core-image" "0.3.2"
                "01phi7cx2k32a8x45qr0y1623l2b8gg764c6isgj15rbinrn7mg5"))

(define rust-objc2-core-location-0.2.2
  (crate-source "objc2-core-location" "0.2.2"
                "10apgsrigqryvi4rcc0f6yfjflvrl83f4bi5hkr48ck89vizw300"))

(define rust-objc2-core-text-0.3.2
  (crate-source "objc2-core-text" "0.3.2"
                "0bfrzqxhgh4y1imk1bb9g0v28g0frigls6hnc942npfj93xhvphc"))

(define rust-objc2-core-video-0.3.2
  (crate-source "objc2-core-video" "0.3.2"
                "19j1a7f863gh30nq03w70x1js3f3vdg3wp4azllky8vkvzqwl9fl"))

(define rust-objc2-encode-4.1.0
  (crate-source "objc2-encode" "4.1.0"
                "0cqckp4cpf68mxyc2zgnazj8klv0z395nsgbafa61cjgsyyan9gg"))

(define rust-objc2-foundation-0.2.2
  (crate-source "objc2-foundation" "0.2.2"
                "1a6mi77jsig7950vmx9ydvsxaighzdiglk5d229k569pvajkirhf"))

(define rust-objc2-foundation-0.3.2
  (crate-source "objc2-foundation" "0.3.2"
                "0wijkxzzvw2xkzssds3fj8279cbykz2rz9agxf6qh7y2agpsvq73"))

(define rust-objc2-io-surface-0.3.2
  (crate-source "objc2-io-surface" "0.3.2"
                "07fqx4fmwydf2arrc4xs4awv7zyzzxh60fyqdfmrpm9n148qh1qq"))

(define rust-objc2-link-presentation-0.2.2
  (crate-source "objc2-link-presentation" "0.2.2"
                "160k4qh00yrx57dabn3hzas4r98kmk9bc0qsy1jvwday3irax8d1"))

(define rust-objc2-metal-0.2.2
  (crate-source "objc2-metal" "0.2.2"
                "1mmdga66qpxrcfq3gxxhysfx3zg1hpx4z886liv3j0pnfq9bl36x"))

(define rust-objc2-quartz-core-0.2.2
  (crate-source "objc2-quartz-core" "0.2.2"
                "0ynw8819c36l11rim8n0yzk0fskbzrgaqayscyqi8swhzxxywaz4"))

(define rust-objc2-quartz-core-0.3.2
  (crate-source "objc2-quartz-core" "0.3.2"
                "07vzaf6y1lk7zygkgvpp23mm19ipdm9yq8af22gvywdkaa23bhcn"))

(define rust-objc2-symbols-0.2.2
  (crate-source "objc2-symbols" "0.2.2"
                "1p04hjkxan18g2b7h9n2n8xxsvazapv2h6mfmmdk06zc7pz4ws0a"))

(define rust-objc2-ui-kit-0.2.2
  (crate-source "objc2-ui-kit" "0.2.2"
                "0vrb5r8z658l8c19bx78qks8c5hg956544yirf8npk90idwldfxq"))

(define rust-objc2-uniform-type-identifiers-0.2.2
  (crate-source "objc2-uniform-type-identifiers" "0.2.2"
                "1ziv4wkbxcaw015ypg0q49ycl7m14l3x56mpq2k1rznv92bmzyj4"))

(define rust-objc2-user-notifications-0.2.2
  (crate-source "objc2-user-notifications" "0.2.2"
                "1cscv2w3vxzaslz101ddv0z9ycrrs4ayikk4my4qd3im8bvcpkvn"))

(define rust-once-cell-1.21.4
  (crate-source "once_cell" "1.21.4"
                "0l1v676wf71kjg2khch4dphwh1jp3291ffiymr2mvy1kxd5kwz4z"))

(define rust-once-cell-polyfill-1.70.2
  (crate-source "once_cell_polyfill" "1.70.2"
                "1zmla628f0sk3fhjdjqzgxhalr2xrfna958s632z65bjsfv8ljrq"))

(define rust-orbclient-0.3.51
  (crate-source "orbclient" "0.3.51"
                "1mmbx63ycb1n2c1nz8jmmnv3466kj3aj38wnpjhwzvbq6nrx7bjr"))

(define rust-ordered-float-5.3.0
  (crate-source "ordered-float" "5.3.0"
                "03mx5yg3ncp0g524y7zbyvhwcxpd8l9v30lgybm5bhqx2v551ndp"))

(define rust-ordered-stream-0.2.0
  (crate-source "ordered-stream" "0.2.0"
                "0l0xxp697q7wiix1gnfn66xsss7fdhfivl2k7bvpjs4i3lgb18ls"))

(define rust-owned-ttf-parser-0.25.1
  (crate-source "owned_ttf_parser" "0.25.1"
                "0fsqzcbc4sq8qhkmc3rgcfg1xg389nmhlxvmvi6h38dca680x0in"))

(define rust-parking-2.2.1
  (crate-source "parking" "2.2.1"
                "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk"))

(define rust-parking-lot-0.12.5
  (crate-source "parking_lot" "0.12.5"
                "06jsqh9aqmc94j2rlm8gpccilqm6bskbd67zf6ypfc0f4m9p91ck"))

(define rust-parking-lot-core-0.9.12
  (crate-source "parking_lot_core" "0.9.12"
                "1hb4rggy70fwa1w9nb0svbyflzdc69h047482v2z3sx2hmcnh896"))

(define rust-paste-1.0.15
  (crate-source "paste" "1.0.15"
                "02pxffpdqkapy292harq6asfjvadgp1s005fip9ljfsn9fvxgh2p"))

(define rust-pastey-0.1.1
  (crate-source "pastey" "0.1.1"
                "1v389jkifv757903flrrps67dvc6q6giwlyx3xi33hcfjmgjxyrm"))

(define rust-pastey-0.2.1
  (crate-source "pastey" "0.2.1"
                "1v2vyc6gnk2qkwvrhzlkf67rwv4car122ix6mb9vp487gkcwlrxq"))

(define rust-percent-encoding-2.3.2
  (crate-source "percent-encoding" "2.3.2"
                "083jv1ai930azvawz2khv7w73xh8mnylk7i578cifndjn5y64kwv"))

(define rust-pin-project-1.1.11
  (crate-source "pin-project" "1.1.11"
                "05zm3y3bl83ypsr6favxvny2kys4i19jiz1y18ylrbxwsiz9qx7i"))

(define rust-pin-project-internal-1.1.11
  (crate-source "pin-project-internal" "1.1.11"
                "1ik4mpb92da75inmjvxf2qm61vrnwml3x24wddvrjlqh1z9hxcnr"))

(define rust-pin-project-lite-0.2.17
  (crate-source "pin-project-lite" "0.2.17"
                "1kfmwvs271si96zay4mm8887v5khw0c27jc9srw1a75ykvgj54x8"))

(define rust-pin-utils-0.1.0
  (crate-source "pin-utils" "0.1.0"
                "117ir7vslsl2z1a7qzhws4pd01cg2d3338c47swjyvqv2n60v1wb"))

(define rust-piper-0.2.5
  (crate-source "piper" "0.2.5"
                "1hd3j94mw5dwc457gs9ssb2r5b9iipywndf5srqx7pj38jd4fdf8"))

(define rust-pkg-config-0.3.32
  (crate-source "pkg-config" "0.3.32"
                "0k4h3gnzs94sjb2ix6jyksacs52cf1fanpwsmlhjnwrdnp8dppby"))

(define rust-plain-0.2.3
  (crate-source "plain" "0.2.3"
                "19n1xbxb4wa7w891268bzf6cbwq4qvdb86bik1z129qb0xnnnndl"))

(define rust-png-0.18.1
  (crate-source "png" "0.18.1"
                "0qca282xp8a6d7mikxrwji3f52mjn4vnqxz2v9iz5adj665rnxk0"))

(define rust-polling-3.11.0
  (crate-source "polling" "3.11.0"
                "0622qfbxi3gb0ly2c99n3xawp878fkrd1sl83hjdhisx11cly3jx"))

(define rust-portable-atomic-1.13.1
  (crate-source "portable-atomic" "1.13.1"
                "0j8vlar3n5acyigq8q6f4wjx3k3s5yz0rlpqrv76j73gi5qr8fn3"))

(define rust-portable-atomic-util-0.2.6
  (crate-source "portable-atomic-util" "0.2.6"
                "18wrsx7fjwc2kgbpfjfm3igv3vdzsidmjhbqivjln7d0c6z9f4q9"))

(define rust-ppv-lite86-0.2.21
  (crate-source "ppv-lite86" "0.2.21"
                "1abxx6qz5qnd43br1dd9b2savpihzjza8gb4fbzdql1gxp2f7sl5"))

(define rust-presser-0.3.1
  (crate-source "presser" "0.3.1"
                "1ykvqx861sjmhkdh540aafqba7i7li7gqgwrcczy6v56i9m8xkz8"))

(define rust-prettyplease-0.2.37
  (crate-source "prettyplease" "0.2.37"
                "0azn11i1kh0byabhsgab6kqs74zyrg69xkirzgqyhz6xmjnsi727"))

(define rust-primal-check-0.3.4
  (crate-source "primal-check" "0.3.4"
                "025xnak4rhkwa4h970bjb3cvp2k853wviyr84n8gjfhy65dqj3fw"))

(define rust-proc-macro-crate-3.5.0
  (crate-source "proc-macro-crate" "3.5.0"
                "0kv1g1d1zjwxlgcaba2qlshzyy32j03xic8rskqlcr5mnblsfyz6"))

(define rust-proc-macro2-1.0.106
  (crate-source "proc-macro2" "1.0.106"
                "0d09nczyaj67x4ihqr5p7gxbkz38gxhk4asc0k8q23g9n85hzl4g"))

(define rust-profiling-1.0.17
  (crate-source "profiling" "1.0.17"
                "0wqp6i1bl7azy9270dp92srbbr55mgdh9qnk5b1y44lyarmlif1y"))

(define rust-profiling-procmacros-1.0.17
  (crate-source "profiling-procmacros" "1.0.17"
                "0nrxdh5r723raxbs136jmjx46p0c5qgai8jwz4j555mn0ad7ywaj"))

(define rust-pxfm-0.1.28
  (crate-source "pxfm" "0.1.28"
                "17bbi6r9jiz9rmlj9zwjcf3qrivr33l8vwjmj9y812ysagkl385m"))

(define rust-qoi-0.4.1
  (crate-source "qoi" "0.4.1"
                "00c0wkb112annn2wl72ixyd78mf56p4lxkhlmsggx65l3v3n8vbz"))

(define rust-quick-error-2.0.1
  (crate-source "quick-error" "2.0.1"
                "18z6r2rcjvvf8cn92xjhm2qc3jpd1ljvcbf12zv0k9p565gmb4x9"))

(define rust-quick-xml-0.39.2
  (crate-source "quick-xml" "0.39.2"
                "0z86jkw618p0d7q3zqp7pzh7cnf7wwlanzx8gyma3dffwzl233wm"))

(define rust-quote-1.0.45
  (crate-source "quote" "1.0.45"
                "095rb5rg7pbnwdp6v8w5jw93wndwyijgci1b5lw8j1h5cscn3wj1"))

(define rust-r-efi-5.3.0
  (crate-source "r-efi" "5.3.0"
                "03sbfm3g7myvzyylff6qaxk4z6fy76yv860yy66jiswc2m6b7kb9"))

(define rust-r-efi-6.0.0
  (crate-source "r-efi" "6.0.0"
                "1gyrl2k5fyzj9k7kchg2n296z5881lg7070msabid09asp3wkp7q"))

(define rust-rand-0.9.2
  (crate-source "rand" "0.9.2"
                "1lah73ainvrgl7brcxx0pwhpnqa3sm3qaj672034jz8i0q7pgckd"))

(define rust-rand-chacha-0.9.0
  (crate-source "rand_chacha" "0.9.0"
                "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))

(define rust-rand-core-0.9.5
  (crate-source "rand_core" "0.9.5"
                "0g6qc5r3f0hdmz9b11nripyp9qqrzb0xqk9piip8w8qlvqkcibvn"))

(define rust-rand-distr-0.5.1
  (crate-source "rand_distr" "0.5.1"
                "0qvlzxq4a2rvrf3wq0xq1bfw8iy9zqm6jlmbywqzld6g1paib1ka"))

(define rust-range-alloc-0.1.5
  (crate-source "range-alloc" "0.1.5"
                "020xrpn0qaabkxg49wpi0hgy92d8ikji55cyancphnmfi6bl2ifa"))

(define rust-rangemap-1.7.1
  (crate-source "rangemap" "1.7.1"
                "0s7am2w72siggn668h03gn3g06gsinv6m1jaaxmnbj59177l6d4p"))

(define rust-rav1e-0.8.1
  (crate-source "rav1e" "0.8.1"
                "0axk3ji3jmlr81svmsy5zvj8shmhpp8lz5nyghkq752xx1bdvdj3"))

(define rust-ravif-0.13.0
  (crate-source "ravif" "0.13.0"
                "0ifcpczxf6kcsqlky08vbjrvw9yd1m9mfszywxdhy6wpglci08z5"))

(define rust-raw-window-handle-0.6.2
  (crate-source "raw-window-handle" "0.6.2"
                "0ff5c648hncwx7hm2a8fqgqlbvbl4xawb6v3xxv9wkpjyrr5arr0"))

(define rust-rawpointer-0.2.1
  (crate-source "rawpointer" "0.2.1"
                "1qy1qvj17yh957vhffnq6agq0brvylw27xgks171qrah75wmg8v0"))

(define rust-rayon-1.11.0
  (crate-source "rayon" "1.11.0"
                "13x5fxb7rn4j2yw0cr26n7782jkc7rjzmdkg42qxk3xz0p8033rn"))

(define rust-rayon-core-1.13.0
  (crate-source "rayon-core" "1.13.0"
                "14dbr0sq83a6lf1rfjq5xdpk5r6zgzvmzs5j6110vlv2007qpq92"))

(define rust-read-fonts-0.35.0
  (crate-source "read-fonts" "0.35.0"
                "0n0kr71apps034i708r6vx3y2kd35da2j4vikm5zdbc8nhiwy5v7"))

(define rust-read-fonts-0.37.0
  (crate-source "read-fonts" "0.37.0"
                "1r82vwrmsai9i7bgmnblb7sn08k2kca75lpz0x9v3yijy2mlyqvv"))

(define rust-redox-syscall-0.4.1
  (crate-source "redox_syscall" "0.4.1"
                "1aiifyz5dnybfvkk4cdab9p2kmphag1yad6iknc7aszlxxldf8j7"))

(define rust-redox-syscall-0.5.18
  (crate-source "redox_syscall" "0.5.18"
                "0b9n38zsxylql36vybw18if68yc9jczxmbyzdwyhb9sifmag4azd"))

(define rust-redox-syscall-0.7.3
  (crate-source "redox_syscall" "0.7.3"
                "05mys0g4faa5l7dqvl4y8395b42yshs2qlvysdvijlwhx1s0mrvc"))

(define rust-regex-1.12.3
  (crate-source "regex" "1.12.3"
                "0xp2q0x7ybmpa5zlgaz00p8zswcirj9h8nry3rxxsdwi9fhm81z1"))

(define rust-regex-automata-0.4.14
  (crate-source "regex-automata" "0.4.14"
                "13xf7hhn4qmgfh784llcp2kzrvljd13lb2b1ca0mwnf15w9d87bf"))

(define rust-regex-syntax-0.8.10
  (crate-source "regex-syntax" "0.8.10"
                "02jx311ka0daxxc7v45ikzhcl3iydjbbb0mdrpc1xgg8v7c7v2fw"))

(define rust-renderdoc-sys-1.1.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "renderdoc-sys" "1.1.0"
                "0cj8zjs7k0gvchcx3jhpg8r9bbqy8b1hsgbz0flcq2ydn12hmcqr"))

(define rust-rgb-0.8.53
  (crate-source "rgb" "0.8.53"
                "1i0c55whln68zs6f5qqrkbg1mzai0p3qk1mwkwzdgr9i3dw4pcs7"))

(define rust-roxmltree-0.20.0
  (crate-source "roxmltree" "0.20.0"
                "15vw91ps91wkmmgy62khf9zb63bdinvm80957dascbsw7dwvc83c"))

(define rust-rustc-hash-1.1.0
  (crate-source "rustc-hash" "1.1.0"
                "1qkc5khrmv5pqi5l5ca9p5nl5hs742cagrndhbrlk3dhlrx3zm08"))

(define rust-rustc-hash-2.1.2
  (crate-source "rustc-hash" "2.1.2"
                "1gjdc5bw9982cj176jvgz9rrqf9xvr1q1ddpzywf5qhs7yzhlc4l"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rustdct-0.7.1
  (crate-source "rustdct" "0.7.1"
                "0lcm1191xx8wizima5j3n25fs90x58v3q1kwg6cbzafn0m8maqcb"))

(define rust-rustfft-6.4.1
  (crate-source "rustfft" "6.4.1"
                "12fvi8naf08vc0c1lg3hfikcl4d6vcvh0s48iiwl27z9jfc5znr1"))

(define rust-rustix-0.38.44
  (crate-source "rustix" "0.38.44"
                "0m61v0h15lf5rrnbjhcb9306bgqrhskrqv7i1n0939dsw8dbrdgx"))

(define rust-rustix-1.1.4
  (crate-source "rustix" "1.1.4"
                "14511f9yjqh0ix07xjrjpllah3325774gfwi9zpq72sip5jlbzmn"))

(define rust-rustversion-1.0.22
  (crate-source "rustversion" "1.0.22"
                "0vfl70jhv72scd9rfqgr2n11m5i9l1acnk684m2w83w0zbqdx75k"))

(define rust-safe-arch-0.7.4
  (crate-source "safe_arch" "0.7.4"
                "08sk47n1kcm5w2di6bpgi2hsw8r2caz2230pwqvbdqfv5pl2vc4n"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-scoped-tls-1.0.1
  (crate-source "scoped-tls" "1.0.1"
                "15524h04mafihcvfpgxd8f4bgc3k95aclz8grjkg9a0rxcvn9kz1"))

(define rust-scopeguard-1.2.0
  (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-sctk-adwaita-0.10.1
  (crate-source "sctk-adwaita" "0.10.1"
                "1v14vqp7k39jk7pgaibwc06qq9vcmi82k7zlv3qpfvq52w17y9xn"))

(define rust-self-cell-1.2.2
  (crate-source "self_cell" "1.2.2"
                "12cdmh9p2h72rmw923kj841jji4k0vrykihvx19fn059az8pcbmi"))

(define rust-semver-1.0.27
  (crate-source "semver" "1.0.27"
                "1qmi3akfrnqc2hfkdgcxhld5bv961wbk8my3ascv5068mc5fnryp"))

(define rust-serde-1.0.228
  (crate-source "serde" "1.0.228"
                "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls"))

(define rust-serde-core-1.0.228
  (crate-source "serde_core" "1.0.228"
                "1bb7id2xwx8izq50098s5j2sqrrvk31jbbrjqygyan6ask3qbls1"))

(define rust-serde-derive-1.0.228
  (crate-source "serde_derive" "1.0.228"
                "0y8xm7fvmr2kjcd029g9fijpndh8csv5m20g4bd76w8qschg4h6m"))

(define rust-serde-json-1.0.149
  (crate-source "serde_json" "1.0.149"
                "11jdx4vilzrjjd1dpgy67x5lgzr0laplz30dhv75lnf5ffa07z43"))

(define rust-serde-repr-0.1.20
  (crate-source "serde_repr" "0.1.20"
                "1755gss3f6lwvv23pk7fhnjdkjw7609rcgjlr8vjg6791blf6php"))

(define rust-shlex-1.3.0
  (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-signal-hook-registry-1.4.8
  (crate-source "signal-hook-registry" "1.4.8"
                "06vc7pmnki6lmxar3z31gkyg9cw7py5x9g7px70gy2hil75nkny4"))

(define rust-simba-0.9.1
  (crate-source "simba" "0.9.1"
                "15gxgwcm6vs2wbbc5z4x8zsi1rhjl3nvqnxpl95hjrhnnaz894n9"))

(define rust-simd-adler32-0.3.9
  (crate-source "simd-adler32" "0.3.9"
                "0532ysdwcvzyp2bwpk8qz0hijplcdwpssr5gy5r7qwqqy5z5qgbh"))

(define rust-simd-cesu8-1.1.1
  (crate-source "simd_cesu8" "1.1.1"
                "0crcbgvyycmazji2vqj9vxn2czdyl3gxmicp4xqdzkc7pdbh3ycl"))

(define rust-simd-helpers-0.1.0
  (crate-source "simd_helpers" "0.1.0"
                "19idqicn9k4vhd04ifh2ff41wvna79zphdf2c81rlmpc7f3hz2cm"))

(define rust-simdutf8-0.1.5
  (crate-source "simdutf8" "0.1.5"
                "0vmpf7xaa0dnaikib5jlx6y4dxd3hxqz6l830qb079g7wcsgxag3"))

(define rust-skrifa-0.37.0
  (crate-source "skrifa" "0.37.0"
                "0hcqlhgbiv5lhjv6l0hfj2gm1nabvdy9iv9zry77acpmxlfhfccc"))

(define rust-skrifa-0.40.0
  (crate-source "skrifa" "0.40.0"
                "1b1lfid1326df2aq4cjqz7jv63m3i21czrgks7fxgyvm4hyzxgbz"))

(define rust-slab-0.4.12
  (crate-source "slab" "0.4.12"
                "1xcwik6s6zbd3lf51kkrcicdq2j4c1fw0yjdai2apy9467i0sy8c"))

(define rust-slotmap-1.1.1
  (crate-source "slotmap" "1.1.1"
                "0f20xf53zaysx9ydzkwwqm6hsjyb8lj2j6amhg57iln3jcy8rmdx"))

(define rust-smallvec-1.15.1
  (crate-source "smallvec" "1.15.1"
                "00xxdxxpgyq5vjnpljvkmy99xij5rxgh913ii1v16kzynnivgcb7"))

(define rust-smithay-client-toolkit-0.19.2
  (crate-source "smithay-client-toolkit" "0.19.2"
                "05h05hg4dn3v6br5jbdbs5nalk076a64s7fn6i01nqzby2hxwmrl"))

(define rust-smithay-client-toolkit-0.20.0
  (crate-source "smithay-client-toolkit" "0.20.0"
                "1h2cacmsh9zpw6sgmap49zx7cqhksfwas91mm40i5cz2ylwdl4h5"))

(define rust-smithay-clipboard-0.7.3
  (crate-source "smithay-clipboard" "0.7.3"
                "09hjm3dyjq4s3nxfzi65bg95hv540fi5zr5xad879xrryw1lqw3i"))

(define rust-smol-str-0.2.2
  (crate-source "smol_str" "0.2.2"
                "1bfylqf2vnqaglw58930vpxm2rfzji5gjp15a2c0kh8aj6v8ylyx"))

(define rust-socket2-0.6.3
  (crate-source "socket2" "0.6.3"
                "0gkjjcyn69hqhhlh5kl8byk5m0d7hyrp2aqwzbs3d33q208nwxis"))

(define rust-softbuffer-0.4.8
  (crate-source "softbuffer" "0.4.8"
                "1hznrcdzhhlr2x84926g28ybnlx649y1anr7mc4m3w5v3sl8vhda"))

(define rust-spirv-0.3.0+sdk-1.3.268.0
  (crate-source "spirv" "0.3.0+sdk-1.3.268.0"
                "0i3qj7yvvprai1s03dvll2gkfy8398nl64wvllkhaaa4vh1i197d"))

(define rust-stable-deref-trait-1.2.1
  (crate-source "stable_deref_trait" "1.2.1"
                "15h5h73ppqyhdhx6ywxfj88azmrpml9gl6zp3pwy2malqa6vxqkc"))

(define rust-static-assertions-1.1.0
  (crate-source "static_assertions" "1.1.0"
                "0gsl6xmw10gvn3zs1rv99laj5ig7ylffnh71f9l34js4nr4r7sx2"))

(define rust-strength-reduce-0.2.4
  (crate-source "strength_reduce" "0.2.4"
                "10jdq9dijjdkb20wg1dmwg447rnj37jbq0mwvbadvqi2gys5x2gy"))

(define rust-strict-num-0.1.1
  (crate-source "strict-num" "0.1.1"
                "0cb7l1vhb8zj90mzm8avlk815k40sql9515s865rqdrdfavvldv6"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-strum-0.26.3
  (crate-source "strum" "0.26.3"
                "01lgl6jvrf4j28v5kmx9bp480ygf1nhvac8b4p7rcj9hxw50zv4g"))

(define rust-strum-macros-0.26.4
  (crate-source "strum_macros" "0.26.4"
                "1gl1wmq24b8md527cpyd5bw9rkbqldd7k1h38kf5ajd2ln2ywssc"))

(define rust-svg-fmt-0.4.5
  (crate-source "svg_fmt" "0.4.5"
                "1yq2kv7klg8s5k19prn36cprlnb811cqgwhy079g7lng651wr4q1"))

(define rust-swash-0.2.7
  (crate-source "swash" "0.2.7"
                "0r5fb8rnqayydb9rw5fply28wjp5lpm87y84cab3ifn2d79kqbw4"))

(define rust-syn-2.0.117
  (crate-source "syn" "2.0.117"
                "16cv7c0wbn8amxc54n4w15kxlx5ypdmla8s0gxr2l7bv7s0bhrg6"))

(define rust-synstructure-0.13.2
  (crate-source "synstructure" "0.13.2"
                "1lh9lx3r3jb18f8sbj29am5hm9jymvbwh6jb1izsnnxgvgrp12kj"))

(define rust-sys-locale-0.3.2
  (crate-source "sys-locale" "0.3.2"
                "1i16hq9mkwpzqvixjfy1ph4i2q5klgagjg4hibz6k894l2crmawf"))

(define rust-tempfile-3.27.0
  (crate-source "tempfile" "3.27.0"
                "1gblhnyfjsbg9wjg194n89wrzah7jy3yzgnyzhp56f3v9jd7wj9j"))

(define rust-termcolor-1.4.1
  (crate-source "termcolor" "1.4.1"
                "0mappjh3fj3p2nmrg4y7qv94rchwi9mzmgmfflr8p2awdj7lyy86"))

(define rust-thiserror-1.0.69
  (crate-source "thiserror" "1.0.69"
                "0lizjay08agcr5hs9yfzzj6axs53a2rgx070a1dsi3jpkcrzbamn"))

(define rust-thiserror-2.0.18
  (crate-source "thiserror" "2.0.18"
                "1i7vcmw9900bvsmay7mww04ahahab7wmr8s925xc083rpjybb222"))

(define rust-thiserror-impl-1.0.69
  (crate-source "thiserror-impl" "1.0.69"
                "1h84fmn2nai41cxbhk6pqf46bxqq1b344v8yz089w1chzi76rvjg"))

(define rust-thiserror-impl-2.0.18
  (crate-source "thiserror-impl" "2.0.18"
                "1mf1vrbbimj1g6dvhdgzjmn6q09yflz2b92zs1j9n3k7cxzyxi7b"))

(define rust-tiff-0.11.3
  (crate-source "tiff" "0.11.3"
                "0lmw68ic77sixk17r4rl2vsv00rqhja3yj2h9p5bcd9x6krylgxn"))

(define rust-tiny-skia-0.11.4
  (crate-source "tiny-skia" "0.11.4"
                "1aq9gd4qh4418g8v08qzakqqggx8hl66qcianl3k5bjdsja37lc3"))

(define rust-tiny-skia-path-0.11.4
  (crate-source "tiny-skia-path" "0.11.4"
                "14ywbdfakvacl6rxxmzbnycplaxpc6i2linh2yqk0sp8qb07z7lw"))

(define rust-tiny-xlib-0.2.4
  (crate-source "tiny-xlib" "0.2.4"
                "17nqhy48ab7vchxzplqrw2g88mx2zyr38kwr1ipan76hxx5m0903"))

(define rust-tinyvec-1.11.0
  (crate-source "tinyvec" "1.11.0"
                "1wvycrghzmaysnw34kzwnf0mfx6r75045s24r214wnnjadqfcq9y"))

(define rust-tinyvec-macros-0.1.1
  (crate-source "tinyvec_macros" "0.1.1"
                "081gag86208sc3y6sdkshgw3vysm5d34p431dzw0bshz66ncng0z"))

(define rust-tokio-1.50.0
  (crate-source "tokio" "1.50.0"
                "0bc2c5kd57p2xd4l6hagb0bkrp798k5vw0f3xzzwy0sf6ws5xb97"))

(define rust-tokio-macros-2.6.1
  (crate-source "tokio-macros" "2.6.1"
                "172nwz3s7mmh266hb8l5xdnc7v9kqahisppqhinfd75nz3ps4maw"))

(define rust-tokio-stream-0.1.18
  (crate-source "tokio-stream" "0.1.18"
                "0w3cj33605ab58wqd382gnla5pnd9hnr00xgg333np5bka04knij"))

(define rust-toml-datetime-1.1.1+spec-1.1.0
  (crate-source "toml_datetime" "1.1.1+spec-1.1.0"
                "1mws2mkkf46l7inn77azhm0vdwxngv9vsbhbl0ah33p2c9gzcr9i"))

(define rust-toml-edit-0.25.10+spec-1.1.0
  (crate-source "toml_edit" "0.25.10+spec-1.1.0"
                "06rdlg34g1ply2drbp0fr4xypsvdmfay714s75n5w8wy2v51h958"))

(define rust-toml-parser-1.1.2+spec-1.1.0
  (crate-source "toml_parser" "1.1.2+spec-1.1.0"
                "09kmzc55a0j21whm290wlf5a8b18a0qc87a1s8sncrckc6wfkax2"))

(define rust-tracing-0.1.44
  (crate-source "tracing" "0.1.44"
                "006ilqkg1lmfdh3xhg3z762izfwmxcvz0w7m4qx2qajbz9i1drv3"))

(define rust-tracing-attributes-0.1.31
  (crate-source "tracing-attributes" "0.1.31"
                "1np8d77shfvz0n7camx2bsf1qw0zg331lra0hxb4cdwnxjjwz43l"))

(define rust-tracing-core-0.1.36
  (crate-source "tracing-core" "0.1.36"
                "16mpbz6p8vd6j7sf925k9k8wzvm9vdfsjbynbmaxxyq6v7wwm5yv"))

(define rust-transpose-0.2.3
  (crate-source "transpose" "0.2.3"
                "0zp74v7jrjg4jr654dncdj6hqvacicsywyhc62jawgxwhvnimmhs"))

(define rust-ttf-parser-0.25.1
  (crate-source "ttf-parser" "0.25.1"
                "0cbgqglcwwjg3hirwq6xlza54w04mb5x02kf7zx4hrw50xmr1pyj"))

(define rust-typenum-1.19.0
  (crate-source "typenum" "1.19.0"
                "1fw2mpbn2vmqan56j1b3fbpcdg80mz26fm53fs16bq5xcq84hban"))

(define rust-uds-windows-1.2.1
  (crate-source "uds_windows" "1.2.1"
                "0vidqwwfgn8wyzvbxiqil787b4wyqjia50zpdbbjqx7n8wlgpxpj"))

(define rust-unicode-bidi-0.3.18
  (crate-source "unicode-bidi" "0.3.18"
                "1xcxwbsqa24b8vfchhzyyzgj0l6bn51ib5v8j6krha0m77dva72w"))

(define rust-unicode-ident-1.0.24
  (crate-source "unicode-ident" "1.0.24"
                "0xfs8y1g7syl2iykji8zk5hgfi5jw819f5zsrbaxmlzwsly33r76"))

(define rust-unicode-linebreak-0.1.5
  (crate-source "unicode-linebreak" "0.1.5"
                "07spj2hh3daajg335m4wdav6nfkl0f6c0q72lc37blr97hych29v"))

(define rust-unicode-script-0.5.8
  (crate-source "unicode-script" "0.5.8"
                "1vmifpgd0map3frmvhszhl96k82crcry083prv05wii7p45x8fiq"))

(define rust-unicode-segmentation-1.13.2
  (crate-source "unicode-segmentation" "1.13.2"
                "135a26m4a0wj319gcw28j6a5aqvz00jmgwgmcs6szgxjf942facn"))

(define rust-unicode-width-0.2.2
  (crate-source "unicode-width" "0.2.2"
                "0m7jjzlcccw716dy9423xxh0clys8pfpllc5smvfxrzdf66h9b5l"))

(define rust-unicode-xid-0.2.6
  (crate-source "unicode-xid" "0.2.6"
                "0lzqaky89fq0bcrh6jj6bhlz37scfd8c7dsj5dq7y32if56c1hgb"))

(define rust-utf8parse-0.2.2
  (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-uuid-1.23.0
  (crate-source "uuid" "1.23.0"
                "1nbrzkdhwr4clshsks7flc2jq6lavjrsx65hyn63c9dd5vsbdj2s"))

(define rust-v-frame-0.3.9
  (crate-source "v_frame" "0.3.9"
                "1qkvb4ks33zck931vzqckjn36hkngj6l2cwmvfsnlpc7r0kpfsv6"))

(define rust-version-check-0.9.5
  (crate-source "version_check" "0.9.5"
                "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))

(define rust-walkdir-2.5.0
  (crate-source "walkdir" "2.5.0"
                "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))

(define rust-wasi-0.11.1+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.1+wasi-snapshot-preview1"
                "0jx49r7nbkbhyfrfyhz0bm4817yrnxgd3jiwwwfv0zl439jyrwyc"))

(define rust-wasip2-1.0.2+wasi-0.2.9
  (crate-source "wasip2" "1.0.2+wasi-0.2.9"
                "1xdw7v08jpfjdg94sp4lbdgzwa587m5ifpz6fpdnkh02kwizj5wm"))

(define rust-wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06
  (crate-source "wasip3" "0.4.0+wasi-0.3.0-rc-2026-01-06"
                "19dc8p0y2mfrvgk3qw3c3240nfbylv22mvyxz84dqpgai2zzha2l"))

(define rust-wasm-bindgen-0.2.117
  (crate-source "wasm-bindgen" "0.2.117"
                "1c6hi55mq70546hrvrx7wa27sn3yvf04gg6hf8riwn8mnhdzql85"))

(define rust-wasm-bindgen-futures-0.4.67
  (crate-source "wasm-bindgen-futures" "0.4.67"
                "0znqqp9z52s4ckb94crjlbqbfd7i8zvnjpx7s3nhcwjvj3k3sqh3"))

(define rust-wasm-bindgen-macro-0.2.117
  (crate-source "wasm-bindgen-macro" "0.2.117"
                "1gl6gqy60khhyqv354m0kmgk541sass8kzymxim7hi6zbaizkgbz"))

(define rust-wasm-bindgen-macro-support-0.2.117
  (crate-source "wasm-bindgen-macro-support" "0.2.117"
                "1wlza8xdr18cac2wm3ahxdwx1nnqa01m0d3jf3kd9dmsy8z6kafw"))

(define rust-wasm-bindgen-shared-0.2.117
  (crate-source "wasm-bindgen-shared" "0.2.117"
                "0frxrdi1w0cswv8v7n1972hd23nbwm8hr7a2dhdq8bbd59l9l4ir"))

(define rust-wasm-encoder-0.244.0
  (crate-source "wasm-encoder" "0.244.0"
                "06c35kv4h42vk3k51xjz1x6hn3mqwfswycmr6ziky033zvr6a04r"))

(define rust-wasm-metadata-0.244.0
  (crate-source "wasm-metadata" "0.244.0"
                "02f9dhlnryd2l7zf03whlxai5sv26x4spfibjdvc3g9gd8z3a3mv"))

(define rust-wasmparser-0.244.0
  (crate-source "wasmparser" "0.244.0"
                "1zi821hrlsxfhn39nqpmgzc0wk7ax3dv6vrs5cw6kb0v5v3hgf27"))

(define rust-wasmtimer-0.4.3
  (crate-source "wasmtimer" "0.4.3"
                "0jv45z8yvgn6jgqqhmd1rpakk0yhf13gr5s6hhskw0gak5mqsn8w"))

(define rust-wayland-backend-0.3.15
  (crate-source "wayland-backend" "0.3.15"
                "0pbm8j3vv6baqz312biwqfi4qzadbi6nng9v4p3nx4afnlhdsmr8"))

(define rust-wayland-client-0.31.14
  (crate-source "wayland-client" "0.31.14"
                "0i014rcfjgccknnlyfk94fxn4w32l56cpjdmi4qhqsblpfb7qp34"))

(define rust-wayland-csd-frame-0.3.0
  (crate-source "wayland-csd-frame" "0.3.0"
                "0zjcmcqprfzx57hlm741n89ssp4sha5yh5cnmbk2agflvclm0p32"))

(define rust-wayland-cursor-0.31.14
  (crate-source "wayland-cursor" "0.31.14"
                "0kdk7xwj465idk54jf1f24024gdp63wyagca68a176xyh23x2lja"))

(define rust-wayland-protocols-0.32.12
  (crate-source "wayland-protocols" "0.32.12"
                "13rdk2akpdg90v42sjlz7c86541isxgq347772cl5qmd7i98afjn"))

(define rust-wayland-protocols-experimental-20250721.0.1
  (crate-source "wayland-protocols-experimental" "20250721.0.1"
                "1cfbimd2qbbcgv21i3l7kq3pm6lvrjbb7d6pj33sxjld29izi8a0"))

(define rust-wayland-protocols-misc-0.3.12
  (crate-source "wayland-protocols-misc" "0.3.12"
                "1j19dg8h98s153rj2fvbqkghjicdfgjjkr6nvaw0jgpjkrcng5bf"))

(define rust-wayland-protocols-plasma-0.3.12
  (crate-source "wayland-protocols-plasma" "0.3.12"
                "14adi3xgkldbih60705gshlq2lskds5chhsn3znk271cxgqqqv9b"))

(define rust-wayland-protocols-wlr-0.3.12
  (crate-source "wayland-protocols-wlr" "0.3.12"
                "0d424vn2hj27r4gjlshm6hy8fcqysr805jkqdjbwgmrng0pya17b"))

(define rust-wayland-scanner-0.31.10
  (crate-source "wayland-scanner" "0.31.10"
                "0jjbsb04pzz8kqiw0wy2ssqx6dqpy70ixrm3ck1vsvnq1y8llclw"))

(define rust-wayland-sys-0.31.11
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "wayland-sys" "0.31.11"
                "1gp3hlkxx13i55lyyi794vnw9a780z3skx0xhj71zr69xwzv5snq"))

(define rust-web-sys-0.3.94
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "web-sys" "0.3.94"
                "02nxnhv349r2gcy8w71cjj6nimww1g2zy20y8r4hhbxi75z04w6d"))

(define rust-web-time-1.1.0
  (crate-source "web-time" "1.1.0"
                "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))

(define rust-weezl-0.1.12
  (crate-source "weezl" "0.1.12"
                "122a1dhha6cib5az4ihcqlh60ns2bi6rskdv875p94lbvj6wk2m2"))

(define rust-wgpu-27.0.1
  (crate-source "wgpu" "27.0.1"
                "0xvsrmcp862zh3sd6nkr0cbsznna4c3l1hrilzkms4nygjn8prmz"))

(define rust-wgpu-core-27.0.3
  (crate-source "wgpu-core" "27.0.3"
                "1rya571frb73y32iwnhnxada31dk64vzj6b1nabihfsl2pjmv9r7"))

(define rust-wgpu-core-deps-apple-27.0.0
  (crate-source "wgpu-core-deps-apple" "27.0.0"
                "0cyjas0gx6wxjshv3f25p7gvqycnl7ckyphxaqlwgq4visaswwh7"))

(define rust-wgpu-core-deps-emscripten-27.0.0
  (crate-source "wgpu-core-deps-emscripten" "27.0.0"
                "1dd69pd9z8m4a88h7qmkcjr20qmnfhkxn7fqrwz83c4m992c6smh"))

(define rust-wgpu-core-deps-windows-linux-android-27.0.0
  (crate-source "wgpu-core-deps-windows-linux-android" "27.0.0"
                "1hq3ka3mm507fysc3y017hp19bdj8a95mw1086778w8ssqkp06bi"))

(define rust-wgpu-hal-27.0.4
  (crate-source "wgpu-hal" "27.0.4"
                "1khk8gb81izrd9815fdy4ywq1fsczynswwgz9ay9iqbyqmhwn8av"))

(define rust-wgpu-types-27.0.1
  (crate-source "wgpu-types" "27.0.1"
                "1sx5blmyas6k40ilhlrfsy31xcvcf0l1dn9dgxrxp42r756gip5g"))

(define rust-wide-0.7.33
  (crate-source "wide" "0.7.33"
                "00yd2sg83xvfrjjlwndyk49fjx8jlmlrz8byigndig32rf7dmr8c"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-util-0.1.11
  (crate-source "winapi-util" "0.1.11"
                "08hdl7mkll7pz8whg869h58c1r9y7in0w0pk8fm24qc77k0b39y2"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-window-clipboard-0.5.1
  (crate-source "window_clipboard" "0.5.1"
                "0cyph2xr8g9rx24cnh5xrg75v3njc4l4iyski3g2vbsy60k44rfm"))

(define rust-windows-0.58.0
  (crate-source "windows" "0.58.0"
                "1dkjj94b0gn91nn1n22cvm4afsj98f5qrhcl3112v6f4jcfx816x"))

(define rust-windows-0.62.2
  (crate-source "windows" "0.62.2"
                "10457l9ihrbw8j79z2v4plyjxkf6xvb5npd0lqwmkh702gpaszsj"))

(define rust-windows-collections-0.3.2
  (crate-source "windows-collections" "0.3.2"
                "0436rjbkqn3j9m2v2lcmwwk0l3n2r57yvqb7fcy4m8d8y5ddkci3"))

(define rust-windows-core-0.58.0
  (crate-source "windows-core" "0.58.0"
                "16czypy425jzmiys4yb3pwsh7cm6grxn9kjp889iqnf2r17d99kb"))

(define rust-windows-core-0.62.2
  (crate-source "windows-core" "0.62.2"
                "1swxpv1a8qvn3bkxv8cn663238h2jccq35ff3nsj61jdsca3ms5q"))

(define rust-windows-future-0.3.2
  (crate-source "windows-future" "0.3.2"
                "1jq5qs2dwzf6rl60f8gr49z2mifxsrdh4y4yfdws467ya41gkmp1"))

(define rust-windows-implement-0.58.0
  (crate-source "windows-implement" "0.58.0"
                "16spr5z65z21qyv379rv2mb1s5q2i9ibd1p2pkn0dr9qr535pg9b"))

(define rust-windows-implement-0.60.2
  (crate-source "windows-implement" "0.60.2"
                "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5"))

(define rust-windows-interface-0.58.0
  (crate-source "windows-interface" "0.58.0"
                "059mxmfvx3x88q74ms0qlxmj2pnidmr5mzn60hakn7f95m34qg05"))

(define rust-windows-interface-0.59.3
  (crate-source "windows-interface" "0.59.3"
                "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-numerics-0.3.1
  (crate-source "windows-numerics" "0.3.1"
                "09hgbg8pf89r4090yyhh9q29ppi7yyxkgmga9ascshy19a240bkf"))

(define rust-windows-result-0.2.0
  (crate-source "windows-result" "0.2.0"
                "03mf2z1xcy2slhhsm15z24p76qxgm2m74xdjp8bihyag47c4640x"))

(define rust-windows-result-0.4.1
  (crate-source "windows-result" "0.4.1"
                "1d9yhmrmmfqh56zlj751s5wfm9a2aa7az9rd7nn5027nxa4zm0bp"))

(define rust-windows-strings-0.1.0
  (crate-source "windows-strings" "0.1.0"
                "042dxvi3133f7dyi2pgcvknwkikk47k8bddwxbq5s0l6qhjv3nac"))

(define rust-windows-strings-0.5.1
  (crate-source "windows-strings" "0.5.1"
                "14bhng9jqv4fyl7lqjz3az7vzh8pw0w4am49fsqgcz67d67x0dvq"))

(define rust-windows-sys-0.45.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.45.0"
                "1l36bcqm4g89pknfp8r9rl1w4bn017q6a8qlx8viv0xjxzjkna3m"))

(define rust-windows-sys-0.52.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-sys-0.61.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.61.2"
                "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf"))

(define rust-windows-targets-0.42.2
  (crate-source "windows-targets" "0.42.2"
                "0wfhnib2fisxlx8c507dbmh97kgij4r6kcxdi0f9nk6l1k080lcf"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-threading-0.2.1
  (crate-source "windows-threading" "0.2.1"
                "0dsvsy33vxs0153z4n39sqkzx382cjjkrd46rb3z3zfak5dvsj9r"))

(define rust-windows-aarch64-gnullvm-0.42.2
  (crate-source "windows_aarch64_gnullvm" "0.42.2"
                "1y4q0qmvl0lvp7syxvfykafvmwal5hrjb4fmv04bqs0bawc52yjr"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-msvc-0.42.2
  (crate-source "windows_aarch64_msvc" "0.42.2"
                "0hsdikjl5sa1fva5qskpwlxzpc5q9l909fpl1w6yy1hglrj8i3p0"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-i686-gnu-0.42.2
  (crate-source "windows_i686_gnu" "0.42.2"
                "0kx866dfrby88lqs9v1vgmrkk1z6af9lhaghh5maj7d4imyr47f6"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-msvc-0.42.2
  (crate-source "windows_i686_msvc" "0.42.2"
                "0q0h9m2aq1pygc199pa5jgc952qhcnf0zn688454i7v4xjv41n24"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-x86-64-gnu-0.42.2
  (crate-source "windows_x86_64_gnu" "0.42.2"
                "0dnbf2xnp3xrvy8v9mgs3var4zq9v9yh9kv79035rdgyp2w15scd"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnullvm-0.42.2
  (crate-source "windows_x86_64_gnullvm" "0.42.2"
                "18wl9r8qbsl475j39zvawlidp1bsbinliwfymr43fibdld31pm16"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-msvc-0.42.2
  (crate-source "windows_x86_64_msvc" "0.42.2"
                "1w5r0q0yzx827d10dpjza2ww0j8iajqhmb54s735hhaj66imvv4s"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-winit-0.30.13
  (crate-source "winit" "0.30.13"
                "13cpylyvdl066fivncw96pn29y15rhzlqba73sym10wziajmyxd6"))

(define rust-winnow-0.7.15
  (crate-source "winnow" "0.7.15"
                "0i9rkl2rqpbnnxlgs20gmkj3nd0b2k8q55mjmpc2ybb84xwxjyfz"))

(define rust-winnow-1.0.1
  (crate-source "winnow" "1.0.1"
                "1dbji1bwviy08pl74f2qw2m4w9hc4p3vyl3lfj05jdydy59w1nh9"))

(define rust-wit-bindgen-0.51.0
  (crate-source "wit-bindgen" "0.51.0"
                "19fazgch8sq5cvjv3ynhhfh5d5x08jq2pkw8jfb05vbcyqcr496p"))

(define rust-wit-bindgen-core-0.51.0
  (crate-source "wit-bindgen-core" "0.51.0"
                "1p2jszqsqbx8k7y8nwvxg65wqzxjm048ba5phaq8r9iy9ildwqga"))

(define rust-wit-bindgen-rust-0.51.0
  (crate-source "wit-bindgen-rust" "0.51.0"
                "08bzn5fsvkb9x9wyvyx98qglknj2075xk1n7c5jxv15jykh6didp"))

(define rust-wit-bindgen-rust-macro-0.51.0
  (crate-source "wit-bindgen-rust-macro" "0.51.0"
                "0ymizapzv2id89igxsz2n587y2hlfypf6n8kyp68x976fzyrn3qc"))

(define rust-wit-component-0.244.0
  (crate-source "wit-component" "0.244.0"
                "1clwxgsgdns3zj2fqnrjcp8y5gazwfa1k0sy5cbk0fsmx4hflrlx"))

(define rust-wit-parser-0.244.0
  (crate-source "wit-parser" "0.244.0"
                "0dm7avvdxryxd5b02l0g5h6933z1cw5z0d4wynvq2cywq55srj7c"))

(define rust-x11-dl-2.21.0
  (crate-source "x11-dl" "2.21.0"
                "0vsiq62xpcfm0kn9zjw5c9iycvccxl22jya8wnk18lyxzqj5jwrq"))

(define rust-x11rb-0.13.2
  (crate-source "x11rb" "0.13.2"
                "053lvnaw9ycbl791mgwly2hw27q6vqgzrb1y5kz1as52wmdsm4wr"))

(define rust-x11rb-protocol-0.13.2
  (crate-source "x11rb-protocol" "0.13.2"
                "1g81cznbyn522b0fbis0i44wh3adad2vhsz5pzf99waf3sbc4vza"))

(define rust-xcursor-0.3.10
  (crate-source "xcursor" "0.3.10"
                "0awgy98awg4ydcfmynqfcwvl4bnnfcm4i2vvnk2n926a02jy9jdy"))

(define rust-xkbcommon-dl-0.4.2
  (crate-source "xkbcommon-dl" "0.4.2"
                "1iai0r3b5skd9vbr8z5b0qixiz8jblzfm778ddm8ba596a0dwffh"))

(define rust-xkeysym-0.2.1
  (crate-source "xkeysym" "0.2.1"
                "0mksx670cszyd7jln6s7dhkw11hdfv7blwwr3isq98k22ljh1k5r"))

(define rust-xml-rs-0.8.28
  (crate-source "xml-rs" "0.8.28"
                "0grdj7xwbki5zrkalrg8dljyf14y4yj3wrj34sbzqp06i9zk7s1s"))

(define rust-y4m-0.8.0
  (crate-source "y4m" "0.8.0"
                "0j24y2zf60lpxwd7kyg737hqfyqx16y32s0fjyi6fax6w4hlnnks"))

(define rust-yazi-0.2.1
  (crate-source "yazi" "0.2.1"
                "1dgv0dd0329dcbs57z2wj03daz8y1axgprw3pf5yf5jsbcjkh5z0"))

(define rust-zbus-5.14.0
  (crate-source "zbus" "5.14.0"
                "1g305kwnw9f420c6m10i40cjdjm2s31ddpngac5a8hrrpmfzk0na"))

(define rust-zbus-macros-5.14.0
  (crate-source "zbus_macros" "5.14.0"
                "08ljsjl1zhpzdf7hx37yaifi14rvysj354bfqjrc9al4drhpjzl9"))

(define rust-zbus-names-4.3.1
  (crate-source "zbus_names" "4.3.1"
                "03y5f8xwzmk4y5wb4g95a1hl48mxlmhcbwqz62mrnqbqbdnszn7z"))

(define rust-zeno-0.3.3
  (crate-source "zeno" "0.3.3"
                "0915lg3b1qiixizic9kwj2bw42x35baxqvl9dn0m2plkj91drwvd"))

(define rust-zerocopy-0.8.48
  (crate-source "zerocopy" "0.8.48"
                "1sb8plax8jbrsng1jdval7bdhk7hhrx40dz3hwh074k6knzkgm7f"))

(define rust-zerocopy-derive-0.8.48
  (crate-source "zerocopy-derive" "0.8.48"
                "1m5s0g92cxggqc74j83k1priz24k3z93sj5gadppd20p9c4cvqvh"))

(define rust-zmij-1.0.21
  (crate-source "zmij" "1.0.21"
                "1amb5i6gz7yjb0dnmz5y669674pqmwbj44p4yfxfv2ncgvk8x15q"))

(define rust-zune-core-0.5.1
  (crate-source "zune-core" "0.5.1"
                "1ya0zdqxlr5v57791j7bvm408ri2cfx81a4v6z85f560yw3hi2nb"))

(define rust-zune-inflate-0.2.54
  (crate-source "zune-inflate" "0.2.54"
                "00kg24jh3zqa3i6rg6yksnb71bch9yi1casqydl00s7nw8pk7avk"))

(define rust-zune-jpeg-0.5.15
  (crate-source "zune-jpeg" "0.5.15"
                "15kjpn6pywxlwb8w5irfd68x31wi3mb4y1da8bqh7havh5drvg17"))

(define rust-zvariant-5.10.0
  (crate-source "zvariant" "5.10.0"
                "02sls8pi570z1wssl150413x0mcwqhi9ywlliqsbwfwh46djj22p"))

(define rust-zvariant-derive-5.10.0
  (crate-source "zvariant_derive" "5.10.0"
                "0b3mh0kzf6sz7vd5j9gimq86awjcigddh26cz5b6di79xc9b0nav"))

(define rust-zvariant-utils-3.3.0
  (crate-source "zvariant_utils" "3.3.0"
                "1sf5i71in36gc08jhak83pprnkam8gk936cqlq9hzx7q9sk26p7p"))


;; Tabla de lookup: qué crates necesita cada paquete de este canal.
;; Convención moderna de Guix (#:cargo-inputs es deprecado) -- ver
;; guix/build-system/cargo.scm, define-cargo-inputs/cargo-inputs.
(define-cargo-inputs lookup-cargo-inputs
  (librepods => (list
                 rust-ab-glyph-0.2.32
                 rust-ab-glyph-rasterizer-0.1.10
                 rust-adler2-2.0.1
                 rust-aes-0.9.0-rc.4
                 rust-ahash-0.8.12
                 rust-aho-corasick-1.1.4
                 rust-aligned-0.4.3
                 rust-aligned-vec-0.6.4
                 rust-android-activity-0.6.1
                 rust-android-build-0.1.3
                 rust-android-properties-0.2.2
                 rust-android-system-properties-0.1.5
                 rust-anstream-1.0.0
                 rust-anstyle-1.0.14
                 rust-anstyle-parse-1.0.0
                 rust-anstyle-query-1.1.5
                 rust-anstyle-wincon-3.0.11
                 rust-anyhow-1.0.102
                 rust-approx-0.5.1
                 rust-arbitrary-1.4.2
                 rust-arg-enum-proc-macro-0.3.4
                 rust-arrayref-0.3.9
                 rust-arrayvec-0.7.6
                 rust-ash-0.38.0+1.3.281
                 rust-as-raw-xcb-connection-1.0.1
                 rust-as-slice-0.2.1
                 rust-async-broadcast-0.7.2
                 rust-async-channel-2.5.0
                 rust-async-executor-1.14.0
                 rust-async-io-2.6.0
                 rust-async-lock-3.4.2
                 rust-async-process-2.5.0
                 rust-async-recursion-1.1.1
                 rust-async-signal-0.2.13
                 rust-async-task-4.7.1
                 rust-async-trait-0.1.89
                 rust-atomic-waker-1.1.2
                 rust-autocfg-1.5.0
                 rust-av1-grain-0.2.5
                 rust-avif-serialize-0.8.8
                 rust-av-scenechange-0.14.1
                 rust-bit-field-0.10.3
                 rust-bitflags-1.3.2
                 rust-bitflags-2.11.0
                 rust-bit-set-0.8.0
                 rust-bitstream-io-4.9.0
                 rust-bit-vec-0.8.0
                 rust-block-0.1.6
                 rust-block2-0.5.1
                 rust-block2-0.6.2
                 rust-blocking-1.6.2
                 rust-bluer-0.17.4
                 rust-built-0.8.0
                 rust-bumpalo-3.20.2
                 rust-bytemuck-1.25.0
                 rust-bytemuck-derive-1.10.2
                 rust-byteorder-lite-0.1.0
                 rust-bytes-1.11.1
                 rust-calloop-0.13.0
                 rust-calloop-0.14.4
                 rust-calloop-wayland-source-0.3.0
                 rust-calloop-wayland-source-0.4.1
                 rust-cc-1.2.58
                 rust-cesu8-1.1.0
                 rust-cfg-aliases-0.2.1
                 rust-cfg-if-1.0.4
                 rust-cipher-0.5.1
                 rust-clap-4.6.0
                 rust-clap-builder-4.6.0
                 rust-clap-derive-4.6.0
                 rust-clap-lex-1.1.0
                 rust-clipboard-macos-0.1.1
                 rust-clipboard-wayland-0.2.2
                 rust-clipboard-win-5.4.1
                 rust-clipboard-x11-0.4.3
                 rust-codespan-reporting-0.12.0
                 rust-colorchoice-1.0.5
                 rust-color-quant-1.1.0
                 rust-combine-4.6.7
                 rust-concurrent-queue-2.5.0
                 rust-core2-0.4.0
                 rust-core-foundation-0.10.1
                 rust-core-foundation-0.9.4
                 rust-core-foundation-sys-0.8.7
                 rust-core-graphics-0.23.2
                 rust-core-graphics-types-0.1.3
                 rust-core-graphics-types-0.2.0
                 rust-core-maths-0.1.1
                 rust-cosmic-text-0.15.0
                 rust-cpubits-0.1.0
                 rust-cpufeatures-0.2.17
                 rust-crc32fast-1.5.0
                 rust-crossbeam-deque-0.8.6
                 rust-crossbeam-epoch-0.9.18
                 rust-crossbeam-utils-0.8.21
                 rust-crunchy-0.2.4
                 rust-cryoglyph-0.1.0
                 rust-crypto-common-0.2.1
                 rust-ctor-lite-0.1.2
                 rust-cursor-icon-1.2.0
                 rust-custom-debug-0.6.2
                 rust-custom-debug-derive-0.6.2
                 rust-darling-0.20.11
                 rust-darling-core-0.20.11
                 rust-darling-macro-0.20.11
                 rust-dbus-0.9.10
                 rust-dbus-crossroads-0.5.3
                 rust-dbus-tokio-0.7.6
                 rust-dispatch-0.2.0
                 rust-dispatch2-0.3.1
                 rust-displaydoc-0.2.5
                 rust-dlib-0.5.3
                 rust-document-features-0.2.12
                 rust-downcast-rs-1.2.1
                 rust-dpi-0.1.2
                 rust-either-1.15.0
                 rust-endi-1.1.1
                 rust-enumflags2-0.7.12
                 rust-enumflags2-derive-0.7.12
                 rust-env-filter-1.0.1
                 rust-env-logger-0.11.10
                 rust-equator-0.4.2
                 rust-equator-macro-0.4.2
                 rust-equivalent-1.0.2
                 rust-errno-0.3.14
                 rust-error-code-3.3.2
                 rust-etagere-0.2.15
                 rust-euclid-0.22.14
                 rust-event-listener-5.4.1
                 rust-event-listener-strategy-0.5.4
                 rust-exr-1.74.0
                 rust-fastrand-2.3.0
                 rust-fax-0.2.6
                 rust-fax-derive-0.2.0
                 rust-fdeflate-0.3.7
                 rust-find-msvc-tools-0.1.9
                 rust-flate2-1.1.9
                 rust-fnv-1.0.7
                 rust-foldhash-0.1.5
                 rust-foldhash-0.2.0
                 rust-fontconfig-parser-0.5.8
                 rust-fontdb-0.23.0
                 rust-font-types-0.10.1
                 rust-font-types-0.11.1
                 rust-foreign-types-0.5.0
                 rust-foreign-types-macros-0.2.3
                 rust-foreign-types-shared-0.3.1
                 rust-futures-0.3.32
                 rust-futures-channel-0.3.32
                 rust-futures-core-0.3.32
                 rust-futures-executor-0.3.32
                 rust-futures-io-0.3.32
                 rust-futures-lite-2.6.1
                 rust-futures-macro-0.3.32
                 rust-futures-sink-0.3.32
                 rust-futures-task-0.3.32
                 rust-futures-util-0.3.32
                 rust-gethostname-1.1.0
                 rust-getrandom-0.3.4
                 rust-getrandom-0.4.2
                 rust-gif-0.14.1
                 rust-glam-0.14.0
                 rust-glam-0.15.2
                 rust-glam-0.16.0
                 rust-glam-0.17.3
                 rust-glam-0.18.0
                 rust-glam-0.19.0
                 rust-glam-0.20.5
                 rust-glam-0.21.3
                 rust-glam-0.22.0
                 rust-glam-0.23.0
                 rust-glam-0.24.2
                 rust-glam-0.25.0
                 rust-glam-0.27.0
                 rust-glam-0.28.0
                 rust-glam-0.29.3
                 rust-glam-0.30.10
                 rust-glam-0.31.1
                 rust-glam-0.32.1
                 rust-gl-generator-0.14.0
                 rust-glow-0.16.0
                 rust-glutin-wgl-sys-0.6.1
                 rust-gpu-alloc-0.6.0
                 rust-gpu-allocator-0.27.0
                 rust-gpu-alloc-types-0.3.0
                 rust-gpu-descriptor-0.3.2
                 rust-gpu-descriptor-types-0.2.0
                 rust-guillotiere-0.6.2
                 rust-half-2.7.1
                 rust-harfrust-0.3.2
                 rust-hashbrown-0.15.5
                 rust-hashbrown-0.16.1
                 rust-heck-0.5.0
                 rust-hermit-abi-0.5.2
                 rust-hex-0.4.3
                 rust-hexf-parse-0.2.1
                 rust-hybrid-array-0.4.10
                 rust-iced-0.14.0
                 rust-iced-core-0.14.0
                 rust-iced-debug-0.14.0
                 rust-iced-futures-0.14.0
                 rust-iced-graphics-0.14.0
                 rust-iced-program-0.14.0
                 rust-iced-renderer-0.14.0
                 rust-iced-runtime-0.14.0
                 rust-iced-tiny-skia-0.14.0
                 rust-iced-wgpu-0.14.0
                 rust-iced-widget-0.14.2
                 rust-iced-winit-0.14.0
                 rust-id-arena-2.3.0
                 rust-ident-case-1.0.1
                 rust-image-0.25.10
                 rust-imageproc-0.26.1
                 rust-image-webp-0.2.4
                 rust-imgref-1.12.0
                 rust-indexmap-2.13.0
                 rust-inout-0.2.2
                 rust-interpolate-name-0.2.4
                 rust-is-terminal-polyfill-1.70.2
                 rust-itertools-0.14.0
                 rust-itoa-1.0.18
                 rust-jiff-0.2.23
                 rust-jiff-static-0.2.23
                 rust-jni-0.21.1
                 rust-jni-0.22.4
                 rust-jni-macros-0.22.4
                 rust-jni-sys-0.3.1
                 rust-jni-sys-0.4.1
                 rust-jni-sys-macros-0.4.1
                 rust-jobserver-0.1.34
                 rust-js-sys-0.3.94
                 rust-kamadak-exif-0.6.1
                 rust-khronos-api-3.1.0
                 rust-khronos-egl-6.0.0
                 rust-ksni-0.3.3
                 rust-kurbo-0.10.4
                 rust-lazy-static-1.5.0
                 rust-leb128fmt-0.1.0
                 rust-lebe-0.5.3
                 rust-libc-0.2.184
                 rust-libdbus-sys-0.2.7
                 rust-libfuzzer-sys-0.4.12
                 rust-libloading-0.8.9
                 rust-libm-0.2.16
                 rust-libpulse-binding-2.30.1
                 rust-libpulse-sys-1.23.0
                 rust-libredox-0.1.15
                 rust-lilt-0.8.1
                 rust-linebender-resource-handle-0.1.1
                 rust-linux-raw-sys-0.12.1
                 rust-linux-raw-sys-0.4.15
                 rust-litrs-1.0.0
                 rust-lock-api-0.4.14
                 rust-log-0.4.29
                 rust-loop9-0.1.5
                 rust-lru-0.16.3
                 rust-macaddr-1.0.1
                 rust-malloc-buf-0.0.6
                 rust-matrixmultiply-0.3.10
                 rust-maybe-rayon-0.1.1
                 rust-memchr-2.8.0
                 rust-memmap2-0.9.10
                 rust-memoffset-0.9.1
                 rust-metal-0.32.0
                 rust-miniz-oxide-0.8.9
                 rust-mio-1.2.0
                 rust-moxcms-0.8.1
                 rust-mundy-0.2.2
                 rust-mutate-once-0.1.2
                 rust-naga-27.0.3
                 rust-nalgebra-0.34.2
                 rust-ndk-0.9.0
                 rust-ndk-context-0.1.1
                 rust-ndk-sys-0.6.0+11769913
                 rust-new-debug-unreachable-1.0.6
                 rust-nix-0.29.0
                 rust-nom-8.0.0
                 rust-noop-proc-macro-0.3.0
                 rust-num-0.4.3
                 rust-num-bigint-0.4.6
                 rust-num-complex-0.4.6
                 rust-num-derive-0.4.2
                 rust-num-enum-0.7.6
                 rust-num-enum-derive-0.7.6
                 rust-num-integer-0.1.46
                 rust-num-iter-0.1.45
                 rust-num-rational-0.4.2
                 rust-num-traits-0.2.19
                 rust-objc-0.2.7
                 rust-objc2-0.5.2
                 rust-objc2-0.6.4
                 rust-objc2-app-kit-0.2.2
                 rust-objc2-app-kit-0.3.2
                 rust-objc2-cloud-kit-0.2.2
                 rust-objc2-cloud-kit-0.3.2
                 rust-objc2-contacts-0.2.2
                 rust-objc2-core-data-0.2.2
                 rust-objc2-core-data-0.3.2
                 rust-objc2-core-foundation-0.3.2
                 rust-objc2-core-graphics-0.3.2
                 rust-objc2-core-image-0.2.2
                 rust-objc2-core-image-0.3.2
                 rust-objc2-core-location-0.2.2
                 rust-objc2-core-text-0.3.2
                 rust-objc2-core-video-0.3.2
                 rust-objc2-encode-4.1.0
                 rust-objc2-foundation-0.2.2
                 rust-objc2-foundation-0.3.2
                 rust-objc2-io-surface-0.3.2
                 rust-objc2-link-presentation-0.2.2
                 rust-objc2-metal-0.2.2
                 rust-objc2-quartz-core-0.2.2
                 rust-objc2-quartz-core-0.3.2
                 rust-objc2-symbols-0.2.2
                 rust-objc2-ui-kit-0.2.2
                 rust-objc2-uniform-type-identifiers-0.2.2
                 rust-objc2-user-notifications-0.2.2
                 rust-objc-sys-0.3.5
                 rust-once-cell-1.21.4
                 rust-once-cell-polyfill-1.70.2
                 rust-orbclient-0.3.51
                 rust-ordered-float-5.3.0
                 rust-ordered-stream-0.2.0
                 rust-owned-ttf-parser-0.25.1
                 rust-parking-2.2.1
                 rust-parking-lot-0.12.5
                 rust-parking-lot-core-0.9.12
                 rust-paste-1.0.15
                 rust-pastey-0.1.1
                 rust-pastey-0.2.1
                 rust-percent-encoding-2.3.2
                 rust-pin-project-1.1.11
                 rust-pin-project-internal-1.1.11
                 rust-pin-project-lite-0.2.17
                 rust-pin-utils-0.1.0
                 rust-piper-0.2.5
                 rust-pkg-config-0.3.32
                 rust-plain-0.2.3
                 rust-png-0.18.1
                 rust-polling-3.11.0
                 rust-portable-atomic-1.13.1
                 rust-portable-atomic-util-0.2.6
                 rust-ppv-lite86-0.2.21
                 rust-presser-0.3.1
                 rust-prettyplease-0.2.37
                 rust-primal-check-0.3.4
                 rust-proc-macro2-1.0.106
                 rust-proc-macro-crate-3.5.0
                 rust-profiling-1.0.17
                 rust-profiling-procmacros-1.0.17
                 rust-pxfm-0.1.28
                 rust-qoi-0.4.1
                 rust-quick-error-2.0.1
                 rust-quick-xml-0.39.2
                 rust-quote-1.0.45
                 rust-rand-0.9.2
                 rust-rand-chacha-0.9.0
                 rust-rand-core-0.9.5
                 rust-rand-distr-0.5.1
                 rust-range-alloc-0.1.5
                 rust-rangemap-1.7.1
                 rust-rav1e-0.8.1
                 rust-ravif-0.13.0
                 rust-rawpointer-0.2.1
                 rust-raw-window-handle-0.6.2
                 rust-rayon-1.11.0
                 rust-rayon-core-1.13.0
                 rust-read-fonts-0.35.0
                 rust-read-fonts-0.37.0
                 rust-redox-syscall-0.4.1
                 rust-redox-syscall-0.5.18
                 rust-redox-syscall-0.7.3
                 rust-r-efi-5.3.0
                 rust-r-efi-6.0.0
                 rust-regex-1.12.3
                 rust-regex-automata-0.4.14
                 rust-regex-syntax-0.8.10
                 rust-renderdoc-sys-1.1.0
                 rust-rgb-0.8.53
                 rust-roxmltree-0.20.0
                 rust-rustc-hash-1.1.0
                 rust-rustc-hash-2.1.2
                 rust-rustc-version-0.4.1
                 rust-rustdct-0.7.1
                 rust-rustfft-6.4.1
                 rust-rustix-0.38.44
                 rust-rustix-1.1.4
                 rust-rustversion-1.0.22
                 rust-safe-arch-0.7.4
                 rust-same-file-1.0.6
                 rust-scoped-tls-1.0.1
                 rust-scopeguard-1.2.0
                 rust-sctk-adwaita-0.10.1
                 rust-self-cell-1.2.2
                 rust-semver-1.0.27
                 rust-serde-1.0.228
                 rust-serde-core-1.0.228
                 rust-serde-derive-1.0.228
                 rust-serde-json-1.0.149
                 rust-serde-repr-0.1.20
                 rust-shlex-1.3.0
                 rust-signal-hook-registry-1.4.8
                 rust-simba-0.9.1
                 rust-simd-adler32-0.3.9
                 rust-simd-cesu8-1.1.1
                 rust-simd-helpers-0.1.0
                 rust-simdutf8-0.1.5
                 rust-skrifa-0.37.0
                 rust-skrifa-0.40.0
                 rust-slab-0.4.12
                 rust-slotmap-1.1.1
                 rust-smallvec-1.15.1
                 rust-smithay-client-toolkit-0.19.2
                 rust-smithay-client-toolkit-0.20.0
                 rust-smithay-clipboard-0.7.3
                 rust-smol-str-0.2.2
                 rust-socket2-0.6.3
                 rust-softbuffer-0.4.8
                 rust-spirv-0.3.0+sdk-1.3.268.0
                 rust-stable-deref-trait-1.2.1
                 rust-static-assertions-1.1.0
                 rust-strength-reduce-0.2.4
                 rust-strict-num-0.1.1
                 rust-strsim-0.11.1
                 rust-strum-0.26.3
                 rust-strum-macros-0.26.4
                 rust-svg-fmt-0.4.5
                 rust-swash-0.2.7
                 rust-syn-2.0.117
                 rust-synstructure-0.13.2
                 rust-sys-locale-0.3.2
                 rust-tempfile-3.27.0
                 rust-termcolor-1.4.1
                 rust-thiserror-1.0.69
                 rust-thiserror-2.0.18
                 rust-thiserror-impl-1.0.69
                 rust-thiserror-impl-2.0.18
                 rust-tiff-0.11.3
                 rust-tiny-skia-0.11.4
                 rust-tiny-skia-path-0.11.4
                 rust-tinyvec-1.11.0
                 rust-tinyvec-macros-0.1.1
                 rust-tiny-xlib-0.2.4
                 rust-tokio-1.50.0
                 rust-tokio-macros-2.6.1
                 rust-tokio-stream-0.1.18
                 rust-toml-datetime-1.1.1+spec-1.1.0
                 rust-toml-edit-0.25.10+spec-1.1.0
                 rust-toml-parser-1.1.2+spec-1.1.0
                 rust-tracing-0.1.44
                 rust-tracing-attributes-0.1.31
                 rust-tracing-core-0.1.36
                 rust-transpose-0.2.3
                 rust-ttf-parser-0.25.1
                 rust-typenum-1.19.0
                 rust-uds-windows-1.2.1
                 rust-unicode-bidi-0.3.18
                 rust-unicode-ident-1.0.24
                 rust-unicode-linebreak-0.1.5
                 rust-unicode-script-0.5.8
                 rust-unicode-segmentation-1.13.2
                 rust-unicode-width-0.2.2
                 rust-unicode-xid-0.2.6
                 rust-utf8parse-0.2.2
                 rust-uuid-1.23.0
                 rust-version-check-0.9.5
                 rust-v-frame-0.3.9
                 rust-walkdir-2.5.0
                 rust-wasi-0.11.1+wasi-snapshot-preview1
                 rust-wasip2-1.0.2+wasi-0.2.9
                 rust-wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06
                 rust-wasm-bindgen-0.2.117
                 rust-wasm-bindgen-futures-0.4.67
                 rust-wasm-bindgen-macro-0.2.117
                 rust-wasm-bindgen-macro-support-0.2.117
                 rust-wasm-bindgen-shared-0.2.117
                 rust-wasm-encoder-0.244.0
                 rust-wasm-metadata-0.244.0
                 rust-wasmparser-0.244.0
                 rust-wasmtimer-0.4.3
                 rust-wayland-backend-0.3.15
                 rust-wayland-client-0.31.14
                 rust-wayland-csd-frame-0.3.0
                 rust-wayland-cursor-0.31.14
                 rust-wayland-protocols-0.32.12
                 rust-wayland-protocols-experimental-20250721.0.1
                 rust-wayland-protocols-misc-0.3.12
                 rust-wayland-protocols-plasma-0.3.12
                 rust-wayland-protocols-wlr-0.3.12
                 rust-wayland-scanner-0.31.10
                 rust-wayland-sys-0.31.11
                 rust-web-sys-0.3.94
                 rust-web-time-1.1.0
                 rust-weezl-0.1.12
                 rust-wgpu-27.0.1
                 rust-wgpu-core-27.0.3
                 rust-wgpu-core-deps-apple-27.0.0
                 rust-wgpu-core-deps-emscripten-27.0.0
                 rust-wgpu-core-deps-windows-linux-android-27.0.0
                 rust-wgpu-hal-27.0.4
                 rust-wgpu-types-27.0.1
                 rust-wide-0.7.33
                 rust-winapi-0.3.9
                 rust-winapi-i686-pc-windows-gnu-0.4.0
                 rust-winapi-util-0.1.11
                 rust-winapi-x86-64-pc-windows-gnu-0.4.0
                 rust-window-clipboard-0.5.1
                 rust-windows-0.58.0
                 rust-windows-0.62.2
                 rust-windows-aarch64-gnullvm-0.42.2
                 rust-windows-aarch64-gnullvm-0.52.6
                 rust-windows-aarch64-msvc-0.42.2
                 rust-windows-aarch64-msvc-0.52.6
                 rust-windows-collections-0.3.2
                 rust-windows-core-0.58.0
                 rust-windows-core-0.62.2
                 rust-windows-future-0.3.2
                 rust-windows-i686-gnu-0.42.2
                 rust-windows-i686-gnu-0.52.6
                 rust-windows-i686-gnullvm-0.52.6
                 rust-windows-i686-msvc-0.42.2
                 rust-windows-i686-msvc-0.52.6
                 rust-windows-implement-0.58.0
                 rust-windows-implement-0.60.2
                 rust-windows-interface-0.58.0
                 rust-windows-interface-0.59.3
                 rust-windows-link-0.2.1
                 rust-windows-numerics-0.3.1
                 rust-windows-result-0.2.0
                 rust-windows-result-0.4.1
                 rust-windows-strings-0.1.0
                 rust-windows-strings-0.5.1
                 rust-windows-sys-0.45.0
                 rust-windows-sys-0.52.0
                 rust-windows-sys-0.59.0
                 rust-windows-sys-0.61.2
                 rust-windows-targets-0.42.2
                 rust-windows-targets-0.52.6
                 rust-windows-threading-0.2.1
                 rust-windows-x86-64-gnu-0.42.2
                 rust-windows-x86-64-gnu-0.52.6
                 rust-windows-x86-64-gnullvm-0.42.2
                 rust-windows-x86-64-gnullvm-0.52.6
                 rust-windows-x86-64-msvc-0.42.2
                 rust-windows-x86-64-msvc-0.52.6
                 rust-winit-0.30.13
                 rust-winnow-0.7.15
                 rust-winnow-1.0.1
                 rust-wit-bindgen-0.51.0
                 rust-wit-bindgen-core-0.51.0
                 rust-wit-bindgen-rust-0.51.0
                 rust-wit-bindgen-rust-macro-0.51.0
                 rust-wit-component-0.244.0
                 rust-wit-parser-0.244.0
                 rust-x11-dl-2.21.0
                 rust-x11rb-0.13.2
                 rust-x11rb-protocol-0.13.2
                 rust-xcursor-0.3.10
                 rust-xkbcommon-dl-0.4.2
                 rust-xkeysym-0.2.1
                 rust-xml-rs-0.8.28
                 rust-y4m-0.8.0
                 rust-yazi-0.2.1
                 rust-zbus-5.14.0
                 rust-zbus-macros-5.14.0
                 rust-zbus-names-4.3.1
                 rust-zeno-0.3.3
                 rust-zerocopy-0.8.48
                 rust-zerocopy-derive-0.8.48
                 rust-zmij-1.0.21
                 rust-zune-core-0.5.1
                 rust-zune-inflate-0.2.54
                 rust-zune-jpeg-0.5.15
                 rust-zvariant-5.10.0
                 rust-zvariant-derive-5.10.0
                 rust-zvariant-utils-3.3.0
                 )))
