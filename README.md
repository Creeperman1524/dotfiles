# dotfiles

A repository full of dotfiles used for my configuration files

## Prerequisites

### GNU Stow

```bash
sudo apt install stow
```

### Packages

TODO: compile a list of packages used

## Usage

First, clone the repository to a folder inside your `$HOME` directory

```bash
git clone <repo> ~
cd ~/.dotfiles
```

Then to create the symlinks, enter the command

```bash
stow .
```

### Already existing files

If an error appears saying symlinks could not be made due to already existing files, run this command instead

```bash
stow --adopt .
```

This will move the conflict files into your `dotfiles/` folder and symlink them from there

## Oops!

If you make a mistake, just use

```bash
stow -D .
```

to unlink all the files
