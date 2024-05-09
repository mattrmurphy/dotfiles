#!/usr/bin/env bash

EMAIL=""
# Required dependencies
dependencies=(curl git sed awk)

# Prompt for email and set as global git config
echo "Enter your GitHub email: "
read EMAIL

git config --global init.defaultBranch main
if [ "$EMAIL" -ne "" ]; then
    git config --global user.email "$EMAIL"
fi

# Install OhMyZsh and change current shell to Zsh.
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && chsh -s $(which zsh)

# Copy the zshrc config file to the correct location
cp ./zsh/.zshrc ~/.zshrc

# Source the config file
source ~/.zshrc

# Install kitty terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# If on linux OS configure icons and command
if [ "$OSTYPE" == "linux-gnu"* ] && ! command -v kitty &> /dev/null; then
		# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
		# your system-wide PATH)
		ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
		# Place the kitty.desktop file somewhere it can be found by the OS
		cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
		# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
		cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
		# Update the paths to the kitty and its icon in the kitty.desktop file(s)
		sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
		sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
fi

# TODO: Curl neovim and build from source
# Install neovim and brew if on Mac
# if [ "$OSTYPE" == "linux-gnu"* ]; then
# 		sudo snap install nvim --classic
# elif [ "$OSTYPE" == "darwin" ]; then
# 		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 		brew install neovim
# fi

# Copy config files
cp ./nvim/init.lua ~/.config/nvim
cp ./kitty/kitty.conf ~/.config/kitty

# Install the latest version of nvm
most_recent_nvm=$(curl -s https://raw.githubusercontent.com/nvm-sh/nvm/master/package.json | grep '"version":' | awk 'BEGIN { FS = "\"" } ; { print $4 }')
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v$most_recent_nvm/install.sh" | bash

source ~/.zshrc

