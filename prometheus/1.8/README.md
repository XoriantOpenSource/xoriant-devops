# Prometheus 1.8 
Prometheus Version: 1.8
Author: Pankaj Yadav

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

This document describe how to install Prometheus version 1.8 on Ubuntu and Red Hat.
For this installation, following files are used:

--------------------------------------------------------------------------------------
#Prerequisites: 
--------------------------------------------------------------------------------------
1 . Place the following 4 files  as below mentioned location on the server:
	Filename: prometheus-1.8.yml,prometheus.service,node_exporter.service,prometheus-1.8.sh
	Location: /tmp

2 - Configure application in the following file:
	Filename:prometheus-1.8.yml
	Usage:  this file contain configuration of Prometheus 

3 - Configure Prometheus as a daemon in following file:
	Filename: prometheus.service
	Usage: This file is used for Prometheus as service of Linux/Unix

4 - Configure node_exporter as a daemon in following file:
	Filename: node_exporter.service
	Usage: This file is used for node_exporter as service of Linux/Unix
--------------------------------------------------------------------------------------
#Installation Procedure:
--------------------------------------------------------------------------------------
Follow the sequence of scripts execution as described below:

1 - For package installation & service startup use this script.
	Filename: prometheus-1.8.sh
	Usage: run ./prometheus-1.8.sh


Note: Prometheus-1.8.sh script automatically install Prometheus-1.8 and node_exporter 0.15 and run as  Linux/Unix services 

