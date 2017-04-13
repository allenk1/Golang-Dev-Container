# Grab the latests AmazonLinux base container
FROM amazonlinux

# GOLANG Vars
ENV VERSION "1.8.1"
ENV OS "linux"
ENV ARCH "amd64"

# Set new Path
ENV "GOPATH=/go"
ENV "PATH=$PATH:/usr/local/go/bin:$GOPATH/bin"

# Base Install
RUN mkdir /go
RUN yum install -y wget git
RUN wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz -P /tmp && \
    tar -C /usr/local -xzf /tmp/go$VERSION.$OS-$ARCH.tar.gz

# Configure GO
RUN go get github.com/tockins/realize

# Clenaup
RUN rm -rf /tmp/*
RUN yum clean all
CMD ["/bin/bash"]


# To run the App
# 1. Use the following run command
# docker run -p 5001:5001 -p <hostport>:<goserverport> -v $GOPATH/src/<path>/<to>/<app>:/go/src/<path>/<to></app> watchguard/golang-dev-container realize --name="AppName" --server