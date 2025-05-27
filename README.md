# lazyjim

After 15 years of using a heavily customized Vim setup, my plugins had fallen out of date. Rather than updating them piecemeal, I decided to switch to Neovim.

I initially tried LazyVim, but found that some of its defaults - like aggressive autocompletion and automatic bracket closures - didn’t suit my workflow. So I wiped my config and rebuilt from scratch using just the `lazy.nvim` plugin manager.

This repo documents my personal Neovim configuration. It's tailored to my preferences, but feel free to explore, use, or suggest improvements.

## tech stack

This Neovim config is built from scratch using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. It favors a minimalist, scriptable, and fast editing environment without the heavy abstractions of prebuilt frameworks like LazyVim.

### ⚙️ Plugin Manager

- [`folke/lazy.nvim`](https://github.com/folke/lazy.nvim) — minimal, fast, Lua-based plugin manager
  - Bootstrapped automatically on first launch
  - Plugin modules are declared in `lua/plugins/`

### 🎨 UI & UX Plugins

| Plugin                        | Purpose                                                    |
| ----------------------------- | ---------------------------------------------------------- |
| `rose-pine/neovim`            | Elegant colorscheme (dark aesthetic)                       |
| `nvim-lualine/lualine.nvim`   | Statusline with icons and theming                          |
| `akinsho/bufferline.nvim`     | Visual buffer tabline                                      |
| `nvim-tree/nvim-web-devicons` | Filetype icons                                             |
| `folke/which-key.nvim`        | Popup keybinding hints                                     |
| `echasnovski/mini.icons`      | Optional icon enhancements                                 |
| `folke/snacks.nvim`           | Custom file picker, explorer, scratchpad, and Git UI tools |

### 🔤 Syntax & Treesitter

| Plugin                                                    | Purpose                                       |
| --------------------------------------------------------- | --------------------------------------------- |
| `nvim-treesitter/nvim-treesitter`                         | Syntax highlighting via Tree-sitter           |
| `folke/ts-comments.nvim`                                  | Smarter `gc` comments (requires Neovim 0.10+) |
| `numToStr/Comment.nvim` + `nvim-ts-context-commentstring` | Context-aware commenting for JSX/HTML/etc.    |

### 🧼 Code Formatting (`conform.nvim`)

Uses format-on-save and is fully declarative by filetype.

| Filetype                    | Formatter       |
| --------------------------- | --------------- |
| Python                      | `black`         |
| JavaScript/TS               | `prettier`      |
| Shell                       | `shfmt`         |
| PHP                         | `php-cs-fixer`  |
| Lua                         | `stylua`        |
| SQL                         | `sql-formatter` |
| HTML/CSS/JSON/YAML/Markdown | `prettier`      |

> External tools installed via Mason or system packages

### 🚨 Linting (`nvim-lint`)

Runs on `BufWritePost`, manually triggered via `<leader>l`

| Filetype      | Linter         |
| ------------- | -------------- |
| Python        | `ruff`         |
| JavaScript/TS | `eslint_d`     |
| Shell         | `shellcheck`   |
| PHP           | `php`          |
| Markdown      | `markdownlint` |
| JSON          | `jsonlint`     |
| Lua           | `luacheck`     |

### 🧱 Developer Tools

| Tool                                 | Description                                           |
| ------------------------------------ | ----------------------------------------------------- |
| `Mason`                              | Installs formatters/linters (auto-managed on startup) |
| `Ripgrep` + `fd`                     | Required by snacks.nvim for fuzzy finding             |
| `Git`                                | Used by snacks' Git integration (`blame_line`)        |
| `luacheck`, `ruff`, `eslint_d`, etc. | Installed via system or `Mason`                       |

### 🔧 General Settings

- Tabs: 2 spaces, soft tabs, auto/smart indenting enabled
- Mouse: Toggleable via `<leader>m` (default: off)
- Virtual diagnostics: only show for WARN+ (no inline INFO spam)
- Disable auto-comment continuation
- Lint key: `<leader>l`
- File picker: `<leader>ff`
- Grep picker: `<leader>fg`
- Buffer deletion: `<leader>bd`
- Explorer toggle: `<leader>e`
- Scratchpad: `<leader>ss`

### 🔧 General Settings

```text
~/.config/nvim/
├── init.lua# Entry point, bootstraps lazy + core config
└── lua/ ├── config/ # keymaps.lua, settings.lua
└── plugins/ # plugin modules (treesitter, formatting, etc.)
```

## installation and prerequisites

### neovim installation

Install neovim unstable repo and install from a nightly build. Also includes key packages that will be needed for basic functionality.

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim ripgrep fd-find git curl unzip
```

### aliasing

Added this to my `~/.bashrc`

```bash
# I'll never remember to write n before vim
alias vim='nvim'
alias vi='/usr/bin/vim'
```

### lazy.nvim installation

Install `lazy.nvim` plugin manager bare bones.

```bash
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
rm -rf ~/.local/share/nvim/lazy/lazy.nvim/.git
```

It installs to `~/.local/share/nvim/lazy/lazy.nvim/`

### prerequisites

The following packages are needed to enable all functionality in my neovim stack, such as linting, formatting, etc.

```bash
sudo apt install \
  shellcheck \
  php-cli \
  php-cs-fixer \
  lua-check \
  nodejs \
  npm \
  python3-pip \
  luarocks
```

As a user (not sudo or root), install these for linting and formatting python

```bash
pip install black ruff --break-system-packages
```

Install node based formatters and linters

```bash
sudo npm install -g \
  prettier \
  eslint_d \
  jsonlint \
  markdownlint-cli \
  sql-formatter
```

Install luarocks linter

```bash
sudo luarocks install luacheck
```

### nerd fonts (needed for ligatures)

I'm using `FiraCode Nerd Font Mono` 11-point Regular, with antialiasing enabled.

[Download it here](https://www.nerdfonts.com/font-downloads).

## install lazyjim

### clone repo

Backup the contents of your existing `.config/nvim` folder if it already exists.

```bash
mkdir -p ~/.config/nvim/
git clone https://github.com/gtwy/lazyjim ~/.config/nvim
```

### start neovim

On first launch, you'll want to make sure Lazy.nvim installs your plugins, Mason installs required tools, and Treesitter downloads its language parsers.

Run the following commands inside neovim

```
:Lazy Sync
:Mason Update
:TSUpdate
```

## Todo

- Add more functionality to which-key (and keymaps in general)
- Figure out toggleable columns with git info, line numbers
- Document the full tech stack of my neovim configuration on this page
