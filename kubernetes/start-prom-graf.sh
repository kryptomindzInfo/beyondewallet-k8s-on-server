DIR=$1

# Delete

#kubectl delete -n default statefulset prometheus
#kubectl delete -n default statefulset grafana

# Prometheus
kubectl apply -f ./$DIR/k8s-prometheus.yaml
kubectl apply -f ./$DIR/k8s-grafana.yaml
