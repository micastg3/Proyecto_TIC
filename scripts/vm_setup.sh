#!/bin/bash
echo "?? Setting up environment for benchmarking..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip sysbench docker.io git curl procps
pip3 install --upgrade pip
pip3 install jupyter matplotlib psutil
sudo usermod -aG docker $USER
echo "? Setup complete! Please restart your VM for Docker permissions to take effect."
echo "?? To start Jupyter, run: jupyter notebook"
