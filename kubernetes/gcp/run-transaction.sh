kubectl exec -it siliconvalley-peer-0 /bin/bash 
./create-channel.sh
./join-channel.sh
./chaincode.sh install
./chaincode.sh instantiate
./update-anchor-peer.sh

# eWallet
./chaincode.sh invoke createWallet walletA 0 "New Wallet"
./chaincode.sh invoke createWallet walletB 0 "New Wallet"

./chaincode.sh invoke rechargeWallet walletA 100 Recharge

query showBalance walletA
query showBalance walletB

invoke transferBtwWallets walletA walletB 25 transfer

query showBalance walletA
query showBalance walletB

./chaincode.sh invoke disburseWallet walletA 20 Withdraw

query showBalance walletA
query showBalance walletB

./chaincode.sh query getHistoryForWallet walletA


# Expose

kubectl expose svc explorer-nodeport --type=LoadBalancer --name=explorer-ext
kubectl expose svc prometheus-nodeport --type=LoadBalancer --name=prometheus-ext
kubectl expose svc grafana-nodeport --type=LoadBalancer --name=grafana-ext

kubectl get services explorer-nodeport
kubectl get services prometheus-nodeport
kubectl get services grafana-nodeport
