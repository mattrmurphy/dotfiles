#!/bin/bash

# Install OhMyZsh and change current shell to Zsh.
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && chsh -s $(which zsh)

# Copy the zshrc config file to the correct location
mv ./zsh/.zshrc ~/.zshrc

# Source the config file
source ~/.zshrc

# Add default git branch name and alias
git config --global alias.s status
git config --global init.defaultBranch main