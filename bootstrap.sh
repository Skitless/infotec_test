#!/bin/bash

apt-get update
apt-get upgrade -y

apt-get install -y \
    git \
    curl \
    wget \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    cmake \
    make \
    gcc \
    g++ \
    unzip \
    ca-certificates \
    software-properties-common \
    apt-transport-https \
    lsb-release \
    gnupg

pip3 install ansible

mkdir -p /home/vagrant/shared
chown -R vagrant:vagrant /home/vagrant/shared

echo "Базовая настройка завершена"