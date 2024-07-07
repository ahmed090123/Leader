#!/bin/bash

# Function to update and upgrade Termux packages
update_packages() {
    echo "Updating and upgrading Termux packages..."
    pkg update && pkg upgrade -y
}

# Function to install essential packages
install_packages() {
    echo "Installing essential packages..."
    pkg install -y wget curl proot tar

    # Set up storage access
    echo "Setting up storage access..."
    termux-setup-storage
}

# Function to download and extract Kali NetHunter rootfs
install_nethunter() {
    echo "Downloading Kali NetHunter rootfs..."
    mkdir -p $HOME/nh_installation
    cd $HOME/nh_installation

    # Download the Kali NetHunter rootfs tarball
    wget https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-full.tar.xz

    # Extract the rootfs
    echo "Extracting Kali NetHunter rootfs..."
    proot --link2symlink tar -xf kalifs-armhf-full.tar.xz

    # Configure the Kali NetHunter environment
    echo "Configuring Kali NetHunter environment..."
    cd kalifs-armhf-full
    ./startkali.sh

    echo "Installation complete! You can now access Kali NetHunter by executing 'startkali' in Termux."
}

# Main script execution
echo "Starting Kali NetHunter installation on Termux..."

update_packages
install_packages
install_nethunter

echo "Kali NetHunter installation finished."
