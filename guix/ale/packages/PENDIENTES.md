# Paquetes pendientes (no escritos como .scm todavía)

## psysonic (Tauri 2 + React 19) — más grande de lo estimado inicialmente

Cargo.toml y package.json reales fetched en vivo (2026-07-31). Esto es
sustancialmente más grande que un "side project" chico:

- **Rust**: workspace con 6 crates internos propios (`psysonic-core`,
  `-analysis`, `-audio`, `-library`, `-syncfs`, `-integration`) + Tauri 2
  completo (tray-icon, protocol-asset, specta/tauri-specta para bindings
  TS) + una pila de audio pesada: `symphonia` (con casi todos los formatos:
  flac/mp3/aac/alac/isomp4/vorbis/ogg/wav/adpcm), `rodio`, `souvlaki`,
  `ebur128`, `biquad`, `ringbuf`, `discord-rich-presence`, `lofty`, `id3`,
  `rusqlite` con **feature `bundled`** (vendoriza el C de SQLite dentro del
  crate -- esto es exactamente lo que la política de "unbundling" de Guix
  suele rechazar; hay `sqlite` ya empaquetado en Guix, la ruta correcta
  sería usar el feature no-bundled y linkear contra el paquete del sistema,
  no algo mecánico). En Linux además `webkit2gtk` 2.0 + `zbus`.
- **Frontend**: React 19, Vite, ~15 fuentes variables `@fontsource-variable`,
  `@tanstack/react-virtual`, `i18next`, y la lista seguía cortada al momento
  de este fetch (no se relevó completa). El ecosistema de paquetes npm en
  Guix es, confirmado en la ronda de investigación anterior, el eslabón más
  débil (sin equivalente maduro a `buildNpmPackage`/`fetchNpmDeps`) -- la
  ruta realista es vendorizar el `dist/` ya buildeado (con Node/npm fuera
  del sandbox de Guix, en otra máquina o contenedor) en vez de intentar que
  Guix compile el frontend desde cero.

**Veredicto**: no se escribió un `.scm` en esta ronda -- el árbol de crates
(no relevado en tamaño exacto, pero dado el alcance de Tauri+symphonia+
rusqlite, con precedente de LibrePods en 577 crates, es razonable esperar
un orden de magnitud similar o mayor) más el problema real de rusqlite
`bundled` más el frontend npm hacen que esto sea un proyecto de **semanas**,
no de días -- mismo orden que x-minecraft-launcher, no el caso "mecánico"
que sugería la evaluación general inicial sin ver el Cargo.toml/package.json
reales. Camino recomendado cuando se aborde: `guix import crate -r
--lockfile=Cargo.lock psysonic` para el árbol Rust (igual que LibrePods),
resolver `rusqlite` a la variante no-bundled a mano, y vendorizar el
frontend ya buildeado en vez de pelear con el import de npm.

## x-minecraft-launcher (AppImage/Electron)

Ya evaluado en la ronda de investigación de dificultad: Guix no tiene
ningún equivalente a `appimageTools` de nixpkgs. `run-appimage-on-guix`
(codeberg.org/kabouik/run-appimage-on-guix) es un script imperativo, no
integrable a un paquete Guix reproducible sin construir esa infraestructura
de cero (parchear rutas de decenas de libs de Electron/Chromium a mano).

**Veredicto**: no vale la pena intentarlo ahora. Instalación manual fuera
del gestor de paquetes (descargar el AppImage oficial, correrlo con
`guix shell --emulate-fhs` o `run-appimage-on-guix`), igual de manual que
hoy es LibrePods-AppImage-viejo en la config Nix actual (ver NOTES.md de
/nixdots, sección LibrePods) -- mismo patrón de "pendiente manual del
usuario, no automatizable" que ya aceptaron ahí para otro caso.
