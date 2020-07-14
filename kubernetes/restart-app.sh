./teardown-app.sh
# kubectl apply -f ./minikube/k8s-storage-class.yaml
kubectl apply -f ./rancher/k8s-beyondewallet-app-fabric.yaml
kubectl apply -f ./rancher/k8s-beyondewallet-app-middleware.yaml
kubectl apply -f ./rancher/k8s-beyondewallet-mongodb.yaml
kubectl apply -f ./rancher/k8s-beyondewallet-app-frontend.yaml
kubectl apply -f ./rancher/k8s-beyondewallet-app-cust-frontend.yaml

# kubectl apply -f ./minikube/k8s-nginx-ingress.yaml
# kubectl apply -f ./minikube/k8s-http-load-balancer.yaml

# sudo -s
# while true; do kubectl port-forward svc/ingress-nginx -n ingress-nginx 80:80 --address='0.0.0.0'; done &
