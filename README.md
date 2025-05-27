# lazyjim

after 15 years, my plugins for vim were way dated. rather than updating vim plugins, i've moved to nvim.

my first attempt to do this was with lazyvim, but there were too many things i hated about it, like text completion and auto closures })

so i nuked my `~/.config/nvim` folder and started over with just the lazy.nvim package manager.

this repo exists to document my text editor settings for my own uses, but you are welcome to enjoy it and even critique it if you so choose.

# installation and prerequisites

## neovim installation

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim ripgrep fd-find git curl unzip
```

## lazy.nvim installation

install lazy.nvim plugin manager without any other bloat

```
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
rm -rf ~/.local/share/nvim/lazy/lazy.nvim/.git
```

it installs to `~/.local/share/nvim/lazy/lazy.nvim/`

## prerequisites

will add stuff here
