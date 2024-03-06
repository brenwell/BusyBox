# BusyBox with HTTPie-go

This version of the standard busybox container but adds an HTTPie executable. (busybox: https://busybox.net/about.html). Similar to https://github.com/joncrlsn/busybox but build for multi-architecture. It also has the CA certs for TLS.

Thank you to :

- The creators of HTTPie: https://httpie.org/
- Yusuke Nojima for creating a Go version of HTTPie: https://github.com/nojima/httpie-go
- Joncrlson for the original version: https://github.com/joncrlsn/busybox

Example usage with docker

```sh
docker run -it brenwell/busybox http GET httpbin.org/json
```

Example usage with Kubernetes

```sh
kubectl run --rm --restart=Never -n my-namespace --image=brenwell/busybox:latest busy-httpie -- http GET httpbin.org/json
```

Or interactive

```sh
kubectl run -it --rm --restart=Never -n my-namespace --image=brenwell/busybox:latest busy-httpie
```
