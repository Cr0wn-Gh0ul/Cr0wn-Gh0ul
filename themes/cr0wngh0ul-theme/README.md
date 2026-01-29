# Custom Hugo Theme - Retro Terminal

A custom Hugo theme combining the best elements of Digio, re-Terminal, and Rusty Typewriter themes. Features a retro terminal aesthetic with ASCII art, warm rust tones, and clean typography.

## Features

- 🎨 **Retro Terminal Design** - Dark theme with ASCII decorations
- 🏷️ **Tag & Category Support** - Organize your content easily
- 📱 **Fully Responsive** - Works on all devices
- ⚡ **Lightweight** - Fast loading with minimal JavaScript
- 🎭 **Custom Shortcodes** - ASCII boxes, terminal commands, status boxes
- 🌗 **Light/Dark Mode** - Configurable color schemes
- 🔍 **Syntax Highlighting** - Beautiful code blocks

## Design Inspiration

This theme combines elements from three excellent Hugo themes:

1. **[Digio](https://github.com/danapixels/digio-theme)** - Pixel art and ASCII aesthetic
2. **[re-Terminal](https://github.com/mirus-ua/hugo-theme-re-terminal)** - Terminal-style design
3. **[Rusty Typewriter](https://github.com/math-queiroz/rusty-typewriter)** - Warm color palette

## Installation

The theme is already set up in this repository. To use it:

```bash
hugo server -D
```

Visit `http://localhost:1313` to see your blog.

## Configuration

Edit [hugo.toml](hugo.toml) to customize your blog:

```toml
[params]
  description = 'Your blog description'
  author = 'Your Name'
  lightMode = false  # Set to true for light mode
  showStatus = true  # Show status box on homepage
  status = '🔨 Building cool stuff... 💻'
  githubRepo = 'https://github.com/yourusername/your-repo'
```

### Menu Configuration

```toml
[menu]
  [[menu.main]]
    name = 'Home'
    url = '/'
    weight = 1
  [[menu.main]]
    name = 'Posts'
    url = '/posts/'
    weight = 2
```

## Creating Content

### New Post

```bash
hugo new posts/my-new-post.md
```

### Post Front Matter

```yaml
---
title: "Post Title"
date: 2026-01-28
draft: false
tags: ["tag1", "tag2"]
categories: ["category"]
author: "Your Name"
---
```

## Custom Shortcodes

### ASCII Box

```markdown
{{< ascii-box >}}
Your highlighted content here
{{< /ascii-box >}}
```

### Terminal Command

```markdown
{{< terminal >}}
$ your command here
{{< /terminal >}}
```

### Status Box

```markdown
{{< status >}}
Currently working on...
{{< /status >}}
```

## Customization

### Colors

Edit CSS variables in [style.css](themes/custom-theme/static/css/style.css):

```css
:root {
    --bg-primary: #1a1a1a;
    --accent-primary: #d4a574;
    --accent-terminal: #4ec9b0;
    /* ... more variables */
}
```

### Fonts

The theme uses monospace fonts by default. You can customize:

```css
:root {
    --font-mono: 'Courier New', 'Courier', monospace;
    --font-sans: 'IBM Plex Mono', 'Fira Code', monospace;
}
```

## Directory Structure

```
themes/custom-theme/
├── layouts/
│   ├── _default/
│   │   ├── baseof.html      # Base template
│   │   ├── list.html        # List pages
│   │   ├── single.html      # Single post
│   │   ├── taxonomy.html    # Tag/category pages
│   │   └── terms.html       # Tag/category list
│   ├── partials/
│   │   ├── header.html      # Site header
│   │   ├── footer.html      # Site footer
│   │   └── scroll-top.html  # Scroll to top button
│   ├── shortcodes/          # Custom shortcodes
│   ├── index.html           # Homepage
│   └── 404.html            # Error page
├── static/
│   └── css/
│       └── style.css        # Main stylesheet
└── theme.toml              # Theme metadata
```

## Building for Production

```bash
hugo --minify
```

The generated site will be in the `public/` directory.

## License

MIT

## Credits

- Inspired by [Digio](https://github.com/danapixels/digio-theme)
- Inspired by [re-Terminal](https://github.com/mirus-ua/hugo-theme-re-terminal)
- Inspired by [Rusty Typewriter](https://github.com/math-queiroz/rusty-typewriter)
