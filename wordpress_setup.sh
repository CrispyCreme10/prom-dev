#!/bin/bash
# A script with all of the commands to setup wordpress on ubuntu
# would recommend doing this in a directory where you want wordpress folder to be created
# Youtube video link: https://www.youtube.com/watch?v=PhNxEZcxXV0
sudo apt update
sudo apt install apache2 -y
sudo apt install mariadb-server mariadb-client -y
sudo systemctl start mariadb
sudo systemctl status mariadb # optional cmd to confirm mariadb is running
sudo mysql_secure_installation
sudo apt install php -y
wget https://wordpress.org/latest.zip
sudo apt install unzip -y # optional if you don't have unzip
unzip latest.zip
cd wordpress
sudo mkdir /var/www/html
sudo cp -r * /var/www/html
cd /var/www/html
sudo rm -rf index.html
sudo apt install php-mysql php-cgi php-cli php-gd -y
sudo systemctl restart apache2
sudo chown -R www-data:www-data /var/www/
ip a
# take ip from previous command (use the ip address from 2: right after inet; i.e. 10.0.2.15)
# and paste into a browser. If you see a list of languages, then php and database are working properly
sudo mysql -u root -p # default pwd is "root"
create database wordpress;
show databases;
create user "wordpress"@"%" identified by "password";
grant all privileges on wordpress.* to "wordpress"@"%";
exit
# now use db credentials from previous steps as you go through the wordpress wizard in your browser
