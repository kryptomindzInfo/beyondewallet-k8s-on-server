# Delete
#kubectl delete -n default statefulset prometheus
#kubectl delete -n default statefulset grafana

# Prometheus
kubectl apply -f ./minikube/k8s-prometheus.yaml
kubectl apply -f ./minikube/k8s-grafana.yaml
