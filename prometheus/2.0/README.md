#   Prometheus 2.0
#   Author: Pankaj Yadav
________________________________________
________________________________________
This document describe how to install Prometheus version 2.0 on Ubuntu and Red Hat and Centos
For this installation, following files are used:
________________________________________
#   Prerequisites: 
________________________________________
1 . Place the following 4 files  as below mentioned location on the server:
Filename: prometheus-2.0.yml,prometheus.service,node_exporter.service,prometheus-2.0.sh
Location: /tmp
2 - Configure application in the following file:
Filename:prometheus-2.0.yml
Usage:  this file contain configuration of Prometheus 
3 - Configure Prometheus as a daemon in following file:
Filename: prometheus.service
Usage: This file is used for Prometheus as service of Linux/Unix
4 - Configure node_exporter as a daemon in following file:
Filename: node_exporter.service
Usage: This file is used for node_exporter as service of Linux/Unix
________________________________________
#  Installation Procedure:
________________________________________
Follow the sequence of scripts execution as described below:
1 - For package installation & service startup use this script.
Filename: prometheus-2.0.sh
Usage: run command from /tmp folder "./prometheus-2.0.sh"
Note: Prometheus-2.0.sh script automatically install Prometheus-2.0 and node_exporter 0.15.1 and run as  Linux/Unix services 
