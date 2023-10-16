#!/bin/bash

sudo apt update 
sudo apt install -y nginx

echo "<h2> Hello TFyone</h2>" | sudo tee /var/www/html/index.html