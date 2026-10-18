# Ersione presentation themes

Source: `ersione-design-system/tokens/tokens.css` (local snapshot, 2026-10-19).

- Light (`ersione-light.css`): blue / light semantic tokens.
- Dark (`ersione-dark.css`): blue / dark semantic tokens.
- Mint (`ersione-mint.css`): light semantic tokens, with `data-salary-tint` as background and `data-salary` as accent. Mint is a presentation variant, not an additional design-system brand.

Surface, text, muted, line and accent colors come from the source tokens. Cards use the design-system 16px radius; larger panels use 20px; labels use pill radii. Presentation typography and spacing scale up for a 1920×1080 canvas. Noto Sans KR is preferred if installed, with local system fallbacks; no remote fonts are required.

The canonical theme names and files are Ersione Light (`ersione-light`), Ersione Dark (`ersione-dark`) and Ersione Mint (`ersione-mint`). Existing layout classes remain supported. The Mint example uses neutral presentation content; the reveal.js runtime is unchanged.

## Migration

| Previous name | New name | New stylesheet |
| --- | --- | --- |
| Atlas Blue | Ersione Light | `dist/ersione-light.css` |
| Obsidian Wave | Ersione Dark | `dist/ersione-dark.css` |
| Mint Pop | Ersione Mint | `dist/ersione-mint.css` |

Old stylesheet and example filenames have been removed. Update HTML stylesheet links and any scripts that refer to the former SCSS or example paths. Reveal.js runtime files and presentation initialization do not need to change.

## Color mapping

| Role | Light | Dark | Mint |
| --- | --- | --- | --- |
| Background | `#f6f8fc` | `#101620` | `#e6f4f0` |
| Surface | `#ffffff` | `#192231` | `#ffffff` |
| Text | `#182235` | `#edf2fa` | `#182235` |
| Muted text | `#526178` | `#acb9cd` | `#526178` |
| Border | `#e1e7f0` | `#344258` | `#e1e7f0` |
| Accent | `#2563eb` | `#93b4ff` | `#146b65` |

These are copied semantic token values, not a runtime dependency on the design-system repository. To adopt later token changes, review the source token values, update the theme SCSS and rebuild all three stylesheets. Shared presentation layouts live in `scss/template/_ersione.scss`.
