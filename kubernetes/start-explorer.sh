# Delete
#kubectl delete -n default statefulset explorerdb
#kubectl delete -n default statefulset explorer

# Explorer
kubectl apply -f ./minikube/k8s-explorerdb.yaml
kubectl apply -f ./minikube/k8s-explorer.yaml


# docker rmi $(docker images --filter “dangling=true” -q --no-trunc)
