#!/bin/bash

# Installing the desired software like apache2 & squid
echo "Installing the required software like apache2 & squid"
apt install -y apache2 squid

# Starting the services of the required software
echo "Starting the services of the required software"
systemctl enable apache2
systemctl enable squid
systemctl start apache2
systemctl start squid
echo "Installation of the desired software completed successfully"

# Starting the configuration of the firewalls
echo "Starting the configuration of the firewalls"
# Configuring the firewall rule using ufw
ufw allow ssh/tcp      # Allowing SSH for remote user connection
ufw allow http         # Allowing HTTP for web servers
ufw allow 'Apache Full'    # Allowing Apache Full for web server
ufw allow 'Squid'      # Allowing Squid for web proxy
ufw --force enable     # Enabling the firewall with forced rules

