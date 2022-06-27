
echo "Build and Push Middleware, Infra Frontend and Customer Frontend Applications.."
#build all the applications docker images
./build-push-app.sh

echo "Setup Fabric Network..."
#setup fabric network
./setup-fabric-network.sh

echo "Start all the Applications..."
#Start all the applications
./restart-app.sh

echo "Hurrayy!! Now you are ready to use Beyondewallet Application"