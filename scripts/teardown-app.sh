DIR=k8s-config

# delete statefulsets and services
kubectl delete -f ../$DIR/k8s-beyondewallet-app-fabric.yaml
kubectl delete -f ../$DIR/k8s-beyondewallet-app-middleware.yaml
kubectl delete -f ../$DIR/k8s-beyondewallet-mongodb.yaml
kubectl delete -f ../$DIR/k8s-beyondewallet-app-frontend.yaml
kubectl delete -f ../$DIR/k8s-beyondewallet-app-cust-frontend.yaml
kubectl delete -f ../$DIR/k8s-beyondewallet-app-merchant-frontend.yaml
kubectl delete -f ../$DIR/k8s-beyondewallet-app-partner-frontend.yaml
kubectl delete -f ../$DIR/k8s-ipfs.yaml
kubectl delete -f ../$DIR/k8s-rabbitmq-consumers.yaml
kubectl delete -f ../$DIR/k8s-rabbitmq.yaml

# delete pvc
kubectl delete pvc beyondewallet-app-pvc-beyondewallet-app-0
kubectl delete pvc beyondewallet-backend-pvc-beyondewallet-backend-0
kubectl delete pvc beyondewallet-mongodb-pvc-beyondewallet-mongodb-0
kubectl delete pvc beyondewallet-frontend-pvc-beyondewallet-frontend-0
kubectl delete pvc rabbitmq-rabbitmq-0
kubectl delete pvc beyondewallet-cust-frontend-pvc-beyondewallet-cust-frontend-0
kubectl delete pvc beyondewallet-merchant-frontend-pvc-beyondewallet-merchant-frontend-0
kubectl delete pvc beyondewallet-partner-frontend-pvc-beyondewallet-partner-frontend-0
kubectl delete pvc beyondewallet-ipfs-pvc-beyondewallet-ipfs-0
