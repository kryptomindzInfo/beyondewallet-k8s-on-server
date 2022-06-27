Green='\033[1;32m'
NC='\033[0m' # No Color
echo -e "${Green}Build and Push Middleware, Infra Frontend and Customer Frontend Applications..${NC}"
#build all the applications docker images
./build-push-app.sh

echo -e "\n${Green}Setup Fabric Network...${NC}"
#setup fabric network
./setup-fabric-network.sh

echo -e "\n${Green}Start all the Applications...${NC}"
#Start all the applications
./restart-app.sh

echo -e "\n${Green}Hurrayy!! Now you are ready to use Beyondewallet Application${NC}"