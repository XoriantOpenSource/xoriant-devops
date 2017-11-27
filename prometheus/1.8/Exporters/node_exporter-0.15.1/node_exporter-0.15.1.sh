#!/bin/bash
# Author : Pankaj Yadav
# What does the script do:
#       1. Add users prometheus and node_exporter.
#       2. Dowmload node_exporter-0.15.1 and install it.
#       3. Start node exporter as service.
#       4. Perform a "./node_exporter-0.15.1.sh" ->> This should succeed.

sudo useradd --no-create-home --shell /bin/false node_exporter
sudo groupadd node_exporter
sudo cd /tmp
curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.15.1/node_exporter-0.15.1.linux-amd64.tar.gz
tar xvf node_exporter-0.15.1.linux-amd64.tar.gz
sudo cp /tmp/node_exporter-0.15.1.linux-amd64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
sudo cp /tmp/node_exporter.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl status node_exporter
