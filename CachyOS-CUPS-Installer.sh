#!/bin/bash

# Install, enable, and start CUPS
sudo pacman -S cups
sudo systemctl enable --now cups

# Ask if user wants KDE Plasma print settings integration
while true; do
    # Warning Prompt
    read -rp "Do you want KDE Plasma print settings integration (print-manager and system-config-printer)? [Y/n]: " kdeanswer

    # Default to "y" if the user just presses Enter
    if [[ -z "$kdeanswer" ]]; then
        kdeanswer="y"
    fi

    # Check the user's response
    if [[ "$kdeanswer" == "y" || "$kdeanswer" == "Y" ]]; then
        echo "Installing print-manager and system-config-printer..."
        sudo pacman -S print-manager system-config-printer
        break
    elif [[ "$kdeanswer" == "n" || "$kdeanswer" == "N" ]]; then
        break
    else
        echo 'Invalid response. Please enter "y" for yes or "n" for no.'
    fi
done

# Exit message
echo "Print utilities have been installed."
echo "If you installed the KDE Plasma print settings integrations, then navigate to the printers section in settings."
echo "If you didn't, then you can configure CUPS with the web interface by navigating to http://localhost:631/"
read -rp "Press any key to finish." -n 1