#!/bin/bash
# Author : Pankaj Yadav
# What does the script do:
#       1. Add users prometheus and node_exporter.
#       2. Download prometheus-2.0 and intall it on local system.
#       3. Dowmload node_exporter-0.15.1 and install it.
#       4. Start node exporter as service.
#       5. Start prometheus-2.0 as service.
#       6. Perform a "./Prometheus-2.0.sh" ->> This should succeed.

sudo useradd  prometheus
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo groupadd prometheus
sudo mkdir /home/prometheus/
sudo chown prometheus:prometheus /home/prometheus/
cd /home/prometheus/
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz
tar xvf prometheus-2.0.0.linux-amd64.tar.gz
sudo cp /tmp/prometheus-2.0.yml  /home/prometheus/prometheus-2.0.0.linux-amd64/
sudo cp /tmp/prometheus.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
sudo systemctl status prometheus
curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.15.1/node_exporter-0.15.1.linux-amd64.tar.gz
tar xvf node_exporter-0.15.1.linux-amd64.tar.gz
sudo cp /home/prometheus/node_exporter-0.15.1.linux-amd64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
sudo cp /tmp/node_exporter.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl status node_exporter
