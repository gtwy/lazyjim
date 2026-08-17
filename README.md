# lazyjim

After 15 years of using a heavily customized Vim setup, my plugins had fallen out of date. Rather than updating them piecemeal, I decided to switch to Neovim.

I initially tried LazyVim, but found that some of its defaults - like aggressive autocompletion and automatic bracket closures - didn’t suit my workflow. So I wiped my config and rebuilt from scratch using just the `lazy.nvim` plugin manager.

This repo documents my personal Neovim configuration. It's tailored to my preferences, but feel free to explore, use, or suggest improvements.

## 🧰 Tech Stack

This Neovim config is built from scratch using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. It favors a minimalist, scriptable, and fast editing environment without the heavy abstractions of prebuilt frameworks like LazyVim.

### ⚙️ Plugin Manager

- [`folke/lazy.nvim`](https://github.com/folke/lazy.nvim) — minimal, fast, Lua-based plugin manager
  - Bootstrapped automatically on first launch (`init.lua` clones it if missing)
  - Plugin modules are declared in `lua/plugins/`

### 🎨 UI & UX Plugins

| Plugin                          | Purpose                               |
| ------------------------------- | ------------------------------------- |
| `rose-pine/neovim`              | Elegant, dark colorscheme _(default)_ |
| `rebelot/kanagawa.nvim`         | Soft, slate colorscheme               |
| `AlexvZyl/nordic.nvim`          | Light blue colorscheme                |
| `nvim-lualine/lualine.nvim`     | Statusline with icons and theming     |
| `akinsho/bufferline.nvim`       | Visual buffer tabline                 |
| `moll/vim-bbye`                 | `:Bdelete` without closing the window |
| `nvim-tree/nvim-web-devicons`   | Filetype icons                        |
| `folke/which-key.nvim`          | Popup keybinding hints                |
| `echasnovski/mini.icons`        | Optional icon enhancements            |
| `folke/snacks.nvim`             | Scratchpad and Git blame (picker/explorer/notify off) |
| `nvim-telescope/telescope.nvim` | File browser, fuzzy file, finder tool |
| `folke/persistence.nvim`        | Automated session management          |

### 🔤 Syntax & Treesitter

| Plugin                                                    | Purpose                                       |
| --------------------------------------------------------- | --------------------------------------------- |
| `nvim-treesitter/nvim-treesitter`                         | Syntax highlighting via Tree-sitter           |

Treesitter uses the Neovim 0.12 main API (`install` + `vim.treesitter.start`), not the old `configs.setup`.
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

> Formatters can live in Mason and/or `~/.local/bin`. Conform will use whichever is on `$PATH`.

### 🚨 Linting (`nvim-lint`)

Runs on `BufWritePost`, manually triggered via `<leader>ll`

| Filetype      | Linter         |
| ------------- | -------------- |
| Python        | `ruff`         |
| JavaScript/TS | `eslint_d`     |
| Shell         | `shellcheck`   |
| PHP           | `php`          |
| Markdown      | `markdownlint` |
| JSON          | `jsonlint`     |
| Lua           | `luacheck`     |

> Mason's `markdownlint` can crash on Node 18. The system `markdownlint` (e.g. `npm i -g markdownlint-cli`) works.

### 🧱 Developer Tools

| Tool                                 | Description                                                                 |
| ------------------------------------ | --------------------------------------------------------------------------- |
| `Mason`                              | On first launch (after plugins load), installs ruff, black, prettier, eslint_d, stylua, shfmt, php-cs-fixer, sql-formatter, markdownlint, jsonlint, luacheck, and shellcheck. `:Mason` is the UI. `:MasonUpdate` refreshes the registry only; it does not install that list. |
| `Ripgrep`                            | Used by Telescope `live_grep` (`<leader>fg`). Not required by snacks.       |
| `fd` / `fdfind`                      | Speeds up Telescope `find_files`. Ubuntu's `fd-find` package installs `fdfind`, not `fd`. |
| `shellcheck`                         | Shell linter (`sh` filetype). |
| `Git`                                | Used by snacks' Git blame (`<leader>gb`) and Telescope project-root lookup  |
| `luacheck`, `ruff`, `eslint_d`, etc. | Installed via system, Mason, and/or `~/.local/bin`                          |

### 🔧 General Settings

- Leader: space (set in `init.lua`)
- Tabs: 2 spaces, soft tabs, auto/smart indenting enabled
- Mouse: off by default; toggle with `<leader>a`
- Virtual diagnostics: only show for WARN+ (no inline INFO spam)
- Disable auto-comment continuation
- Restore cursor to last position when reopening a file

### ⌨️ Keymaps

| Key              | Action                                              |
| ---------------- | --------------------------------------------------- |
| `<leader>a`      | Toggle mouse                                        |
| `<leader>ll`     | Lint current file                                   |
| `<leader>ff`     | Telescope find files (git root)                     |
| `<leader>fg`     | Telescope live grep (git root; needs ripgrep)       |
| `<leader>e`      | Telescope file browser (current file's directory)   |
| `<leader>E`      | Telescope file browser (git root)                   |
| `<leader>bl`     | Telescope buffers                                   |
| `<leader>fr`     | Telescope recent files                              |
| `<leader>fh`     | Telescope help tags                                 |
| `<leader>lc`     | Telescope commands                                  |
| `<leader>bd`     | `:Bdelete` (vim-bbye; closes buffer, keeps window)  |
| `<Tab>` / `<S-Tab>` | Next / previous buffer (bufferline)              |
| `<leader>ss`     | Open snacks scratchpad                              |
| `<leader>gb`     | Git blame current line (snacks)                     |
| `<leader>ln`     | Toggle absolute line numbers                        |
| `<leader>lr`     | Toggle relative line numbers                        |
| `<leader>qs`     | Restore session for this directory (persistence)    |
| `<leader>ql`     | Restore last session (persistence)                  |
| visual `<` / `>` | Indent / outdent and keep the selection             |

### 🔧 Folder Structure

```text
~/.config/nvim/
├── init.lua            # Entry point, bootstraps lazy + core config
└── lua/
    ├── config/         # keymaps.lua, settings.lua
    └── plugins/        # plugin modules (treesitter, formatting, etc.)
```

## 💾 Installation and Prerequisites

### 🔧 Neovim Installation

Install neovim unstable repo and install from a nightly build. Also includes key packages that will be needed for basic functionality.

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim ripgrep git curl unzip fd-find
```

`ripgrep` is for Telescope live grep. It is not required by snacks (picker/explorer/notify are off).

Ubuntu's `fd-find` package installs the binary as `fdfind`, not `fd`. There is no `fd` symlink.

### 🔗 Aliasing

Added this to my `~/.bashrc`

```bash
# I'll never remember to write n before vim
alias vim='nvim'
alias vi='/usr/bin/vim'
```

You may want to run `which vim` first to see if yours is actually in `/usr/bin/`

### 📦 Lazy.nvim Installation

`init.lua` already bootstraps `lazy.nvim` on first launch if it is missing. A manual clone is optional.

```bash
# Optional: pre-install lazy.nvim yourself
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
rm -rf ~/.local/share/nvim/lazy/lazy.nvim/.git
```

It installs to `~/.local/share/nvim/lazy/lazy.nvim/`

### 🧪 Prerequisites

The following packages enable linting, formatting, and language tooling. There is no apt package named `spellcheck`.

```bash
sudo apt install \
  php-cli \
  php-cs-fixer \
  lua-check \
  nodejs \
  npm \
  python3-pip \
  luarocks \
  shellcheck
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

Many of these same tools (including shellcheck) are also installed by Mason on first launch after plugins load, and/or can be dropped in `~/.local/bin`. Mason's `markdownlint` can crash on Node 18; the system `markdownlint` from `markdownlint-cli` works.

### 🎨 Nerd Fonts (for Ligatures)

Download fonts:

- Monaspice Nerd Font
- FiraCode Nerd Font

[Get them here](https://www.nerdfonts.com/font-downloads)

Extract, right click, `install for all users`

#### Laptop (14" 1440p)

I'm using `Monaspice Neon Nerd Font Mono` 11-point Regular, with antialiasing enabled.

#### Desktop (27" 1440p)

I'm using `Monaspice Neon Nerd Font Mono` 12-point Light, with antialiasing enabled.

### Other

In close second is my second choice, `FiraCode Nerd Font Mono`, which I ran at 11-point regular on both systems.

## 🚀 Install lazyjim

### 📥 Clone Repo

Backup the contents of your existing `.config/nvim` folder if it already exists.

```bash
mkdir -p ~/.config/nvim/
git clone https://github.com/gtwy/lazyjim ~/.config/nvim
```

### ▶️ Start Neovim

On first launch, you'll want to make sure Lazy.nvim installs your plugins, Mason installs required tools, and Treesitter downloads its language parsers.

After plugins load, Mason installs this list if anything is missing: `ruff`, `black`, `prettier`, `eslint_d`, `stylua`, `shfmt`, `php-cs-fixer`, `sql-formatter`, `markdownlint`, `jsonlint`, `luacheck`, and `shellcheck`.

Run the following commands inside neovim

```vim
:Lazy sync
:Mason
:MasonUpdate
:TSUpdate
```

`:Lazy sync` is the valid command (`:Lazy Sync` with a capital S is not). `:Mason` is the UI. `:MasonUpdate` refreshes Mason's registry only; it does not install the list above (there is no `:Mason Update` with a space). After these commands, Mason should start installing the tools (or they appear on the next launch if install is async).

## 📝 Todo

- Add more functionality to which-key (and keymaps in general)
- Add toggleable columns with git info, line numbers
- Find more enhancements to add that don't cause bloat
