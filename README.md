# 🧠 nvim-crao

A modern, modular Neovim configuration powered by [lazy.nvim](https://github.com/folke/lazy.nvim). Built for developers who want a fast and elegant IDE-like setup with support for LSP, Rust, Python, JS/TS, and more.

![screenshot](./assets/screenshot.png) <!-- Optional -->

---

## ✨ Features

- 🧠 LSP support (Rust, Python, TypeScript, etc.)
- 🧱 Modular Lua structure
- 🎨 Theming with Ayu / Gruvbox
- 🔍 Telescope fuzzy finder
- 🌲 File explorer via `nvim-tree`
- 🧩 Plugin management with `lazy.nvim`
- 🪄 Statusline and UI tweaks

---

## 📁 Folder Structure

```bash
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── keymaps.lua
    │   ├── options.lua
    │   └── plugins.lua
    ├── lsp
    │   ├── null-ls.lua
    │   ├── python.lua
    │   ├── rust.lua
    │   └── tsserver.lua
    └── ui
        ├── statusline.lua
        └── theme.lua
````

---

## 🚀 Installation

```bash
git clone https://github.com/your-username/nvim-crao ~/.config/nvim
nvim
```

Neovim will auto-install `lazy.nvim` and sync plugins on first launch.

---

## 📦 Requirements

* [Neovim >= 0.11.0](https://github.com/neovim/neovim/releases)
* [ripgrep](https://github.com/BurntSushi/ripgrep) for Telescope
* [rust-analyzer](https://rust-analyzer.github.io/) for Rust LSP
* Optional: Nerd Font (e.g. JetBrainsMono Nerd Font)

---

## 🛠️ Customization

Tweak your keymaps in `lua/core/keymaps.lua`, plugin list in `core/plugins.lua`, and LSP settings per language in `lua/lsp/`.

---

## 📸 Screenshots

.......

---

## 🧙 Author

Made with love by [Crao](https://github.com/your-username)

---

## 📜 License

MIT
