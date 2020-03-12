kubectl delete -f ./k8s-storage-class.yaml
kubectl delete -f ./k8s-siliconvalley-ca.yaml
kubectl delete -f ./k8s-siliconvalley-orderer.yaml
kubectl delete -f ./k8s-siliconvalley-orderer2.yaml
kubectl delete -f ./k8s-siliconvalley-orderer3.yaml
kubectl delete -f ./k8s-siliconvalley-orderer4.yaml
kubectl delete -f ./k8s-siliconvalley-orderer5.yaml
kubectl delete -f ./k8s-siliconvalley-peer1.yaml
kubectl delete -f ./k8s-siliconvalley-peer2.yaml
kubectl delete -f ./k8s-siliconvalley-blockchain.yaml
kubectl delete -f ./k8s-siliconvalley-middleware.yaml
kubectl delete -f ./k8s-siliconvalley-frontend.yaml
kubectl delete -f ./k8s-http-ingress-loadbalancer.yaml
kubectl delete pvc --all


kubectl apply -f ./k8s-storage-class.yaml
kubectl apply -f ./k8s-siliconvalley-ca.yaml
kubectl apply -f ./k8s-siliconvalley-orderer.yaml
kubectl apply -f ./k8s-siliconvalley-orderer2.yaml
kubectl apply -f ./k8s-siliconvalley-orderer3.yaml
kubectl apply -f ./k8s-siliconvalley-orderer4.yaml
kubectl apply -f ./k8s-siliconvalley-orderer5.yaml
kubectl apply -f ./k8s-siliconvalley-peer1.yaml
kubectl apply -f ./k8s-siliconvalley-peer2.yaml
kubectl apply -f ./k8s-siliconvalley-blockchain.yaml
kubectl apply -f ./k8s-siliconvalley-middleware.yaml
kubectl apply -f ./k8s-siliconvalley-frontend.yaml
kubectl apply -f ./k8s-http-ingress-loadbalancer.yaml


