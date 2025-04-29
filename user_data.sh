#!/bin/bash
# Оновити систему і встановити Docker та Git
apt update -y
apt install -y docker.io git

# Встановити Docker Compose
apt install -y docker-compose

# Запустити Docker
systemctl start docker
systemctl enable docker

# Клонувати репозиторій Vulhub
git clone https://github.com/vulhub/vulhub.git /opt/vulhub

# Перейти в потрібну папку
cd /opt/vulhub/httpd/ssi-rce

# Запустити вразливий сервіс
docker-compose up -d
