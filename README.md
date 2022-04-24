# Dotfiles

## New Install Setup
The following steps in this setup will assume a Debian based OS. Proceed accordingly.

You may have to periodically source your `.zshrc` file
```bash
$ source .zshrc
```

### 1. Install the prerequisite applications with `apt`

```bash
sudo apt install curl git neovim zsh
```

### 2. Run the install script
This will do the following
    1. Install [OhMyZsh](https://ohmyz.sh/#install)
    2. Change the current shell from Bash to Zsh
    3. Move the `.zshrc` configuration file to the home directory

```bash
$ chmod +x install.sh && ./install.sh
```

### 3. Generate SSH keys
Run the following command and then add the `.pub` key to respective git remote
```bash
$ ssh-keygen -t ed25519 -C "your_email@example.com"
```

### 4. Install the Hack font
1. Follow the instructions [here](https://github.com/source-foundry/Hack#quick-installation)

### 5. Install Alacritty Terminal
1. Follow the instructions [here](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
2. Copy the configuration file
```bash
$ mkdir ~/.config/alacritty && cp alacritty.yml ~/.config/alacritty
```

### 6. Configure git credentials
```bash
$ git config --global user.email "$EMAIL"
$ git config --global user.name "$FIRSTNAME $LASTNAME"
```

### 7. Install `nvm` Node Version Manager
1. Follow the instructions [here](https://github.com/nvm-sh/nvm#installing-and-updating)
2. Source your `.zshrc` file
3. `nvm install node` will install the latest stable release of NodeJS and npm