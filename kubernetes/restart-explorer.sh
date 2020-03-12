# Delete
kubectl delete -n default statefulset explorerdb
kubectl delete -n default statefulset explorer

# Docker
# docker build --no-cache -t siliconvalleysenegal/explorerdb:1.0 . -f images/explorerdb/Dockerfile
# docker build --no-cache -t siliconvalleysenegal/explorer:1.0 . -f images/explorer/Dockerfile

# Explorer
kubectl apply -f ./minikube/k8s-explorerdb.yaml
kubectl apply -f ./minikube/k8s-explorer.yaml


# docker rmi $(docker images --filter “dangling=true” -q --no-trunc)