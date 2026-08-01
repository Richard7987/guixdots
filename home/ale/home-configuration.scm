;;; home-configuration.scm --- Guix Home para ale
;;;
;;; Traducción de /nixdots/home/ale/home.nix. Guix Home es notablemente
;;; menos maduro que home-manager (confirmado en la investigación previa,
;;; ver NOTES.md: "barely any services compared to home-manager" según el
;;; propio blog de Guix) -- lo que en Nix era una opción tipada acá muchas
;;; veces es un dotfile plano vía home-files-service-type. Sin validar
;;; contra Guix real todavía (se agotó el tiempo de esta sesión) -- a
;;; diferencia de graphics/desktop/yubikey.scm, que sí se corrieron contra
;;; `guix system build` real.
;;;
;;; Lo que NO se portó (documentado, no simplemente olvidado):
;;; - oh-my-zsh + Powerlevel10k: solo en canales de terceros (`abbe`,
;;;   `bugchan`), no agregados a channels.scm todavía -- zsh queda con
;;;   syntax-highlighting + autosuggestions + fzf-tab (los 3 SÍ oficiales)
;;;   pero sin el prompt P10k ni los plugins de oh-my-zsh.
;;; - IntelliJ IDEA Ultimate: solo en `small-guix`, versión vieja (~2023.2)
;;;   -- no se agregó, evaluar si vale la pena con esa versión.
;;; - DankMaterialShell: no empaquetado en ningún canal -- instalación
;;;   manual documentada abajo, corriendo sobre el Quickshell oficial de
;;;   `guix`.
;;; - herdr, x-minecraft-launcher, obsidian: ninguno confirmado disponible
;;;   en el canal oficial -- AJUSTAR una vez confirmado (obsidian sí
;;;   apareció en la investigación inicial como disponible vía nonguix,
;;;   agregado abajo).

(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu home services gnupg)
             (gnu home services sound) ; pipewire (Guix Home, NO existe a nivel de sistema)
             (gnu packages)
             (gnu packages tex)          ; texstudio, texlive
             (gnu packages rust-apps)    ; tectonic
             (gnu packages ghostscript)
             (gnu packages libreoffice)
             (gnu packages video)        ; mpv
             (gnu packages version-control) ; git, git-delta
             (gnu packages fonts)
             (gnu packages xdisorg)      ; fzf
             (gnu packages irc)          ; weechat
             (gnu packages admin)        ; btop
             (gnu packages shellutils)   ; pfetch, zsh-syntax-highlighting, zsh-autosuggestions
             (gnu packages shells)       ; zsh, fzf-tab
             (gnu packages gnupg)
             (gnu packages security-token) ; yubikey-manager
             (nongnu packages chrome)      ; obsidian (via nonguix)
             (ale packages librepods)
             (ale packages clamui)
             (ale packages nezzontli-ctl)
             (ale packages slides))

(home-environment
 (packages
  (list
   ;; --- YubiKey / GPG ---
   yubikey-manager
   ;; --- TeX / documentos ---
   tectonic
   texstudio
   texlive-scheme-full
   ghostscript
   libreoffice
   ;; --- multimedia ---
   mpv
   ;; --- terminal / dotfiles ---
   git
   git-delta
   fzf
   fzf-tab
   zsh-syntax-highlighting
   zsh-autosuggestions
   pfetch
   weechat
   btop
   font-jetbrains-mono
   ;; --- apps ---
   obsidian
   ;; --- paquetes personales (ale/packages/*.scm, este mismo canal) ---
   librepods
   clamui
   nezzontli-ctl
   slides))

 (services
  (list
   (service home-zsh-service-type
            (home-zsh-configuration
             (zshrc
              (list (plain-file "zshrc-extra" "\
source ~/.guix-home/profile/share/fzf-tab/fzf-tab.plugin.zsh
source ~/.guix-home/profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.guix-home/profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# yubico: reinicia pcscd + gpg-agent si la YubiKey deja de responder
yubico() {
  sudo herd restart pcscd
  gpgconf --kill gpg-agent
  gpgconf --launch gpg-agent
  gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
}

# vpn up/down: alterna el exit-node de Mullvad a mano
vpn() {
  case \"$1\" in
    up) sudo tailscale set --exit-node=mullvad-exit --exit-node-allow-lan-access=true ;;
    down) sudo tailscale set --exit-node= ;;
    *) echo \"uso: vpn up|down\"; return 1 ;;
  esac
}

pfetch
")))))

   (service home-gpg-agent-service-type
            (home-gpg-agent-configuration
             (ssh-support? #t)
             (default-cache-ttl 600)
             (max-cache-ttl 7200)
             (pinentry-program (file-append pinentry-tty "/bin/pinentry-tty")))) ; AJUSTAR a pinentry-qt si se confirma disponible -- pkgs/home.nix original usaba pinentry-qt (Wayland-friendly)

   (service home-pipewire-service-type) ; wireplumber incluido -- confirmar campos reales del record en la VM antes de aplicar

   ;; git: firma GPG por default -- sin home-git-service-type dedicado
   ;; (confirmado que no existe, ver comentario de arriba), config vía
   ;; dotfile plano.
   (simple-service 'ale-dotfiles
                   home-files-service-type
                   (list `(".config/git/config"
                           ,(plain-file "git-config" "\
[user]
	name = ale
	email = ale_bnes@tuta.com
[commit]
	gpgSign = true
[tag]
	gpgSign = true
[gpg]
	format = openpgp
[core]
	pager = delta
[interactive]
	diffFilter = delta --color-only
[delta]
	navigate = true
	side-by-side = true
	line-numbers = true
	syntax-theme = gruvbox-dark
"))
                         `(".ssh/config"
                           ,(plain-file "ssh-config" "\
Host *
	IdentityAgent /run/user/1000/gnupg/S.gpg-agent.ssh
	ForwardAgent no
	AddKeysToAgent no
"))))))

 ;; DankMaterialShell + Quickshell: PENDIENTE instalación manual, no hay
 ;; paquete Guix (ver NOTES.md). Una vez que Quickshell 0.3.0 esté
 ;; disponible (Guix oficial va en 0.2.1, DMS pide 0.3.0 -- ver
 ;; investigación previa), clonar github.com/AvengeMedia/DankMaterialShell
 ;; en ~/.config/quickshell/dms y lanzarlo desde hyprland.lua igual que
 ;; Noctalia se lanzaba antes (hl.exec_cmd("qs -c dms")).
 )
