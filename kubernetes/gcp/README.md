Launching
=========
kubectl apply -f ./k8s-storage-class.yaml
kubectl apply -f ./k8s-siliconvalley-orderer.yaml
kubectl apply -f ./k8s-siliconvalley-orderer2.yaml
kubectl apply -f ./k8s-siliconvalley-peer.yaml
kubectl apply -f ./k8s-siliconvalley-ca.yaml

> kubectl apply -f .

> kubectl delete -n default statefulset siliconvalley-orderer


SiliconValley Peer Setup
===============
Log into the siliconvalley peer:
> kubectl exec -it siliconvalley-peer-0 /bin/bash

Setup the peer:
> ./submit-channel-create.sh
> ./join-channel.sh
> ./anchor-update.sh

Validate the peer:
> ./chaincode.sh install
> ./chaincode.sh instantiate
> ./chaincode.sh invoke  
> ./chaincode.sh query


kubectl expose svc explorer-nodeport --type=LoadBalancer --name=explorer-ext
kubectl expose svc prometheus-nodeport --type=LoadBalancer --name=prometheus-ext
kubectl expose svc grafana-nodeport --type=LoadBalancer --name=grafana-ext

kubectl get services explorer-ext
kubectl get services prometheus-ext
kubectl get services grafana-ext
