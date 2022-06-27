#fetch one of the node's ip address
export SERVER_IP=$(kubectl get nodes -o wide | awk 'NR==2 {print $7}')
echo "One of the Node IP is " + SERVER_IP

#update all the git submodules
echo "Update all the app's submodules"
git submodule update --remote --merge ../

#docker build -t beyondewallet/app-fabric:demo2022 fabric

#substitute node ip with server ip in infra frontend constants file and then build
echo "Update middleware config and build the app"
envsubst < backend-config > ../app/middleware/config.json
docker build -t beyondewallet/app-middleware:demo2022 ../app/middleware

#substitute node ip with server ip in infra frontend constants file and then build
echo "Update infra config and build the app"
envsubst < infra-config > ../app/frontend/app/containers/App/constants.js
docker build -t beyondewallet/app-frontend:demo2022 ../app/frontend

#substitute node ip with server ip in customer frontend constants file and then build
echo "Update customer config and build the app"
envsubst < customer-config > ../app/customer-frontend/app/containers/App/constants.js
docker build -t beyondewallet/app-customer-frontend:demo2022 ../app/customer-frontend
#docker build -t beyondewallet/app-merchant-frontend:demo2022 ../app/merchant-frontend
#docker build -t beyondewallet/app-partner-frontend:demo2022 ../app/partner

# docker push beyondewallet/app-fabric:demo2022
echo "Push the above built applications"
docker push beyondewallet/app-middleware:demo2022
docker push beyondewallet/app-frontend:demo2022
docker push beyondewallet/app-customer-frontend:demo2022
# docker push beyondewallet/app-merchant-frontend:demo2022
# docker push beyondewallet/app-partner-frontend:demo2022
