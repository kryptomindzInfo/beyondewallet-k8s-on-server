echo "Enter the version:"
read VER

git submodule update --init --recursive --remote ../fabric-network/ewallet-cc/
kubectl cp ../fabric-network/ewallet-cc/ewallet.go siliconvalley-peer1-0:/opt/gopath/src/github.com/src/ewallet-cc -c siliconvalley-peer1
kubectl cp ../fabric-network/ewallet-cc/ewallet.go siliconvalley-peer2-0:/opt/gopath/src/github.com/src/ewallet-cc -c siliconvalley-peer2

############# upgrade in peer1 ####################
kubectl exec -it siliconvalley-peer1-0 -c siliconvalley-peer1 -- /bin/bash -li -c ' \
CC_VERSION=$1 && \
peer chaincode install -n $CC_NAME -p $CC_PATH -v $CC_VERSION && \
peer chaincode list --installed -C $CC_CHANNEL_ID && \
peer chaincode upgrade -o siliconvalley-orderer-clusterip:30750 -C $CC_CHANNEL_ID -n $CC_NAME  -v $CC_VERSION -c "{\"Args\":[]}" --tls --cafile $ORDERER_CA && \
peer chaincode list --instantiated -C $CC_CHANNEL_ID' _ $VER

############### upgrade in peer2 ####################
kubectl exec -it siliconvalley-peer2-0 -c siliconvalley-peer2 -- /bin/bash -li -c '
CC_VERSION=$1 && \
peer chaincode install -n $CC_NAME -p $CC_PATH -v $CC_VERSION && \
peer chaincode list --installed -C $CC_CHANNEL_ID && \
peer chaincode list --instantiated -C $CC_CHANNEL_ID' _ $VER
