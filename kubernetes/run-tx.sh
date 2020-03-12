kubectl exec -it siliconvalley-peer1-0 /bin/bash 
./create-channel.sh
./join-channel.sh
./update-anchor-peer.sh
./chaincode.sh install
./chaincode.sh instantiate

./chaincode.sh invoke createWallet walletA 0 NewWallet
./chaincode.sh invoke createWallet walletB 0 NewWallet

./chaincode.sh invoke rechargeWallet walletA 100 Recharge

./chaincode.sh query showBalance walletA
./chaincode.sh query showBalance walletB

./chaincode.sh invoke transferBtwWallets walletA walletB 25 transfer

./chaincode.sh query showBalance walletA
./chaincode.sh query showBalance walletB

./chaincode.sh invoke disburseWallet walletA 20 Withdraw

./chaincode.sh query showBalance walletA
./chaincode.sh query showBalance walletB

./chaincode.sh query getHistoryForWallet walletA


https://jsonformatter.curiousconcept.com/






# kubectl expose svc explorer-nodeport --type=LoadBalancer --name=explorer-ext
# kubectl expose svc prometheus-nodeport --type=LoadBalancer --name=prometheus-ext
# kubectl expose svc grafana-nodeport --type=LoadBalancer --name=grafana-ext

# kubectl get services explorer-nodeport
# kubectl get services prometheus-nodeport
# kubectl get services grafana-nodeport
