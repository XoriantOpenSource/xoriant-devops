
# MySQLd exporter 0.10.0
 Author: Pankaj Yadav

--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------

This document describes how to install mysqld_exporter version 0.10.0 on Ubuntu and Red Hat and CentOS.

For this installation, following files are used:

--------------------------------------------------------------------------------------

# Prerequisites: 

--------------------------------------------------------------------------------------
1.  Install MySQL and run below command.

       mysql -u “username” -p (it will prompt for password)
       
       run below commands in  mysql prompt:

     CREATE USER 'mysqld_exporter'@'localhost' IDENTIFIED BY 'your_password'; 
     
     GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'mysqld_exporter'@'localhost' WITH MAX_USER_CONNECTIONS 3;
      
2.  Place the following 3 files  on  below mentioned location on the server : 

    Filename: .my.cnf, mysqld_exporter.service, mysqld_exporter-0.10.0.sh.

    Location: /tmp

3.  Configure MySQL database user name and password information :

    Filename: .my.cnf

    Usage:  this file contains MySQL database user name and password for connecting  to the database. 
        

4.  Configure mysqld_exporter as a daemon in following file:

    Filename: mysqld_exporter.service

    Usage: This file is used  for running  mysqld_exporter as service  in  Linux/Unix

--------------------------------------------------------------------------------------

#   Installation Procedure:

--------------------------------------------------------------------------------------

Follow the sequence of scripts execution as described below:

1 - For package installation & service startup use this script.

Filename: mysqld_exporter-0.10.0.sh

Usage: run command from /tmp folder  "./mysqld_exporter-0.10.0.sh"

Note: mysqld_exporter-0.10.0.sh script automatically installs mysqld_exporter-0.10.0 and runs as  Linux/Unix service.

Prometheus  will start monitoring   MySQL database, Once the IP address of MySQL server  with port 9104  is configured on Prometheus server.
