DIR=k8s-config

./teardown-explorer.sh

# Explorer
kubectl apply -f ../$DIR/k8s-explorerdb.yaml
kubectl apply -f ../$DIR/k8s-explorer.yaml

