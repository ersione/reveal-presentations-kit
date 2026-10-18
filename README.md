# reveal-presentations-kit

Three reveal.js presentation themes built from the Ersione design system. Compiled CSS, editable SCSS, example decks and a local reveal.js runtime are included.

## Themes

| Theme | Stylesheet | Presentation |
| --- | --- | --- |
| Ersione Light | `dist/ersione-light.css` | Light surfaces, dark text and blue accents |
| Ersione Dark | `dist/ersione-dark.css` | Navy surfaces, light text and soft blue accents |
| Ersione Mint | `dist/ersione-mint.css` | Pale green background, white cards and deep green accents |

Light and Dark use the design system's blue brand tokens. Mint combines its light surface tokens with green data colors; it is a presentation variant rather than a new design-system brand. See [THEME_SOURCE.md](THEME_SOURCE.md) for the mapping, typography and migration notes.

## Quick start

Copy an example into a sibling folder so its relative asset paths keep working:

```bash
git clone https://github.com/ersione/reveal-presentations-kit.git
cd reveal-presentations-kit
mkdir -p presentations
cp examples/ersione-light-template.html presentations/my-talk.html
```

On Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force presentations
Copy-Item examples/ersione-light-template.html presentations/my-talk.html
```

Open `presentations/my-talk.html` directly, or serve the repository root:

```bash
python3 -m http.server 8000 --bind 127.0.0.1
```

On Windows, use `py -m http.server 8000 --bind 127.0.0.1`. Open `http://127.0.0.1:8000/presentations/my-talk.html` and use the arrow controls or keyboard to move through the slides.

Copying an example into the repository root requires changing `../dist/` and `../vendor/` to `./dist/` and `./vendor/`.

## Examples and theme selection

| Example | Included layouts |
| --- | --- |
| `examples/ersione-light-template.html` | Title with image placeholder, split content, chapter divider |
| `examples/ersione-dark-template.html` | Title, two-column cards, section divider, light slide variant |
| `examples/ersione-mint-template.html` | Title card, overview cards, key idea, next steps |

Each example loads the reveal.js runtime stylesheet before the theme:

```html
<link rel="stylesheet" href="../vendor/reveal.css">
<link rel="stylesheet" href="../dist/ersione-light.css">
```

The themes share layout classes, so an existing deck can switch themes by changing its theme stylesheet. Copying the matching example is the easiest way to start a new deck. Replace image placeholders with your own local images.

## Editing and building

Edit `section` elements to change slide content. No build is needed unless you change SCSS. To rebuild the three checked-in stylesheets:

```bash
./build.sh
```

```powershell
.\build.ps1
```

Both scripts run `npx sass`. Node.js/npm and an available Sass package are required for this step; prepare the compiled CSS before an offline presentation. Check the generated files and slide layouts after rebuilding.

```text
scss/source/ersione-light.scss -> dist/ersione-light.css
scss/source/ersione-dark.scss  -> dist/ersione-dark.css
scss/source/ersione-mint.scss  -> dist/ersione-mint.css
scss/template/_ersione.scss   # shared presentation layouts
```

Presentation options live in each example's `Reveal.initialize(...)` call. The examples use a 1920×1080 canvas, fade transitions, slide numbers and a progress bar. Set `progress: false` to hide the bar.

## Offline use and fonts

The themes make no external font requests. They prefer locally installed Noto Sans KR, with operating-system font fallbacks. Fonts and line breaks may differ across devices. Bring the HTML, `dist/`, `vendor/`, and any images or fonts together, and check on the presentation device without a network connection.

The bundled runtime is reveal.js 5.1.0. This is a minimal kit, not a bundle of every plugin. Code highlighting requires its JavaScript plugin in addition to the included highlight CSS.

## PDF export

Open the presentation over local HTTP with `?print-pdf`, then print from Chrome or Chromium. Check landscape orientation, no margins and background graphics. Inspect the saved PDF for wrapping, clipping and page breaks; browser playback alone does not verify PDF output.

## Structure

```text
reveal-presentations-kit/
  dist/                   # compiled theme CSS
  examples/               # three editable decks
  scss/source/            # semantic colors and typography per theme
  scss/template/          # reveal.js base and shared layouts
  vendor/                 # local reveal.js runtime
  build.sh
  build.ps1
  THEME_SOURCE.md
```

For more reveal.js features, see [the official documentation](https://revealjs.com/).
