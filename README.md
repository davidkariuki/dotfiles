# .files

Personal configuration for **Omarchy (Arch Linux)** and **macOS**.

## Installation

```sh
git clone https://github.com/davidkariuki/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
./install.sh
```

Or run individual steps:

```sh
./install.sh packages
./install.sh link
./install.sh configure
```

`./install.sh unlink` removes the symlinks again. Existing real files are backed up to `*.bak` before linking.

