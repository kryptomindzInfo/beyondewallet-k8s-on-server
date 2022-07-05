#fetch one of the node's ip address
export SERVER_IP=$(kubectl get nodes -o wide | awk 'NR==2 {print $7}')
echo -e "\nOne of the Node IP is $SERVER_IP"

#update all the git submodules
echo -e "\nUpdate all the app's submodules..."
git submodule update --remote --merge ../

#docker build -t beyondewallet/app-fabric:demo2022 fabric

#substitute node ip with server ip in infra frontend constants file and then build
echo -e "\nUpdate middleware config and build the app..."
envsubst < backend-config > ../app/middleware/config.json
docker build -t beyondewallet/app-middleware:demo2022 ../app/middleware

#substitute node ip with server ip in infra frontend constants file and then build
echo -e "\nUpdate infra config and build the app..."
envsubst < infra-config > ../app/frontend/app/containers/App/constants.js
docker build -t beyondewallet/app-frontend:demo2022 ../app/frontend

#substitute node ip with server ip in customer frontend constants file and then build
echo -e "\nUpdate customer config and build the app..."
envsubst < customer-config > ../app/customer-frontend/app/containers/App/constants.js
docker build -t beyondewallet/app-customer-frontend:demo2022 ../app/customer-frontend

#substitute node ip with server ip in merchant frontend constants file and then build
echo -e "\nUpdate merchant config and build the app..."
envsubst < merchant-config > ../app/merchant-frontend/src/components/constants.js
docker build -t beyondewallet/app-merchant-frontend:demo2022 ../app/merchant-frontend

#substitute node ip with server ip in customer frontend constants file and then build
echo -e "\nUpdate customer config and build the app..."
envsubst < partner-config > ../app/partner/app/containers/App/constants.js
docker build -t beyondewallet/app-partner-frontend:demo2022 ../app/partner

# docker push beyondewallet/app-fabric:demo2022
echo -e "\nPush the above built applications..."
docker push beyondewallet/app-middleware:demo2022
docker push beyondewallet/app-frontend:demo2022
docker push beyondewallet/app-customer-frontend:demo2022
docker push beyondewallet/app-merchant-frontend:demo2022
docker push beyondewallet/app-partner-frontend:demo2022
