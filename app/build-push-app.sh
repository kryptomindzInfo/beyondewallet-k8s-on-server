docker build -t beyondewallet/app-fabric:1.0 fabric
docker build -t beyondewallet/app-middleware:1.0 middleware
docker build -t beyondewallet/app-frontend:1.0 frontend
docker build -t beyondewallet/app-customer-frontend:1.0 frontend
docker build -t beyondewallet/app-merchant-frontend:1.0 frontend

docker push beyondewallet/app-fabric:1.0
docker push beyondewallet/app-middleware:1.0
docker push beyondewallet/app-frontend:1.0
