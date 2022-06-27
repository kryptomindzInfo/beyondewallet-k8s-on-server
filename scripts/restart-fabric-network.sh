DIR=k8s-config

./teardown-network.sh

kubectl apply -f ../$DIR/k8s-siliconvalley-ca.yaml
kubectl apply -f ../$DIR/k8s-siliconvalley-orderer.yaml
kubectl apply -f ../$DIR/k8s-siliconvalley-orderer2.yaml
kubectl apply -f ../$DIR/k8s-siliconvalley-orderer3.yaml
kubectl apply -f ../$DIR/k8s-siliconvalley-orderer4.yaml
kubectl apply -f ../$DIR/k8s-siliconvalley-orderer5.yaml
kubectl apply -f ../$DIR/k8s-siliconvalley-peer1.yaml
kubectl apply -f ../$DIR/k8s-siliconvalley-peer2.yaml
