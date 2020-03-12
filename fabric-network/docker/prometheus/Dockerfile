#1. Docker file for setting up the Orderer
FROM prom/prometheus:latest

#2. Create the folder for configurations
RUN mkdir -p /etc/prometheus/

#3. Copy the crypto for orderer
COPY ./explorer/fabric/artifacts/operations/ewallet/prometheus.yml /etc/prometheus/prometheus.yml


