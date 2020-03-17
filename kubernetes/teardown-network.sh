# kubectl delete -f ./minikube/k8s-storage-class.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-ca.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer2.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer3.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer4.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-orderer5.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-peer1.yaml
kubectl delete -f ./minikube/k8s-siliconvalley-peer2.yaml

kubectl delete pvc ca-ledger-siliconvalley-ca-0 
kubectl delete pvc orderer-ledger-siliconvalley-orderer-0 
kubectl delete pvc orderer2-ledger-siliconvalley-orderer2-0 
kubectl delete pvc orderer3-ledger-siliconvalley-orderer3-0 
kubectl delete pvc orderer4-ledger-siliconvalley-orderer4-0 
kubectl delete pvc orderer5-ledger-siliconvalley-orderer5-0 
kubectl delete pvc siliconvalley-peer1-ledger-siliconvalley-peer1-0 
kubectl delete pvc siliconvalley-peer2-ledger-siliconvalley-peer2-0 

docker system prune --force
docker volume prune --force
