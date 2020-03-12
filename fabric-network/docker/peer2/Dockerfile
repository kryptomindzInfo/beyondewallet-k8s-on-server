#Docker file for setting up the siliconvalley peer
FROM hyperledger/fabric-peer:1.4.3

RUN apt-get update
RUN apt-get -y install golang-go

#1. Create a folder
RUN mkdir -p /var/hyperledger/config

#2. Copy the crypto for peer crypto
# COPY ./config/crypto-config/peerOrganizations/siliconvalley.com/peers/peer1.siliconvalley.com /var/hyperledger/peer1.siliconvalley.com
COPY ./config/crypto-config/peerOrganizations/siliconvalley.com/peers/peer2.siliconvalley.com /var/hyperledger/peer2.siliconvalley.com

#3. Copy the crypto for admin crypto
COPY ./config/crypto-config/peerOrganizations/siliconvalley.com/users /var/hyperledger/users

#4. Copy the anchor peer update tx
COPY ./config/siliconvalley-peer-update.tx /var/hyperledger/config

#5. Copy the channel create tx file
COPY ./config/ewalletchannel.tx  /var/hyperledger/config

#6. Copy the core YAML
COPY ./config/siliconvalley/peer2/core.yaml /var/hyperledger/config

#7. Copy the bins
COPY ./bins /var/hyperledger/bins

#8. Copy the test chaincode
COPY ./ewallet-cc /opt/gopath/src/github.com/src/ewallet-cc

#9. Set the working dir
# RUN  echo "cd /var/hyperledger/bins" >> $HOME/.profile
RUN  echo "cd /var/hyperledger/bins" >> $HOME/.bashrc

#10. Set the context for Admin user
RUN echo ". /var/hyperledger/bins/set-context.sh" >> $HOME/.bashrc


#3. Copy the crypto for admin crypto
COPY ./config/crypto-config/ordererOrganizations/siliconvalley.com/tlsca /var/hyperledger/tlsca

#1. Create a folder
RUN mkdir -p /var/hyperledger/fabric/peer2/tls

#3. Copy the crypto for admin crypto
COPY ./config/crypto-config/peerOrganizations/siliconvalley.com/peers/peer2.siliconvalley.com/tls /var/hyperledger/fabric/tls

#11. Launch the peer
CMD chmod +x /var/hyperledger/bins/*.sh && peer node start
