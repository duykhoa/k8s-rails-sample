# Kind

```sh
  kind create cluster --name homedev
```

To turn off cluster, use:

```sh
  docker stop homedev-control-plane
```

# Create redis cluster

## Get all redis pod ip

```sh
  kubectl get pods -l app=redis -n redis -o jsonpath='{range.items[*]}{.status.podIP}:6379
```

## Create cluster

Login into a pod

```sh
  redis-cli --cluster create ${redis-hosts} --cluster-replicas 1
```

## Notes

- Need min 3 nodes to form a cluster
- To get replicas 1, it requires to have min 6 nodes

# Install Kubefwd on Arch linux

```sh
  yay -Syu kubefwd-bin
```

# Access Postgres from the machine

I like the idea to have the Kubernetes cluster manages all softwares required for development.
Docker is good but I need to start each individual containers.

Docker Compose is old date fashion, but a sharping tool. However, Kubernetes is sexy, hell yeah.

When I write code, I need to run it directly from my machine.

So I need to connect my code to the service from the Kubernetes cluster.

Hence my idea is to:

- Create a kubernetes service with type nodeport
- Find the nodeport ip

```bash
kubectl get nodes -o wide --no-headers | awk '{print $6}'
```

