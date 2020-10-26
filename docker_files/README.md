## Forward postgres db port

 ```sh
   kubectl port-forward --address 0.0.0.0 service/postgres 35432:5432 -n postgres
 ```

 ## Find the ip of docker network

```sh
  ifconfig
```

or 

```sh
  ip addr
```

Update the `database.yml` with the host ip
