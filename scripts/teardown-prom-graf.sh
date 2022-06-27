DIR=k8s-config

kubectl delete -f ../$DIR/k8s-prometheus.yaml
kubectl delete -f ../$DIR/k8s-grafana.yaml

kubectl delete pvc grafana-grafana-0
kubectl delete pvc prometheus-prometheus-0
