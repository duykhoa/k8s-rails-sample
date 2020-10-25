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
