#! /bin/bash

set -ex

# Downloading / Deploying Dashboard
GITHUB_URL=https://github.com/kubernetes/dashboard/releases
VERSION_KUBE_DASHBOARD=$(curl -w '%{url_effective}' -I -L -s -S ${GITHUB_URL}/latest -o /dev/null | sed -e 's|.*/||')
sudo k3s kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${VERSION_KUBE_DASHBOARD}/aio/deploy/recommended.yaml

# Deploy admin-user
sudo k3s kubectl apply -f resources/dashboard.admin-user.yml -f resources/dashboard.admin-user-role.yml
