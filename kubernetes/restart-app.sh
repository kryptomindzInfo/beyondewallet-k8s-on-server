DIR=$1

./teardown-app.sh

kubectl apply -f ./$DIR/k8s-beyondewallet-app-fabric.yaml
kubectl apply -f ./$DIR/k8s-beyondewallet-app-middleware.yaml
kubectl apply -f ./$DIR/k8s-beyondewallet-mongodb.yaml
kubectl apply -f ./$DIR/k8s-beyondewallet-app-frontend.yaml
kubectl apply -f ./$DIR/k8s-beyondewallet-app-cust-frontend.yaml
