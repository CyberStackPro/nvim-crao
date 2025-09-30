````markdown
# 🧠 nvim-crao

A modern, modular Neovim configuration powered by [lazy.nvim](https://github.com/folke/lazy.nvim).  
Built for developers who want a fast and elegant IDE-like setup with support for LSP, Rust, Python, JS/TS, C, and more.

![screenshot](./assets/screenshot.png) 
---

## ✨ Features

- 🧠 Full LSP support (Rust, Python, TypeScript, C, etc.)
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
    │   ├── keymaps.lua
    │   ├── options.lua
    │   └── plugins.lua
    ├── lsp
    │   ├── c.lua
    │   ├── null-ls.lua
    │   ├── python.lua
    │   ├── rust.lua
    │   └── tsserver.lua
    └── ui
        ├── statusline.lua
        └── theme.lua
````

---

## 🚀 Installation

```bash
git clone https://github.com/CyberStackPro/nvim-crao ~/.config/nvim
cd ~/.config/nvim
./install.sh
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

Tweak your keymaps in `lua/core/keymaps.lua`,
plugin list in `core/plugins.lua`,
and language-specific LSP settings in `lua/lsp/`.

---

## 📸 Screenshots

(Add your screenshots here for better showcase)

---

## 🧙 Author

Made with love by [Crao](https://github.com/CyberStackPro)

---

## 📜 License

MIT

```

