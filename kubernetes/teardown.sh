kubectl delete -f ./minikube/k8s-storage-class.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-ca.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer2.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer3.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer4.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer5.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-peer1.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-peer2.yaml

kubectl delete -f ./minikube/k8s-explorerdb.yaml
kubectl delete -f ./minikube/k8s-explorer.yaml
kubectl delete -f ./minikube/k8s-prometheus.yaml
kubectl delete -f ./minikube/k8s-grafana.yaml

kubectl delete -f ./minikube/k8s-siliconvalley-beyondewallet-fabric.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-beyondewallet-middleware.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-beyondewallet-frontend.yaml

kubectl delete -f ./minikube/k8s-nginx-ingress.yaml

kubectl delete pvc --all
# kubectl delete storageclass general

docker system prune --force
docker volume prune --force
