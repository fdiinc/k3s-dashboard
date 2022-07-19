# Deploy the Kubernetes Dashboard to K3S

see: https://rancher.com/docs/k3s/latest/en/installation/kube-dashboard/

## TODO

This should run automatically as part of our Vagrant K3S provisioning.

## Instructions

### Obtain a login token to use in next step

```sh
sudo k3s kubectl -n kubernetes-dashboard describe secret admin-user-token | grep '^token'
```

### Deploy the Dashboard

```sh
01-deploy-dashboard.sh
```

### Access the Dashboard 

#### via access service

You can have the service listen on the clusterip with the below or just use the k3s proxy

```sh
sudo k3s kubectl -n kubernetes-dashboard apply -f resources/dashboard.service.yml
```

Get the IP address
```sh
kubectl get service -n kubernetes-dashboard kubernetes-dashboard
```

### Or use the Proxy

```
sudo k3s kubectl proxy
```

[http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/]

### Login

use the token from above