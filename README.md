# Install

The install script accepts arguments that translate into dotbot configurations, and will synchronously execute all corresponding installations specified. For example, `./install mac vim` will run dotbot installations from `default.conf.yaml`, `mac.conf.yaml`, and `vim.conf.yaml`, in that order.

## Default Configuration

```sh
git clone --recurse-submodules https://github.com/aglorei/dotfiles ~/dotfiles
cd ~/dotfiles
./install
```

* Init and update dotfile submodules

## Arch Linux Configuration

```sh
./install arch
```

* Installs packages from [list backup](arch/pkglist.txt) with pacman

## Git Configuration

```sh
./install git
```

* Creates a link to [gitignore_global](default/gitignore_global) in $HOME
* Creates a link to _my_ (personal) [gitconfig](default/gitconfig) in $HOME

## Mac Configuration

```sh
./install mac
```

* Creates a link to [Brewfile](mac/Brewfile) in $HOME

## Utils Configuration

```sh
./install utils
```

* Installs [fzf](https://github.com/junegunn/fzf) utility
* Creates a link to [tmux.conf](utils/tmux.conf) in $HOME

## Vim Configuration

```sh
./install vim
```

* Installs [dein.vim](dein) plugin manager
* Creates a link to [vimrc](vim/vimrc) in $HOME
* Creates a link to [init.vim](vim/init.vim) in $HOME/.config/nvim

## Zsh Configuration

```sh
./install zsh
```

* Installs [base16-shell](https://github.com/chriskempson/base16-shell)
* Installs [oh-my-zsh](https://github.com/aglorei/oh-my-zsh)
* Installs [slimzsh](https://github.com/changs/slimzsh)
* Creates a link to [zshrc](zsh/zshrc) in $HOME
