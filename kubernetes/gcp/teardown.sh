kubectl delete -n default statefulset prometheus
kubectl delete -n default statefulset grafana
kubectl delete -n default statefulset explorerdb
kubectl delete -n default statefulset explorer
kubectl delete -n default statefulset siliconvalley-orderer5
kubectl delete -n default statefulset siliconvalley-orderer4
kubectl delete -n default statefulset siliconvalley-orderer3
kubectl delete -n default statefulset siliconvalley-orderer2
kubectl delete -n default statefulset siliconvalley-orderer
kubectl delete -n default statefulset siliconvalley-ca
kubectl delete -n default statefulset siliconvalley-peer
kubectl -n default delete pod,svc --all
kubectl delete pvc --all

docker image prune --force
docker volume prune --force



