#!/usr/bin/env bash

EMAIL=""

# Prompt for email and set as global git config
echo "Enter your GitHub email: "
read EMAIL

echo "Installing required dependencies"
if [ "$OSTYPE" == "linux-gnu"* ]; then
    sudo apt update
    sudo apt install curl git sed awk -y
elif [ "$OSTYPE" == "darwin"* ]; then
    if ! command -v brew &> /dev/null; then
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew bundle install --file="./Brewfile"
fi

echo "Setting up global git config"
git config --global init.defaultBranch main
if [ "$EMAIL" -ne "" ]; then
    git config --global user.email "$EMAIL"
fi

if [ "$OSTYPE" == "linux-gnu"* ] && ! command --version zsh &> /dev/null; then
    echo "Installing Zsh"
    # Install zsh, MacOS comes with Zsh as the default shell
    sudo apt install zsh -y
fi

echo "Installing OhMyZsh and changing default shell to Zsh"
# Install OhMyZsh and change current shell to Zsh.
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && chsh -s $(which zsh)

echo "Configuring Zsh"
cp ./zsh/.zshrc ~/.zshrc

# Source the config file
source ~/.zshrc

echo "Installing Kitty terminal"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# If on linux OS configure icons and command
if [ "$OSTYPE" == "linux-gnu"* ] && ! command -v kitty &> /dev/null; then
    echo "Configuring Kitty for Linux"
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

# Neovim install if on linux. It's already listed as a dependency in the Brewfile for MacOS
if [ "$OSTYPE" == "linux-gnu"* ]; then
    echo "Building and installing Neovim from source"
    # Neovim build dependencies
    sudo apt install ninja-build gettext cmake unzip build-essential -y
    git clone https://github.com/neovim/neovim
    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install && ..
fi

echo "Installing Node Version Manager (NVM)"
# Install the latest version of nvm
most_recent_nvm=$(curl -s https://raw.githubusercontent.com/nvm-sh/nvm/master/package.json | grep '"version":' | awk 'BEGIN { FS = "\"" } ; { print $4 }')
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v$most_recent_nvm/install.sh" | bash

echo "Installing additional tools"

if [ "$OSTYPE" == "linux-gnu"* ]; then
    sudo apt install fzf jq pandoc ripgrep tmux hugo -y
fi

# TODO: Programatically do this
# Copy config files
# Perhaps symlink them to this config instead of copying
cp ./nvim/init.lua ~/.config/nvim
cp ./kitty/kitty.conf ~/.config/kitty

source ~/.zshrc

