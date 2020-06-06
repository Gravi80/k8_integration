#!/bin/sh
set -x
CLUSTER_NAME=${1:-local-cluster}
#By default, the cluster access configuration is stored in ${HOME}/.kube/config if $KUBECONFIG environment variable is not set.
#We will keep kind cluster config in a separate config file

# SIGTERM-handler
term_handler() {
  kind delete cluster --name $CLUSTER_NAME
}

# setup handlers
# on callback, kill the last background process, which is `tail -f /dev/null` and execute the specified handler
trap 'kill ${!}; term_handler' SIGTERM


kind delete cluster --name $CLUSTER_NAME
if [ ! -d "/configs/kube-config" ]; then
  mkdir /configs/kube-config
fi
if [ ! -f "/configs/kube-config/config" ]; then
  touch /configs/kube-config/config
fi
export KUBECONFIG="/configs/kube-config/config"

# This will bootstrap a Kubernetes cluster using a pre-built node image
# you can find it on docker hub kindest/node.
kind create cluster --config /configs/cluster-config.yaml --name $CLUSTER_NAME

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done