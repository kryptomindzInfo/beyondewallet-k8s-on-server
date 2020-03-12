kubectl apply -f ./minikube/k8s-storage-class.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-ca.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-orderer.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-orderer2.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-orderer3.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-orderer4.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-orderer5.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-peer1.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-peer2.yaml

#kubectl apply -f ./minikube/k8s-siliconvalley-beyondewallet-fabric.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-beyondewallet-middleware.yaml
kubectl apply -f ./minikube/k8s-siliconvalley-beyondewallet-frontend.yaml

kubectl apply -f ./minikube/k8s-nginx-ingress.yaml
kubectl apply -f ./minikube/k8s-http-load-balancer.yaml
# istioctl kube-inject -f ./minikube/k8s-storage-class.yaml | kubectl apply -f -
