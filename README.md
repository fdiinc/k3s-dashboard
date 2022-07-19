# Deploy the Kubernetes Dashboard to K3S

see: https://rancher.com/docs/k3s/latest/en/installation/kube-dashboard/

## TODO

This should run automatically as part of our Vagrant K3S provisioning.

## Instructions

### Deploy the Dashboard

```sh
01-deploy-dashboard.sh
```

### Create the access service

todo

### Obtain a login token

```sh
sudo k3s kubectl -n kubernetes-dashboard describe secret admin-user-token | grep '^token'
```

### Login

