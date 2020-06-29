eval $(minikube -p minikube docker-env)
./teardown-network.sh
./start-fabric-network.sh
############# peer1 ####################

while [[ $(kubectl get pods siliconvalley-orderer-0 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "orderer pod" && sleep 1; done
while [[ $(kubectl get pods siliconvalley-peer1-0 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for pod" && sleep 1; done

kubectl exec -it siliconvalley-peer1-0 -c siliconvalley-peer1 -- /bin/bash -li -c ' \
echo ${CC_CHANNEL_ID} && \
peer channel create -c $CC_CHANNEL_ID -f /var/hyperledger/config/${CC_CHANNEL_ID}.tx --outputBlock /var/hyperledger/config/${CC_CHANNEL_ID}.block -o $ORDERER_ADDRESS --tls --cafile $ORDERER_CA && \
apt-get install curl -y && \
while ! curl -s -o /dev/null -I -L -w "\n%{http_code}\n" --output - http://localhost:30751 -v; do echo "$(date) - Waiting for peer to come online..."; sleep 1; done && \
peer channel join -b /var/hyperledger/config/${CC_CHANNEL_ID}.block -o $ORDERER_ADDRESS  && \
echo "List of all channels on peer"  && \
peer channel list  && \
peer channel update -f /var/hyperledger/config/siliconvalley-peer-update.tx -c $CC_CHANNEL_ID -o $ORDERER_ADDRESS  --tls --cafile $ORDERER_CA && \
peer chaincode install  -n $CC_NAME -p $CC_PATH -v $CC_VERSION && \
peer chaincode list --installed -C $CC_CHANNEL_ID && \
peer chaincode instantiate -o siliconvalley-orderer-clusterip:30750 -C $CC_CHANNEL_ID -n $CC_NAME  -v $CC_VERSION -c "{\"Args\":[]}" --tls --cafile $ORDERER_CA'


############### peer2 ####################
while [[ $(kubectl get pods siliconvalley-peer2-0 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for pod" && sleep 1; done
kubectl exec -it siliconvalley-peer2-0 -c siliconvalley-peer2 -- /bin/bash -li -c '
peer channel fetch 0 /var/hyperledger/config/${CC_CHANNEL_ID}.block -o $ORDERER_ADDRESS -c $CC_CHANNEL_ID  --tls --cafile $ORDERER_CA && \
apt-get install curl -y && \
while ! curl -s -o /dev/null -I -L -w "\n%{http_code}\n" --output - http://localhost:30851; do echo "$(date) - Waiting for peer to come online..."; sleep 1; done && \
peer channel join -b /var/hyperledger/config/${CC_CHANNEL_ID}.block -o $ORDERER_ADDRESS && \
echo "List of all channels on peer" && \
peer channel list && \
peer chaincode install -n $CC_NAME -p $CC_PATH -v $CC_VERSION && \
peer chaincode list --installed -C $CC_CHANNEL_ID'

############### restart explorer,prometheus and grafana ###############
./teardown-exp-prom-graf.sh
./start-explorer.sh
./start-prom-graf.sh
