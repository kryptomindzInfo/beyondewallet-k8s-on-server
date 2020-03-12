#1. Docker file for setting up the Orderer
FROM hyperledger/explorer-db:latest

#2. Create the folder for configurations
RUN mkdir -p /docker-entrypoint-initdb.d/

#3. Copy the crypto for orderer
COPY ./explorer/db/createdb.sh /docker-entrypoint-initdb.d/
