#!/bin/sh

# Function to check if Git LFS is installed
is_git_lfs_installed() {
    if command -v git-lfs >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Check if Git LFS is already installed
if is_git_lfs_installed; then
    echo "Git LFS is already installed."
    git-lfs --version
else
    # Install Git LFS
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sh
    apt-get install git-lfs -y

    # Verify Git LFS installation
    git-lfs --version

    echo "Git LFS has been installed successfully."
fi
