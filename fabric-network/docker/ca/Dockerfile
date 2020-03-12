#1. Docker file for setting up the Orderer
FROM hyperledger/fabric-ca:1.4.3

#2. Create the folder for configurations
RUN mkdir -p /var/hyperledger/config

#3. Copy the crypto for orderer
COPY ./config/crypto-config/peerOrganizations/siliconvalley.com/ca/ca.siliconvalley.com-cert.pem /var/hyperledger/fabric-ca-server-config/
COPY ./config/crypto-config/peerOrganizations/siliconvalley.com/ /var/hyperledger/fabric-ca-server/
COPY ./config/crypto-config/peerOrganizations/siliconvalley.com/ca/ca.siliconvalley.com-cert.pem /var/hyperledger/config/

# Position of below line is HARD-CODED to #13 and #14 --- Do NOT CHANGE
COPY ./config/crypto-config/peerOrganizations/siliconvalley.com/ca/6fa48f281c5a2a8c7cecbf0928a39b8cca4f2af16dea399c046866ebca832c42_sk /var/hyperledger/fabric-ca-server-config/
COPY ./config/crypto-config/peerOrganizations/siliconvalley.com/ca/6fa48f281c5a2a8c7cecbf0928a39b8cca4f2af16dea399c046866ebca832c42_sk /var/hyperledger/config/

#6. Launch the Orderer
CMD sh -c 'fabric-ca-server start -b admin:adminpw -d'