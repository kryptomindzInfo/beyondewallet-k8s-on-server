#!/bin/bash
ORDERER_CA=/var/hyperledger/tlsca/tlsca.siliconvalley.com-cert.pem
peer channel create -c ewalletchannel -f ../config/ewalletchannel.tx --outputBlock ../config/ewalletchannel.block -o $ORDERER_ADDRESS --tls --cafile $ORDERER_CA

