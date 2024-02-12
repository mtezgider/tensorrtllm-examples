#!/bin/bash

# Function to check if Git is installed
is_git_installed() {
    if command -v git &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Check if Git is already installed
if is_git_installed; then
    echo "Git is already installed."
    git --version
else
    # Update package lists
    sudo apt update

    # Install Git
    sudo apt install git -y

    # Verify Git installation
    git --version

    echo "Git has been installed successfully."
fi
