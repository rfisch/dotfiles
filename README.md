# Dotfiles

![Warm...warmer...disco.](screenshot.png)

## Purpose

This repository uses [ansible](https://github.com/ansible/ansible) to install dotfiles and maintain package installations using OS managers. Currently, the default dotfiles configurations and package manifests are my own, and exist for MacOSX and Arch Linux. My sensitive vars files are separated by inventory group and encrypted with [ansible-vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html). The entrypoint playbook that specifies the role order is [local.yml](local.yml).

## Vanilla Usage

### Ansible Playbook

The inventory groups and roles are written in such a way where specifying `--limit localhost` bypasses the reading of vaulted material, providing for a generic configuration of various tools and OS-specific package installations.

```sh
# optional --vault-id id@/path/to/vault-password
# optional --ask-become-pass
ansible-playbook --limit localhost local.yml
```

### Ansible Pull

The [local.yml](local.yml) playbook can also be executed using [ansible-pull](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html#ansible-pull) by using the [pull.yml](pull.yml) playbook, which schedules the ansible-pull execution on a cron schedule, allowing for the upstream changes to propogate to the host in an eventually consistent manner. The underlying cron tool used varies by operating system: Arch Linux will rely on [cronie](https://wiki.archlinux.org/index.php/Cron#Cronie_2), while Mac OSX will use the native launchd function.

```sh
# optional --vault-id id@/path/to/vault-password
# optional --ask-become-pass
ansible-playbook --limit localhost pull.yml
```

### Configurations

#### Mac

* Creates a link to [Brewfile](roles/packages/files/Brewfile) in $HOME
* Installs [chunkwm](https://github.com/koekeishiya/chunkwm)
* Installs [skhd](https://github.com/koekeishiya/skhd)

#### Utilities

* Creates a link to [gpg-agent.conf](roles/utils/templates/gpg-agent.conf.j2) in $HOME/.gnupg/gpg-agent.conf
* Creates a link to [htoprc](utils/roles/utils/files/htoprc) in $HOME/.config/htoprc
* Creates a link to [tmux.conf](roles/utils/files/tmux.conf) in $HOME

#### Shell
* Installs [base16-shell](https://github.com/chriskempson/base16-shell)
* Installs [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
* Installs [geometry](https://github.com/geometry-zsh/geometry)
* Installs [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* Creates a link to [zshrc](roles/utils/templates/zshrc.j2) in $HOME

#### Vim

* Installs [dein.vim](https://github.com/Shougo/dein) plugin manager
* Creates a link to [vimrc](roles/vim/files/vimrc) in $HOME
* Creates a link to [init.vim](roles/vim/files/init.vim) in $HOME/.config/nvim

## Advanced Usage

### Ansible Playbook

For those who would enjoy configuring their workstation ssh configuration and gitconfig files, feel free to fork this repository and make modifications as needed. Under the [default inventory](hosts), you'll note that `aglorei` is an example of how you'll need to setup your inventory and hostnames. The prerequisite requirements are:

1. Ensure that machine hostname (output of `hostname` or `hostname -s`) is added as a host belonging to the group or to a subgroup of `workstation`.
2. If added as a direct child to the `workstation` group, ensure a `host_vars/$(hostname)/main.yml` created. If added to a subgroup of `workstation`, ensure `group_vars/$(subgroup)/main.yml` is created. If needed, add / substitute for `main_vault.yml` variants for vaulted variables.
3. Ensure that all `vault_`-prefixed variables in the [workstation variable manifest](group_vars/workstation/main.yml) is defined in the `main.yml` or `main_vault.yml` file for your hostname or group.

From here, the host variables are picked up by specifying `--limit $(hostname)`:

```sh
# optional --vault-id id@/path/to/vault-password
# optional --ask-become-pass
ansible-playbook --limit $(hostname) local.yml
```

### Ansible Pull

Similarly, you can again reverse the polarity of ansible's mode and setup a cron schedule to apply the configuration using your hostname variables:

```sh
# optional --vault-id id@/path/to/vault-password
# optional --ask-become-pass
ansible-playbook --limit $(hostname) pull.yml
```

### Configurations

#### Git
* Configure [~/.gitconfig](roles/git/templates/gitconfig.j2)
* Configure [~/.gitignore_global](roles/git/files/gitignore_global)

#### SSH
* Configure ~/.ssh/config
* Configure ssh public and private keys with correct file modes
