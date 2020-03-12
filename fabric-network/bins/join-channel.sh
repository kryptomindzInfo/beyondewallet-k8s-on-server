#!/bin/bash
peer channel join   -b ../config/ewalletchannel.block -o $ORDERER_ADDRESS

echo 'List of all channels on peer'
peer channel list

