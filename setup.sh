#!/usr/bin/env bash

set -e

# ==============================
#  Fancy Terraform + Runner Setup
# ==============================

echo "========================================="
echo "   🚀 Azure VM Setup for Terraform & GitHub Actions Runner"
echo "========================================="

sleep 1

# Detect OS
if [ -f /etc/debian_version ]; then
    OS="debian"
elif [ -f /etc/redhat-release ]; then
    OS="redhat"
else
    OS="unknown"
fi

echo "🔍 Detected OS: $OS"
sleep 1

echo "-----------------------------------------"
echo "📦 Installing required packages..."
echo "-----------------------------------------"

if [ "$OS" = "debian" ]; then
    sudo apt update
    sudo apt install -y unzip nodejs npm jq git curl wget
elif [ "$OS" = "redhat" ]; then
    sudo yum install -y unzip jq git curl wget
    # Install Node.js (v20 LTS example)
    curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
    sudo yum install -y nodejs
else
    echo "❌ Unsupported OS. Please install packages manually."
    exit 1
fi

echo "✅ Packages installed!"
sleep 1

echo "-----------------------------------------"
echo "🌍 Installing Terraform..."
echo "-----------------------------------------"

TERRAFORM_VERSION="1.9.8"

curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

echo "✅ Terraform $(terraform -v | head -n1) installed!"
sleep 1

echo "-----------------------------------------"
echo "🎉 Setup Complete!"
echo "-----------------------------------------"

cat << "EOF"
   _____                         __          
  |_   _|                       [  |         
    | |      .--.   _ .--..--.   | | .---.   
    | |   / .'`\ \[ `.-. .-. |  | |/ /__\\  
   _| |_  | \__. | | | | | | |  | || \__.,  
  |_____|  '.__.' [___||__||__][___]'.__.'  

🚀 Your VM is now ready for Terraform + GitHub Actions Runner!
EOF
