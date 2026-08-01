# Notas de la evaluación/migración NixOS → Guix

Contexto y decisiones detrás de este intento de migración, para no perder
el hilo entre sesiones. Origen: `/nixdots`, la config NixOS real en uso hoy
en esta misma laptop (Acer Nitro AN515-54, Intel UHD 630 + Nvidia GTX 1050).

## Objetivo

Reemplazar NixOS por Guix System como daily driver real en esta PC (no solo
una prueba en VM). Investigación exhaustiva hecha antes de escribir nada,
a pedido explícito del usuario.

## Bloqueadores identificados y su resolución

1. **Driver Nvidia legacy 580 (Pascal)**: ✅ resuelto. Está empaquetado y es
   el *default* de nonguix, versión idéntica (580.173.02) a la que ya se usa.

2. **PRIME sync**: no existe como mecanismo declarativo en Guix/nonguix
   (solo *offload*). Pero se descubrió algo importante verificando el
   sistema real: **`prime.sync.enable` ya es un no-op en NixOS hoy**, porque
   la NixOS Wiki confirma que PRIME sync/reverse-sync son X11-only y no
   funcionan bajo Wayland -- y esta laptop corre Hyprland (Wayland puro).
   Confirmado en vivo: `nvidia-smi` muestra la GPU en 0% de uso con la
   sesión Wayland activa. Es decir, ya se está en modo "Intel maneja el
   desktop" de facto -- replicar esto con PRIME offload puro en Guix NO es
   downgrade.

3. **Bug de compositor en HDMI** (motivo original para elegir sync):
   confirmado con hardware real de esta laptop (`lspci`, `/sys/class/drm`)
   que `HDMI-A-1` está cableado físicamente **directo a la Nvidia**
   (card0, PCI 01:00.0) -- no pasa por la Intel. El bug documentado de
   "reverse-PRIME" nace del cruce de buffers entre GPUs; con el HDMI nativo
   de la propia Nvidia ese mecanismo no se invoca. Hyprland/wlroots
   soportan declarar ambas GPUs vía `AQ_DRM_DEVICES` (backend Aquamarine) --
   hay que declarar explícitamente la Nvidia ahí o la salida HDMI se
   congela, no es automático.
   **Plan**: PRIME offload puro para `eDP-1` (interna, cableada a Intel) +
   Nvidia nativa sin PRIME para `HDMI-A-1` vía `AQ_DRM_DEVICES`.
   "Usar siempre la Nvidia" para TODO (ignorando la Intel) NO es posible:
   `eDP-1` está físicamente en el bus de la Intel, este equipo es muxless
   (sin mux switch de hardware, confirmado -- los Acer Nitro AN515 de esta
   generación 2019 no lo tienen).

4. **Noctalia**: viable vía el canal propio del proyecto upstream
   (`noctalia.scm` en la raíz de noctalia-dev/noctalia, mejor mantenido que
   los canales de terceros Rosenthal/Panther), pero es rolling-release
   (sigue HEAD de main) y `noctalia-greeter` no existe empaquetado en
   ningún lado. **Decisión del usuario**: no usar Noctalia. Alternativa
   elegida: **DankMaterialShell (DMS)** sobre **Quickshell** (el motor real,
   oficial en el canal `guix`, sin fork). DMS no depende de un fork propio
   de Quickshell (a diferencia de Noctalia y de caelestia-shell, que exige
   `quickshell-git` bleeding-edge -- verificado en su propio README:
   "this has to be the git version, not the latest tagged version", y
   confirmado que no existe `quickshell-git` en ningún canal indexado).
   DMS trae tema Gruvbox Material de fábrica y greeter propio
   (`dms-greeter`), pero DMS mismo no está empaquetado en Guix -- instalar
   manualmente.

5. **Hyprland**: confirmado contra el código fuente real de Guix (git
   savannah, `gnu/packages/window-management.scm`) que la versión actual es
   **0.55.4** -- exactamente la misma que usa hoy NixOS y contra la que está
   escrito `hyprland.lua` completo (API `hl.dsp.*`, gestos, etc.). Debería
   portar con cambios mínimos.

