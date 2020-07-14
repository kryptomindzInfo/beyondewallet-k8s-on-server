DIR=$1

kubectl delete -f ./$DIR/k8s-explorerdb.yaml
kubectl delete -f ./$DIR/k8s-explorer.yaml
kubectl delete -f ./$DIR/k8s-prometheus.yaml
kubectl delete -f ./$DIR/k8s-grafana.yaml

kubectl delete pvc explorer-explorer-0
kubectl delete pvc explorerdb-explorerdb-0
kubectl delete pvc grafana-grafana-0
kubectl delete pvc prometheus-prometheus-0

docker system prune --force
docker volume prune --force
