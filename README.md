# lazyjim

After 15 years of using a heavily customized Vim setup, my plugins had fallen out of date. Rather than updating them piecemeal, I decided to switch to Neovim.

I initially tried LazyVim, but found that some of its defaults - like aggressive autocompletion and automatic bracket closures - didn’t suit my workflow. So I wiped my config and rebuilt from scratch using just the `lazy.nvim` plugin manager.

This repo documents my personal Neovim configuration. It's tailored to my preferences, but feel free to explore, use, or suggest improvements.

## tech stack

(new content goes here)

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
