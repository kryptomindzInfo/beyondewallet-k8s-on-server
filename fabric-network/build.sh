docker build -t beyondewallet/k8s-hlf-ca:1.0 . -f docker/ca/Dockerfile
docker build -t beyondewallet/k8s-hlf-siliconvalley-orderer1:1.0 . -f docker/orderer/Dockerfile
docker build -t beyondewallet/k8s-hlf-siliconvalley-orderer2:1.0 . -f docker/orderer2/Dockerfile
docker build -t beyondewallet/k8s-hlf-siliconvalley-orderer3:1.0 . -f docker/orderer3/Dockerfile
docker build -t beyondewallet/k8s-hlf-siliconvalley-orderer4:1.0 . -f docker/orderer4/Dockerfile
docker build -t beyondewallet/k8s-hlf-siliconvalley-orderer5:1.0 . -f docker/orderer5/Dockerfile
docker build -t beyondewallet/k8s-hlf-siliconvalley-peer1:1.0 . -f docker/peer1/Dockerfile
docker build -t beyondewallet/k8s-hlf-siliconvalley-peer2:1.0 . -f docker/peer2/Dockerfile

docker build --no-cache -t beyondewallet/explorerdb:1.0 . -f docker/explorerdb/Dockerfile
docker build --no-cache -t beyondewallet/explorer:1.0 . -f docker/explorer/Dockerfile

docker build --no-cache -t beyondewallet/prometheus:1.0 . -f docker/prometheus/Dockerfile
docker build --no-cache -t beyondewallet/grafana:1.0 . -f docker/grafana/Dockerfile
