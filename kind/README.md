# KinD

> For information on KinD (Kubernetes in Docker), [click here](https://kind.sigs.k8s.io/)

## Setup

### Prerequisites 

- `go` (check `dotfiles` for script)
- `kubectl`

```bash
$ GO111MODULE="on" go get sigs.k8s.io/kind@v0.8.0
```

## Create a cluster

### Basic

```bash
$ kind create cluster --name kind-example
$ kubectl cluster-info --context kind-kind
```

### 3 worker node cluster

> Good for testing deployments / taints etc

kind create cluster --config=config/nodes.yaml

## Delete a cluster

```bash
$ kind delete cluster --name kind-example
```
