DIR=k8s-config

kubectl delete -f ../$DIR/k8s-explorerdb.yaml
kubectl delete -f ../$DIR/k8s-explorer.yaml

kubectl delete pvc explorer-explorer-0
kubectl delete pvc explorerdb-explorerdb-0