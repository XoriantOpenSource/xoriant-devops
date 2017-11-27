# Node exporter 0.15.1
 Author: Pankaj Yadav

--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------

This document describes how to install node_exporter version 0.15.1 on Ubuntu and Red Hat and CentOS.

For this installation, following files are used:

--------------------------------------------------------------------------------------

# Prerequisites: 

--------------------------------------------------------------------------------------

1.  Place the following 2 files  on  below mentioned location on the server:

     Filename: node_exporter.service, node_exporter-0.15.1.sh.

     Location: /tmp

2.  Configure node_exporter as a daemon in following file:

     Filename: node_exporter.service

     Usage: This file is used  for running  node_exporter as service  in  Linux/Unix

--------------------------------------------------------------------------------------

#   Installation Procedure:

--------------------------------------------------------------------------------------

Follow the sequence of scripts execution as described below:

1.  For package installation & service startup use this script.

     Filename: node_exporter-0.15.1.sh

     Usage: run command from /tmp folder  "./node_exporter-0.15.1.sh"

Note: node_exporter-0.15.1.sh script automatically installs node_exporter-0.15.1.sh and runs as  Linux/Unix service.

Prometheus  will start monitoring the Node, Once the IP address of Node server with port 9100  is configured on Prometheus server.
