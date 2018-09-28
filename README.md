# Dotfiles

![Warm...warmer...disco.](screenshot.png)

## Install

```sh
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
GITPROFILE=default ansible-playbook -vv --ask-become-pass master.yml
```

## Git Configuration

* Creates a link to [gitignore_global](roles/git/files/gitignore_global) in $HOME
* Creates a link to _my_ (personal) [gitconfig](roles/git/templates/gitconfig.j2) in $HOME

## Package Configuration

### Arch Linux Configuration

* Installs packages from [list backup](roles/packages/files/archfile.txt) with pacman

### Mac Configuration

* Creates a link to [Brewfile](roles/packages/files/Brewfile) in $HOME
* Installs [chunkwm](https://github.com/koekeishiya/chunkwm)
* Installs [skhd](https://github.com/koekeishiya/skhd)
* Installs [Übersicht](https://github.com/felixhageloh/uebersicht)

## Utils Configuration

* Creates a link to [gpg-agent.conf](roles/utils/templates/gpg-agent.conf.j2) in $HOME/.gnupg/gpg-agent.conf
* Installs [fzf](https://github.com/junegunn/fzf) utility
* Creates a link to [htoprc](utils/roles/utils/files/htoprc) in $HOME/.config/htoprc
* Creates a link to [tmux.conf](roles/utils/files/tmux.conf) in $HOME

### ZSH Configuration
* Installs [base16-shell](https://github.com/chriskempson/base16-shell)
* Installs [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
* Installs [geometry](https://github.com/geometry-zsh/geometry)
* Installs [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* Creates a link to [zshrc](roles/utils/files/zshrc) in $HOME

## Vim Configuration

* Installs [dein.vim](https://github.com/Shougo/dein) plugin manager
* Creates a link to [vimrc](roles/vim/files/vimrc) in $HOME
* Creates a link to [init.vim](roles/vim/files/init.vim) in $HOME/.config/nvim
