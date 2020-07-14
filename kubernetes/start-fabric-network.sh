DIR=$1

# kubectl delete -f ./$DIR/k8s-storage-class.yaml
# kubectl delete -f ./$DIR/k8s-siliconvalley-ca.yaml
# kubectl delete -f ./$DIR/k8s-siliconvalley-orderer.yaml
# kubectl delete -f ./$DIR/k8s-siliconvalley-orderer2.yaml
# kubectl delete -f ./$DIR/k8s-siliconvalley-orderer3.yaml
# kubectl delete -f ./$DIR/k8s-siliconvalley-orderer4.yaml
# kubectl delete -f ./$DIR/k8s-siliconvalley-orderer5.yaml
# kubectl delete -f ./$DIR/k8s-siliconvalley-peer1.yaml
# kubectl delete -f ./$DIR/k8s-siliconvalley-peer2.yaml

# kubectl delete -f ./$DIR/k8s-nginx-ingress.yaml
# kubectl delete -f ./$DIR/k8s-http-load-balancer.yaml

# kubectl delete pvc --all

# kubectl -n <namespace> get pvc | tail -n +2 | grep -v Bound | \
# awk '{print $1}' | xargs -I{} kubectl -n namespace delete pvc {}

#kubectl get pv | grep Released | awk '$1 {print$1}' | while read vol; do kubectl delete pv/${vol}; done

# kubectl apply -f ./$DIR/k8s-storage-class.yaml
kubectl apply -f ./$DIR/k8s-siliconvalley-ca.yaml
kubectl apply -f ./$DIR/k8s-siliconvalley-orderer.yaml
kubectl apply -f ./$DIR/k8s-siliconvalley-orderer2.yaml
kubectl apply -f ./$DIR/k8s-siliconvalley-orderer3.yaml
kubectl apply -f ./$DIR/k8s-siliconvalley-orderer4.yaml
kubectl apply -f ./$DIR/k8s-siliconvalley-orderer5.yaml
kubectl apply -f ./$DIR/k8s-siliconvalley-peer1.yaml
kubectl apply -f ./$DIR/k8s-siliconvalley-peer2.yaml


#istioctl kube-inject -f ./$DIR/k8s-storage-class.yaml | kubectl apply -f -
