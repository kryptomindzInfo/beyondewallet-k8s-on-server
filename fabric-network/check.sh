var=$(ls ./config/crypto-config/peerOrganizations/siliconvalley.com/users/Admin@siliconvalley.com/msp/keystore/)
echo $var
name=$(find ./config/crypto-config/peerOrganizations/siliconvalley.com/ca/ -name "*_sk" -exec basename \{} .po \;)
file='                "path": "\/opt\/crypto\/peerOrganizations\/siliconvalley.com\/users\/Admin@siliconvalley.com\/msp\/keystore\/'$var'"'
sed -e "45s/.*/$file/" -i ./explorer/fabric/connection-profile/ewallet-network.json
