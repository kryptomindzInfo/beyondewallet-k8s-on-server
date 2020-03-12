#!/bin/bash
export CC_CONSTRUCTOR='{"Args":[]}'
export CC_NAME="ewallet-app"
export CC_PATH="ewallet-cc"
export CC_VERSION="1.1"
export CC_CHANNEL_ID="ewalletchannel"

export ORDERER_CA=/var/hyperledger/tlsca/tlsca.siliconvalley.com-cert.pem

function    usage {
    echo  "Usage: ./chaincode.sh    install | instantiate "
    echo  "       ./chaincode.sh    invoke | query  Function Arguments"
    echo  "Functions  -  createWallet > walletID, Balance, Remarks"
    echo  "              rechargeWallet > walletID, Amount, Remarks"
    echo  "              transferBtwWallets > fromWalletID, toWalletID, Amount, Remarks"
    echo  "              disburseWallet > walletID, Amount, Remarks"
    echo  "              showBalance > walletID"
    echo  "              getHistoryForWallet > walletID"
    echo  "Installs the GoLang CC to specified Organization"
}

function join_by { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }

OPERATION=$1
A=( "$@" )
ARGS=$(join_by '","' ${A[@]:1})

# Invoke the "peer chain code" command using the operation
case $OPERATION in
    "install")
              peer chaincode install  -n $CC_NAME -p $CC_PATH -v $CC_VERSION
              peer chaincode list --installed -C ewalletchannel
        ;;
    "instantiate")
              peer chaincode instantiate -o siliconvalley-orderer-clusterip:30750 -C $CC_CHANNEL_ID -n $CC_NAME  -v $CC_VERSION -c $CC_CONSTRUCTOR  --tls --cafile $ORDERER_CA
        ;;
    "query")
            echo -n "query ${A[1]}="
            peer chaincode query -C $CC_CHANNEL_ID -n $CC_NAME  -c "{\"Args\":[\"${ARGS}\"]}"
        ;;
    "invoke")
            echo "Invoke ${A[1]}="
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c "{\"Args\":[\"${ARGS}\"]}" --tls --cafile $ORDERER_CA
        ;;

    *) usage
esac
