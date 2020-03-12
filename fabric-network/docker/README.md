Creating the Docker images
=====================================
1. Setup Docker on your HOST machine
2. Setup minikube on your HOST machine 
3. Setup the shell environment variable to point to minikube Registry
4. Run the Docker build command for creating the images in local registry
   * Carry out local testing in minikube
5. Push the images to Docker Hub (or your private repository)
6. Launch the cluster & Deploy K8s/HLF setup

1. Setup Docker on your HOST machine
====================================
Only the client need to be used for creating the Docker images
Please follow the instructions for your HOST to set it up

https://docs.docker.com/v17.12/install/

2. Setup minikube on your HOST machine
======================================
- Install minikube
https://kubernetes.io/docs/tasks/tools/install-minikube/

- Launch minikube
> minikube start

3. Using the minikube VM Docker Registry
========================================
Images will be built directly in the minikube registry
- Get the information about the Docker for minikube
> minikube docker-env


4. Building the images
======================
# Delete all images - MAKE sure previous steps are followed otherwise
# this will delete the Docker images from your HOST machines :)
docker rmi $(docker images -a -q) -f

# These commands to be executed in the k8s folder
docker build -t siliconvalleysenegal/k8s-hlf-siliconvalley-orderer1:1.0 . -f images/orderer/Dockerfile
docker build -t siliconvalleysenegal/k8s-hlf-siliconvalley-orderer2:1.0 . -f images/orderer2/Dockerfile
docker build -t siliconvalleysenegal/k8s-hlf-siliconvalley-orderer3:1.0 . -f images/orderer3/Dockerfile


docker build -t siliconvalleysenegal/k8s-hlf-siliconvalley-peer:1.0 . -f images/siliconvalley-peer/Dockerfile
docker build -t siliconvalleysenegal/k8s-hlf-budget-peer:1.0 . -f images/budget-peer/Dockerfile
docker build -t siliconvalleysenegal/k8s-hlf-ca:1.0 . -f images/ca/Dockerfile

5. Push the images to image registry
====================================
This step is needed for making the image available to others from the Registry
For production a private registry will be used

For testing this step may be skipped as the image is already pushed to 
minikube registry

Following will push the images to Docker Hub
> docker login -u <<Docker Hub User ID>>

> docker push siliconvalleysenegal/k8s-hlf-siliconvalley-orderer:1.0
> docker push siliconvalleysenegal/k8s-hlf-siliconvalley-peer:1.0
> docker push siliconvalleysenegal/k8s-hlf-budget-peer:1.0
> docker push siliconvalleysenegal/k8s-hlf-ca:1.0

docker push siliconvalleysenegal/k8s-hlf-siliconvalley-orderer:1.0
docker push siliconvalleysenegal/k8s-hlf-siliconvalley-orderer2:1.0
docker push siliconvalleysenegal/k8s-hlf-siliconvalley-orderer3:1.0
docker push siliconvalleysenegal/k8s-hlf-siliconvalley-orderer4:1.0
docker push siliconvalleysenegal/k8s-hlf-siliconvalley-orderer5:1.0
docker push siliconvalleysenegal/k8s-hlf-siliconvalley-peer:1.0
docker push siliconvalleysenegal/k8s-hlf-budget-peer:1.0
docker push siliconvalleysenegal/k8s-hlf-ca:1.0


6. Launch the cluster
=====================
** Replace the reference to images **
kubectl apply -f .\k8s-orderer.yaml
kubectl replace --force -f .\k8s-siliconvalley-orderer.yaml
kubectl replace --force -f .\k8s-siliconvalley-peer.yaml
kubectl replace --force -f .\k8s-budget-peer.yaml

PVC does not get deleted by default :)
> kubectl get pvc
> kubectl delete pvc --all
