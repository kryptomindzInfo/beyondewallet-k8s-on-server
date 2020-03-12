#!/bin/bash

ORDERER_CA=/var/hyperledger/tlsca/tlsca.siliconvalley.com-cert.pem
peer channel update -f ../config/siliconvalley-peer-update.tx -c ewalletchannel -o $ORDERER_ADDRESS  --tls --cafile $ORDERER_CA

