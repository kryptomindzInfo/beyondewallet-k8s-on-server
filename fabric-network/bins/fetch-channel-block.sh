#!/bin/sh
ORDERER_CA=/var/hyperledger/tlsca/tlsca.siliconvalley.com-cert.pem
peer channel fetch 0 ../config/ewalletchannel.block -o $ORDERER_ADDRESS -c ewalletchannel  --tls --cafile $ORDERER_CA