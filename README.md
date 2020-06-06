# k8_integration

docker build -t kind:v1 -f k8s_mock/Dockerfile k8s_mock

docker run -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/projects/k8_integration/k8s_mock/configs/:/configs kind:v1

docker run -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/projects/k8_integration/k8s_mock/configs/:/configs kind:v1 <cluster-name>

export KUBECONFIG="$HOME/projects/k8_integration/k8s_mock/configs/kube-config/config"

kubectl cluster-info --context kind-local-cluster

kind delete cluster --name local-cluster

