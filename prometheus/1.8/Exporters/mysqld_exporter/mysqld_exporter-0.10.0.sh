#!/bin/bash
# Author : Pankaj Yadav
# What does the script do:
#       1. Add user mysqld_exporter
#       2. Download mysqld_exporter-0.10.0 and intall it on local system
#       3. start mysqld_exporter as service
#       4. Perform a "./mysqld_exporter-0.10.0.sh" ->> This should succeed

sudo useradd --no-create-home --shell /bin/false mysqld_exporter
sudo groupadd mysqld_exporter
cd /tmp
curl -LO https://github.com/prometheus/mysqld_exporter/releases/download/v0.10.0/mysqld_exporter-0.10.0.linux-amd64.tar.gz
tar xvf mysqld_exporter-0.10.0.linux-amd64.tar.gz
sudo cp /tmp/mysqld_exporter-0.10.0.linux-amd64/mysqld_exporter /usr/local/bin
sudo chown mysqld_exporter:mysqld_exporter /usr/local/bin/mysqld_exporter
sudo cp /tmp/mysqld_exporter.service /etc/systemd/system/
sudo cp /tmp/.my.cnf /root/
sudo systemctl daemon-reload
sudo systemctl start mysqld_exporter
sudo systemctl status mysqld_exporter
