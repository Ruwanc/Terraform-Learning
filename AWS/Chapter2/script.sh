#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
hostname > /var/www/html/index.html
sudo systemctl restart apache2
#nohup busybox httpd -f -p ${var.server_port} &