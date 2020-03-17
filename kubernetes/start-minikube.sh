minikube start --memory 16000 --vm-driver=virtualbox # --addons ingress
minikube docker-env
 
eval $(minikube -p minikube docker-env)
#docker rmi $(docker images -a -q) -f
minikube dashboard --url &
kubectl proxy --address='0.0.0.0' --disable-filter=true &
echo 'done!'


