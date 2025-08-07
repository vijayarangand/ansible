#!/bin/bash

yum list installed | grep httpd >>/dev/null

if [ $? -eq 0 ]; then

	echo "Httpd Already Installed"

else
	echo "Need to install apache"

	cat /etc/os-release | grep "Amazon Linux" >>/dev/null
	if [ $? -eq 0 ]; then
		yum install httpd -y >>/dev/null
		systemctl enable httpd && systemctl start httpd
	else
		apt install apache2 -y
		systemctl enable httpd && systemctl start httpd
	fi
fi

