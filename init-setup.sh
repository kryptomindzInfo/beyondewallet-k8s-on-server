# Mushi - Explorer
# This script must run if crypto-config is changed
git submodule update --init --recursive --remote ./app/fabric/
cp -r ./fabric-network/config/crypto-config ./fabric-network/explorer
cp -r ./fabric-network/config/crypto-config ./app/fabric/config

var=$(ls ./fabric-network/config/crypto-config/peerOrganizations/siliconvalley.com/ca/)
echo $var
name=$(find ./fabric-network/config/crypto-config/peerOrganizations/siliconvalley.com/ca/ -name "*_sk" -exec basename \{} .po \;)
file="\/var\/hyperledger\/fabric-ca-server-config\/"$name
sed -e "37s/.*/            value: $file/" -i ./kubernetes/config/k8s-siliconvalley-ca.yaml
sed -e "13s/.*/COPY .\/config\/crypto-config\/peerOrganizations\/siliconvalley.com\/ca\/$name \/var\/hyperledger\/fabric-ca-server-config\//" -i ./fabric-network/docker/ca/Dockerfile
sed -e "14s/.*/COPY .\/config\/crypto-config\/peerOrganizations\/siliconvalley.com\/ca\/$name \/var\/hyperledger\/config\//" -i ./fabric-network/docker/ca/Dockerfile

name=$(find ./fabric-network/config/crypto-config/peerOrganizations/siliconvalley.com/users/Admin@siliconvalley.com/msp/keystore/ -name "*_sk" -exec basename \{} .po \;)
echo $name
file="\/opt\/crypto\/peerAdminMSP\/keystore\/"$name
sed -i -e "/\"path\": \"\/opt\/crypto\/peerAdminMSP\/keystore\//s/.*/		  \"path\": \"$file\"/" ./app/fabric/connection.json;

line_to_update="\"path\": \"\/opt\/crypto\/peerOrganizations\/siliconvalley.com\/users\/Admin@siliconvalley.com\/msp\/keystore\/"
sed -i -e "/$line_to_update/s/.*/                $line_to_update$name\"/" ./fabric-network/explorer/fabric/connection-profile/ewallet-network.json;

echo "Done."
