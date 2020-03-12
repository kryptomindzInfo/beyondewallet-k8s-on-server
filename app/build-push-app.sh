docker build -t beyondewallet/app-fabric:1.0 app/fabric
docker build -t beyondewallet/app-middleware:1.0 app/middleware
docker build -t beyondewallet/app-frontend:1.0 . -f app/frontend

docker push beyondewallet/app-fabric:1.0
docker push beyondewallet/app-middleware:1.0
docker push beyondewallet/app-frontend:1.0
