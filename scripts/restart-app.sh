DIR=k8s-config

./teardown-app.sh

kubectl apply -f ../$DIR/k8s-beyondewallet-app-fabric.yaml
kubectl apply -f ../$DIR/k8s-beyondewallet-app-middleware.yaml
kubectl apply -f ../$DIR/k8s-beyondewallet-mongodb.yaml
kubectl apply -f ../$DIR/k8s-beyondewallet-app-frontend.yaml
kubectl apply -f ../$DIR/k8s-beyondewallet-app-cust-frontend.yaml
kubectl apply -f ../$DIR/k8s-beyondewallet-app-merchant-frontend.yaml
kubectl apply -f ../$DIR/k8s-beyondewallet-app-partner-frontend.yaml
kubectl apply -f ../$DIR/k8s-ipfs.yaml
kubectl apply -f ../$DIR/k8s-rabbitmq-consumers.yaml
kubectl apply -f ../$DIR/k8s-rabbitmq.yaml
