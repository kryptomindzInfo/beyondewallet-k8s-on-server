#1. Docker file for setting up the Orderer
FROM grafana/grafana:latest

#2. Create the folder for configurations
# RUN mkdir -p /etc/prometheus/

#3. Copy the crypto for orderer
COPY ./explorer/fabric/artifacts/operations/ewallet/ewallet-grafana-dashboard.json /var/lib/grafana/dashboards/mydashboard.json
COPY ./explorer/fabric/artifacts/operations/grafana_conf/provisioning /etc/grafana/provisioning

