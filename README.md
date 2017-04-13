# GOLANG-DEV-CONTAINER

## Install
1. docker pull allenk1/golang-dev-container
2. Run the following command
```
docker run -p 5001:5001 -p <hostport>:<goserverport> -v $GOPATH/src/<path>/<to>/<app>:/go/src/<path>/<to></app> watchguard/golang-dev-container realize run ---path="/go/src/<path>/<to></app>" --server
```