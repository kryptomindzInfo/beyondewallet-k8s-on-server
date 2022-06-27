DIR=k8s-config

./teardown-prom-graf.sh
# Prometheus
kubectl apply -f ../$DIR/k8s-prometheus.yaml
kubectl apply -f ../$DIR/k8s-grafana.yaml
