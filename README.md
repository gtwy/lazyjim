# lazyjim

After 15 years of using a heavily customized Vim setup, my plugins had fallen out of date. Rather than updating them piecemeal, I decided to switch to Neovim.

I initially tried LazyVim, but found that some of its defaults - like aggressive autocompletion and automatic bracket closures - didn’t suit my workflow. So I wiped my config and rebuilt from scratch using just the `lazy.nvim` plugin manager.

This repo documents my personal Neovim configuration. It's tailored to my preferences, but feel free to explore, use, or suggest improvements.

# installation and prerequisites

## neovim installation

Install neovim unstable repo and install from a nightly build.

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim ripgrep fd-find git curl unzip
```

## lazy.nvim installation

Install `lazy.nvim` plugin manager bare bones.

```bash
mkdir -p ~/.config/nvim/
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
rm -rf ~/.local/share/nvim/lazy/lazy.nvim/.git
```

It installs to `~/.local/share/nvim/lazy/lazy.nvim/`

## prerequisites

will add stuff here
