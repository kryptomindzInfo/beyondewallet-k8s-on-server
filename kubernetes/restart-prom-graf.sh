# Delete
kubectl delete -n default statefulset prometheus
kubectl delete -n default statefulset grafana

# Docker
# docker build --no-cache -t siliconvalleysenegal/prometheus:1.0 . -f images/prometheus/Dockerfile
# docker build --no-cache -t siliconvalleysenegal/grafana:1.0 . -f images/grafana/Dockerfile

# Prometheus
kubectl apply -f ./minikube/k8s-prometheus.yaml
kubectl apply -f ./minikube/k8s-grafana.yaml
