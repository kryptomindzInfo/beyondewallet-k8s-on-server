DIR=k8s-config

# eval $(minikube -p minikube docker-env)
echo -e "\nStart fabric network"
./restart-fabric-network.sh $DIR

############# peer1 ####################

echo -e "\nWait for all the orderes(2..3) to start"
while [[ $(kubectl get pods siliconvalley-orderer{2..3}-0 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True" ]]; do echo "orderer pod" && sleep 3; done

# If orderer4 and ordere5 are also started, then uncomment the following line
# while [[ $(kubectl get pods siliconvalley-orderer{4..5}-0 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True" ]]; do echo "orderer pod" && sleep 3; done

echo -e "\nSleeping for 15s for leader election process to complete...\n"
sleep 15

echo -e "\nWait for peer1 to start"
while [[ $(kubectl get pods siliconvalley-peer1-0 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for pod" && sleep 1; done

echo -e "\nPeer1: Create channel, join channel, install and instantaite chaincode"
kubectl exec -it siliconvalley-peer1-0 -c siliconvalley-peer1 -- /bin/bash -li -c ' \
echo ${CC_CHANNEL_ID} && \
peer channel create -c $CC_CHANNEL_ID -f /var/hyperledger/config/${CC_CHANNEL_ID}.tx --outputBlock /var/hyperledger/config/${CC_CHANNEL_ID}.block -o $ORDERER_ADDRESS --tls --cafile $ORDERER_CA && \
apt-get install curl -y && \
while ! curl -s -o /dev/null -I -L -w "\n%{http_code}\n" --output - http://localhost:30751 -v; do echo "$(date) - Waiting for peer to come online..."; sleep 1; done && \
peer channel join -b /var/hyperledger/config/${CC_CHANNEL_ID}.block -o $ORDERER_ADDRESS  && \
peer channel list  && \
peer channel update -f /var/hyperledger/config/siliconvalley-peer-update.tx -c $CC_CHANNEL_ID -o $ORDERER_ADDRESS  --tls --cafile $ORDERER_CA && \
peer chaincode install  -n $CC_NAME -p $CC_PATH -v $CC_VERSION && \
peer chaincode list --installed -C $CC_CHANNEL_ID && \
peer chaincode instantiate -o siliconvalley-orderer-clusterip:30750 -C $CC_CHANNEL_ID -n $CC_NAME  -v $CC_VERSION -c "{\"Args\":[]}" --tls --cafile $ORDERER_CA'


############### peer2 ####################
# echo -e "\nWait for peer2 to start"
# while [[ $(kubectl get pods siliconvalley-peer2-0 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for pod" && sleep 1; done

# echo -e "\nPeer2: fetch channel, join channel and install chaincode"
# kubectl exec -it siliconvalley-peer2-0 -c siliconvalley-peer2 -- /bin/bash -li -c '
# peer channel fetch 0 /var/hyperledger/config/${CC_CHANNEL_ID}.block -o $ORDERER_ADDRESS -c $CC_CHANNEL_ID  --tls --cafile $ORDERER_CA && \
# apt-get install curl -y && \
# while ! curl -s -o /dev/null -I -L -w "\n%{http_code}\n" --output - http://localhost:30851; do echo "$(date) - Waiting for peer to come online..."; sleep 1; done && \
# peer channel join -b /var/hyperledger/config/${CC_CHANNEL_ID}.block -o $ORDERER_ADDRESS && \
# echo "List of all channels on peer" && \
# peer channel list && \
# peer chaincode install -n $CC_NAME -p $CC_PATH -v $CC_VERSION && \
# peer chaincode list --installed -C $CC_CHANNEL_ID'

############### restart explorer,prometheus and grafana ###############

# echo -e "\nStart explorer"
# ./restart-explorer.sh $DIR

# echo -e "\nStart Prometheus and Grafana"
# ./restart-prom-graf.sh $DIR
