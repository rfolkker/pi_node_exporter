#!/bin/sh
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-armv6.tar.gz
tar -xzf node_exporter-1.0.1.linux-armv6.tar.gz
rm node_exporter-1.0.1.linux-armv6.tar.gz

echo >/etc/systemd/system/node_exporter.service
echo [Unit]>>/etc/systemd/system/node_exporter.service
echo >>/etc/systemd/system/node_exporter.service
echo Description=node_exporter>>/etc/systemd/system/node_exporter.service
echo Wants=network-online.target>>/etc/systemd/system/node_exporter.service
echo After=network-online.target>>/etc/systemd/system/node_exporter.service
echo >>/etc/systemd/system/node_exporter.service
echo [Service]>>/etc/systemd/system/node_exporter.service
echo >>/etc/systemd/system/node_exporter.service
echo User=prometheus>>/etc/systemd/system/node_exporter.service
echo Group=prometheus>>/etc/systemd/system/node_exporter.service
echo Type=simple>>/etc/systemd/system/node_exporter.service
echo ExecStart=/home/pi/node_exporter-1.0.1.linux-armv6/node_exporter>>/etc/systemd/system/node_exporter.service
echo >>/etc/systemd/system/node_exporter.service
echo [Install]>>/etc/systemd/system/node_exporter.service
echo >>/etc/systemd/system/node_exporter.service
echo WantedBy=multi-user.target>>/etc/systemd/system/node_exporter.service

useradd -m prometheus

systemctl daemon-reload
systemctl start node_exporter
systemctl status node_exporter
systemctl enable node_exporter
