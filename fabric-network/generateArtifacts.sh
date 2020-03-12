#!/bin/bash

#1. Clean up earlier setup
echo    "====>Cleanup the earlier runs"
#./clean-all.sh

#2. Generate the crypto
echo    "====>Generating the crypto"
cd config
cryptogen generate --config=crypto-config.yaml

#3. Generate the genesis
echo    "====>Generating the genesis block"
export FABRIC_CFG_PATH=$PWD
configtxgen -outputBlock  ./orderer/ewalletgenesis.block -channelID ordererchannel  -profile ewalletOrdererGenesis

#4. Generate the channel create tx
echo    "====>Generating the channel create tx"
configtxgen -outputCreateChannelTx  ewalletchannel.tx -channelID ewalletchannel  -profile ewalletChannel


PEER_FABRIC_CFG_PATH=$FABRIC_CFG_PATH

#5. Generate the anchor update siliconvalley
ORG_NAME=SiliconValley
configtxgen -outputAnchorPeersUpdate ./siliconvalley-peer-update.tx   -asOrg $ORG_NAME -channelID ewalletchannel  -profile ewalletChannel

echo "Please update the key name changes starting with _sk whereever required"
echo "You can run init-setup.sh script"
