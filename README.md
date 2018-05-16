# Install

The install script accepts arguments that translate into dotbot configurations, and will synchronously execute all corresponding installations specified. For example, `./install mac vim` will run dotbot installations from `default.conf.yaml`, `mac.conf.yaml`, and `vim.conf.yaml`, in that order.

## Default Configuration

```sh
git clone --recurse-submodules https://github.com/aglorei/dotfiles ~/dotfiles
cd ~/dotfiles
./install
```

* Creates a link to [gitignore_global](default/gitignore_global) in $HOME
* Installs [oh-my-zsh](https://github.com/aglorei/oh-my-zsh)
* Installs [slimzsh](https://github.com/changs/slimzsh)
* Creates a link to [tmux.conf](default/tmux.conf) in $HOME
* Creates a link to [zshrc](default/zshrc) in $HOME
