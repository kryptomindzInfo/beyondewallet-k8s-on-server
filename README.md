# Beyond Ewallet Demo 2022

## Script Details

All the scripts are present in _scripts_ folder.

- **startBeyondewalletOnK8s.sh** will setup the whole beyond ewallet setup.

- **teardownBeyondewalletOnK8s.sh** will teardown the whole Beyond Ewallet setup.

- Whenever crypto-config is updated, run **init-setup.sh** script.

- To setup only network run **setup-fabric-network.sh** script.

- To upgrade the chaincode run **upgradeChaincode.sh** script.

- merchant frontend and partner frontend is not used in demo that is why the docker version "demo2022" is not createted for them hence last used version "dev-test" is tagged.

- A Digital ocean server is used for demo. **"do-block-storage"** is a storage class created in Digital Ocean Portal.
  Note: Change the storage class name as per the settings.

To fetch the external node ip run following command:

```
kubectl get nodes -o wide | awk '{print $7}'
```

The above command will show all the node's external ips, use any one of the ip in combination with port to run any application.

**Ports:**

Infra Frontend: 30800
Customer Frontend: 31501
Merchant Frontend: 31502
Partner Frontend: 31503
Middleware: 30301
