# Dotfiles
These be all my config files. WIP

## Programs
### [i3](https://i3wm.org/)
A tiling window manager for Linux distros.

### [Rofi](https://github.com/davatorium/rofi)
A dmenu replacement, for launching programs.

### [Polybar](https://github.com/polybar/polybar/wiki)
A highly customizable and extensible status bar.

### [nvim](https://neovim.io/)
Vim but better

### [Alacritty](https://alacritty.org/)
Terminal emulator

### [Kitty](https://sw.kovidgoyal.net/kitty/)
Terminal emulator

---
## New Install Setup
The following steps in this setup will assume a Debian based OS. Proceed accordingly.

You may have to periodically source your `.zshrc` file
```bash
$ source .zshrc
```

### 1. Install the prerequisite applications with `apt`

```bash
sudo apt install curl git zsh
```

### 2. Run the install script
This will do the following
    1. Install [OhMyZsh](https://ohmyz.sh/#install)
    2. Change the current shell from Bash to Zsh
    3. Move the `.zshrc` configuration file to the home directory
		4. Install the kitty terminal
		5. Install neovim
		6. Move configuration files to their respective directories

> sudo is needed for snap install
```bash
$ chmod +x install.sh && sudo ./install.sh
```

### 3. Generate SSH keys
Run the following command and then add the `.pub` key to respective git remote
```bash
$ ssh-keygen -t ed25519 -C "your_email@example.com"
```

### 4. Install the Hack font
1. Follow the instructions [here](https://github.com/source-foundry/Hack#quick-installation)

### 7. Install `nvm` Node Version Manager
1. Follow the instructions [here](https://github.com/nvm-sh/nvm#installing-and-updating)
2. Source your `.zshrc` file
3. `nvm install node` will install the latest stable release of NodeJS and npm