6. **Tailscale**: viable. `tailscale-service-type` mantenido en varios
   canales (umanwizard/guix-tailscale compila desde fuente; Rosenthal con
   uso real reportado en producción). El oneshot de reintentos para fijar
   el exit-node de Mullvad y el sudoers granular (`security.sudo.extraRules`
   no tiene equivalente -- Guix usa un `plain-file` con el contenido crudo
   de `/etc/sudoers`) hay que escribirlos a mano en Scheme/Shepherd --
   trabajo real pero acotado (~medio día).

## Paquetes personales (ale/packages/*.scm)

Traducción de `/nixdots/pkgs/*.nix` + los flakes propios (psysonic,
nezzontli-ctl, slides). Dificultad real MUY dispar entre casos -- una
evaluación general inicial (sin ver manifests reales) subestimó slides y
psysonic:

| Paquete | Estado | Notas |
|---|---|---|
| `nezzontli-ctl` | Escrito completo (`nezzontli-ctl.scm`) | 3 de 6 deps Python faltaban en Guix (cowsay, textual-image, flatlatex) -- las 3 son triviales, empaquetadas ahí mismo |
| `clamui` | Escrito completo (`clamui.scm`) | El caso más mecánico -- las 10 dependencias YA están en el canal oficial `guix`, sin faltantes |
| `slides` | Esqueleto escrito, NO compila todavía (`slides.scm`) | Depende del ecosistema `charm.land/*/v2` (bubbletea/lipgloss/bubbles/wish/log v2) -- NO está en Guix (solo las v1 viejas, incompatibles). Camino real: `guix import go -r --pin-versions <módulo>@<versión>` por cada uno, pendiente de correr con Guix real |
| `librepods` | Esqueleto escrito, NO compila todavía (`librepods.scm`) | 577 crates en su Cargo.lock -- imposible escribir a mano. Camino real: `guix import crate -r --lockfile=Cargo.lock librepods` con Guix real. Wrapping de libs runtime (vulkan/wayland/xkbcommon) SÍ resuelto en el .scm (dlopen, no lo agarra validate-runpath) |
| `psysonic` | NO escrito, ver `packages/PENDIENTES.md` | Mucho más grande de lo estimado: Tauri 2 + 6 crates propios + pila de audio pesada (symphonia/rodio/rusqlite bundled) + frontend React 19/Vite completo. `rusqlite` con feature `bundled` choca con la política de unbundling de Guix. Semanas, no días |
| `x-minecraft-launcher` | NO escrito, pendiente manual | Sin equivalente a `appimageTools` en Guix. Instalación manual del AppImage, igual que ya aceptaron para LibrePods-viejo en la config Nix actual |

**Ninguno de los `sha256` puestos en los .scm de arriba es real** -- son
placeholders explícitos (`AJUSTAR`), porque esta sesión corre en NixOS sin
Guix instalado, sin forma de correr `guix download`/`guix hash` de verdad.
Hay que recalcularlos en la VM antes de intentar construir cualquiera de
estos paquetes.

## Pendiente

- Levantar la VM QEMU (imagen QCOW2 precompilada de Guix 1.5.0) para poder
  correr `guix download`, `guix import crate/go`, y probar de verdad
  Quickshell+DMS.
- Escribir `config.scm` (sistema) y `home-configuration.scm` (Guix Home)
  reales, cubriendo lo que sí mapea directo: base, red, YubiKey/pcscd,
  Bluetooth, zram, Btrfs, Hyprland+AQ_DRM_DEVICES, Tailscale, TeX/
  LibreOffice, fuentes, etc.
- Terminar los `.scm` de slides/librepods/psysonic una vez con Guix real
  disponible para correr los importadores.
- Escribir el greeter (`greetd` + algo, ya que ni noctalia-greeter ni
  dms-greeter están empaquetados -- dms-greeter habría que instalarlo a
  mano igual que DMS).
