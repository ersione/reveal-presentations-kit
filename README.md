# reveal-presentations-kit

Standalone reveal.js themes and example decks for fast, offline presentations.

## Themes

| Theme | File | Direction | Best For |
|-------|------|-----------|----------|
| **Obsidian Wave** | `dist/obsidian-wave.css` | Dark geometric, high contrast, blue/red accents | Strategy briefs, technical talks, executive summaries |
| **Atlas Blue** | `dist/atlas-blue.css` | Clean white editorial layout with blue gradients | Corporate decks, planning reviews, photo-led narratives |
| **Mint Pop** | `dist/mint-pop.css` | Bright pastel mint, rounded cards, playful Korean typography | Onboarding, welcome sessions, lightweight workshops |

## Quick Start

Copy one of the example files and open it in a browser:

```bash
cp examples/obsidian-wave-template.html my-presentation.html
cp examples/atlas-blue-template.html my-presentation.html
cp examples/mint-pop-template.html my-presentation.html
```

For PDF export, open the deck with `?print-pdf`, then print from Chrome using landscape, no margins, and background graphics enabled.

## Reveal Options

Each example uses reveal.js configuration near the bottom of the HTML file. The progress bar is enabled in all examples and can be toggled with:

```javascript
Reveal.initialize({
  progress: true // set false to hide the progress bar
});
```

Each theme styles the progress bar as a thin top strip using its own accent colors.

## Examples

| File | Description |
|------|-------------|
| `examples/obsidian-wave-template.html` | Dark geometric presentation sample |
| `examples/atlas-blue-template.html` | White/blue editorial presentation sample |
| `examples/mint-pop-template.html` | Pastel welcome-party presentation sample |

## Build

The checked-in CSS in `dist/` is ready to use. Rebuild only if you edit files under `scss/source/`.

```bash
./build.sh
```

On Windows PowerShell:

```powershell
.\build.ps1
```

This compiles:

```text
scss/source/obsidian-wave.scss -> dist/obsidian-wave.css
scss/source/atlas-blue.scss    -> dist/atlas-blue.css
scss/source/mint-pop.scss      -> dist/mint-pop.css
```

## Structure

```text
reveal-presentations-kit/
├── build.ps1
├── build.sh
├── dist/
│   ├── atlas-blue.css
│   ├── mint-pop.css
│   └── obsidian-wave.css
├── examples/
│   ├── atlas-blue-template.html
│   ├── mint-pop-template.html
│   └── obsidian-wave-template.html
├── scss/
│   ├── source/
│   │   ├── atlas-blue.scss
│   │   ├── mint-pop.scss
│   │   └── obsidian-wave.scss
│   └── template/
└── vendor/
    ├── reveal.css
    ├── reveal.js
    └── plugin/highlight/
```

## Notes

This kit bundles a minimal reveal.js runtime so decks can be opened directly from disk. For advanced reveal.js features, see the official documentation at <https://revealjs.com/>.
