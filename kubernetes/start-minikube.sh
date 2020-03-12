minikube start --memory 16000 --vm-driver=virtualbox --addons ingress
minikube docker-env

# . eval $(minikube docker-env)
#docker rmi $(docker images -a -q) -f

echo 'done!'
