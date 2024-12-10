# .dotfiles

A repository full of dotfiles used for my configuration files.
Cloning this repo will (nearly) replicate all settings and themes I have for my most used apps!

## Prerequisites

### Packages and Programs

There are all the packages necessary to have every program work correctly.

```bash
sudo apt install git neofetch cargo build-essential cmake python3 ripgrep
cargo install eza
sudo mv ~/.cargo/bin/eza /usr/bin
```

#### Alacritty

```bash
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty
```

#### Zsh

```bash
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting
chsh -s $(which zsh)
```

#### Tmux

```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

If tmux is already running, hit Ctrl + A, r. Then hit Ctrl + A, I to install the plugins

#### Node

yeah idk i think i used nvm and then used npm to update everything

#### Neovim

Taken from [here](https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package), using an appimage

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim
sudo npm install --global yarn
```

#### Polybar

```bash
sudo apt install polybar
```

A boostrap script to run the launch script is placed into `~./config/autostart`, this may change depending on distribution

### GNU Stow

GNU Stow is used to manage symlinks of all the dotfiles and configurations. It is recommended to take a backup of existing files to not have them overwritten

```bash
sudo apt install stow
```

## Usage

First, clone the repository to a folder inside your `$HOME` directory

```bash
git clone https://github.com/Creeperman1524/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Then to create the symlinks, enter the command

```bash
stow .
```

This will symlink the files to their correct directories, adding the configurations to all the applications!

> [!TIP]
> It is recommended to run each application to test if the configurations are working correctly

### Already existing files

If an error appears saying symlinks could not be made due to already existing files, run this command instead

```bash
stow --adopt .
```

This will move the conflict files into your `~/.dotfiles` folder and symlink them from there

> [!WARNING]
> This will override the repo's configurations with your own, you may need to run `git restore .` to reset the configurations to the repository's

## Oops!

If you make a mistake, just use this command to unlink all files

```bash
stow -D .
```

> [!CAUTION]
> This will unlink ALL symlinks within your `$HOME` directory, so be mindful of this
