# Dotfiles

## Ansible

If you want to use localhost you need to install `ansible`:

```bash
sudo dnf install epel-release
sudo /usr/bin/crb enable
sudo dnf install ansible
```

Sometimes the version of the collections bundled with the default installation
will be too old, but we can update them:

```bash
ansible-community --version
ansible-galaxy collection install community.general
```

Ansible can be used to configure the development environment on a new machine.

```bash
ansible-playbook main.yml --user kyle --ask-become-pass -i 192.168.1.58,
```

```bash
# install neovim
ansible-playbook \
    ansible/playbooks/neovim.yml \
    --user kyle \
    --ask-pass \
    --ask-become-pass \
    -i ansible/inventory.yml
```

## Applying Changes

The dotfiles are managed by GNU Stow, this allows for all of the dotfiles to be
centrally managed then simply symbolically linked into the correct locations.

To apply all of the dotfiles in this repository you can run the following
command:

```bash
stow -t ~ */
stow -t ~ {alacritty,bash,i3,nvim,scripts,tmux,xrandr,zellij,git}
```

We need to set the target directory to `~` as `stow` will be default use the
parent directory. The `*/` path is used to specify only the directories in the
root the repository, this excludes the `README.md` for example.


## Fonts

Some of the plugins used by Neovim require fonts that have certain glyphs,
these are not installed by default. The [Nerd Fonts Repository](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip)
has a good selection of fonts.

```bash
# Move into the fonts directory.
cd ~/.local/share/fonts

# After copying the font zip into the fonts directory, unzip it, and delete the
# old zip.
unzip JetBrainsMono.zip && rm JetBrainsMono.zip 

# Update the fonts.
fc-cache -fv
```
