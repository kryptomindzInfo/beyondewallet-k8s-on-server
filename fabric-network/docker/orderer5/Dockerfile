#1. Docker file for setting up the Orderer
FROM hyperledger/fabric-orderer:1.4.3

#2. Create the folder for configurations
RUN mkdir -p /var/hyperledger/config
RUN mkdir -p /etc/hyperledger/msp/orderer

#3. Copy the crypto for orderer
COPY ./config/crypto-config/ordererOrganizations/siliconvalley.com/orderers/orderer5.siliconvalley.com /var/hyperledger/orderer.siliconvalley.com

#3. Copy the crypto for orderer
COPY ./config/crypto-config/ordererOrganizations/siliconvalley.com/orderers/orderer5.siliconvalley.com /etc/hyperledger/msp/orderer

#4. Copy the genesis file
COPY ./config/orderer/ewalletgenesis.block  /var/hyperledger/config

#5. Copy the orderer YAML
COPY ./config/orderer/orderer.yaml /var/hyperledger/config


#3. Copy the crypto for orderer
COPY ./config/crypto-config/ordererOrganizations/siliconvalley.com/orderers/orderer5.siliconvalley.com /var/hyperledger/config

#6. Launch the Orderer
CMD orderer 

