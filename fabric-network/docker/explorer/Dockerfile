#1. Docker file for setting up the Orderer
FROM hyperledger/explorer:latest

#2. Create the folder for configurations
RUN mkdir -p /docker-entrypoint-initdb.d/

#3. Copy the crypto for orderer
COPY ./explorer/fabric/config.json /opt/explorer/app/platform/fabric/config.json
COPY ./explorer/fabric/connection-profile/ewallet-network.json /opt/explorer/app/platform/fabric/connection-profile/ewallet-network.json
COPY ./explorer/crypto-config /opt/crypto
COPY ./explorer/swagger.json /opt/explorer/swagger.json

# CMD sh -c "sleep 16&& node /opt/explorer/main.js && tail -f /dev/null"
