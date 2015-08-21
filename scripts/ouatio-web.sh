



# Install and enable apache
yum -y install httpd
systemctl start httpd.service
systemctl enable httpd.service

# Let apache make network connections for proxy and other reasons
/usr/sbin/setsebool -P httpd_can_network_connect 1
