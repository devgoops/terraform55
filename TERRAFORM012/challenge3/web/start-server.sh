#!/bin/bash

sudo apt update

sudo apt install nginx -y 

echo "<h2> Hello Modulos LAB</h2>" | sudo tee /var/www/html/index.html