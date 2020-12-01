# pi_node_exporter
Steps to configure Raspberry Pis to use Node Exporter

## There is a script for either Pi0(W) and Pi3/4 that can be run 

(requires SUDO, and RTFS before executing)
Please note, you may want to verify the version of node_exporter on the github site before running, 
as it may be updated before anyone finds this useful.
https://github.com/prometheus/node_exporter

## Steps for Raspberry Pi 0/0W

### Execute the following commands

    wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-armv6.tar.gz
    tar -xzf node_exporter-1.0.1.linux-armv6.tar.gz
    rm node_exporter-1.0.1.linux-armv6.tar.gz
    sudo nano /etc/systemd/system/node_exporter.service

### Paste the following into the node_exporter.service file

    [Unit]
    
    Description=node_exporter
    Wants=network-online.target
    After=network-online.target
    
    [Service]
    
    User=prometheus
    Group=prometheus
    Type=simple
    ExecStart=/home/pi/node_exporter-1.0.1.linux-armv6/node_exporter
    
    [Install]
    
    WantedBy=multi-user.target

### Save/Exit and execute the following commands

    sudo useradd -m prometheus
    sudo systemctl daemon-reload
    sudo systemctl start node_exporter
    sudo systemctl status node_exporter
    sudo systemctl enable node_exporter

## Steps for Raspberry Pi 3/4

### Execute the following commands

    wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-armv7.tar.gz
    tar -xzf node_exporter-1.0.1.linux-armv7.tar.gz
    rm node_exporter-1.0.1.linux-armv7.tar.gz
    sudo nano /etc/systemd/system/node_exporter.service

### Paste the following into the node_exporter.service file

    [Unit]
    
    Description=node_exporter
    Wants=network-online.target
    After=network-online.target
    
    [Service]
    
    User=prometheus
    Group=prometheus
    Type=simple
    ExecStart=/home/pi/node_exporter-1.0.1.linux-armv7/node_exporter
    
    [Install]
    
    WantedBy=multi-user.target

### Save/Exit and execute the following commands

    sudo useradd -m prometheus
    sudo systemctl daemon-reload
    sudo systemctl start node_exporter
    sudo systemctl status node_exporter
    sudo systemctl enable node_exporter


## This information was built using info from:
https://geekflare.com/prometheus-grafana-setup-for-linux/amp/
