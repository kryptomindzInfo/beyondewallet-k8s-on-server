DIR=$1

kubectl delete -f ./$DIR/k8s-beyondewallet-app-fabric.yaml
kubectl delete -f ./$DIR/k8s-beyondewallet-app-middleware.yaml
kubectl delete -f ./$DIR/k8s-beyondewallet-mongodb.yaml
kubectl delete -f ./$DIR/k8s-beyondewallet-app-frontend.yaml
# kubectl delete -f ./$DIR/k8s-http-load-balancer.yaml
#kubectl delete -f ./$DIR/k8s-nginx-ingress.yaml

kubectl delete pvc beyondewallet-app-pvc-beyondewallet-app-0
kubectl delete pvc beyondewallet-backend-pvc-beyondewallet-backend-0
kubectl delete pvc beyondewallet-frontend-pvc-beyondewallet-frontend-0

docker system prune --force
docker volume prune --force
