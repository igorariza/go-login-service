#syntax=docker/dockerfile:1
FROM golang:alpine AS build

# Set necessary environmet variables needed for our image
ENV GO111MODULE=auto \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

RUN mkdir -p $GOPATH/src/github.com/cuembyio/vault-service && \
    apk add --no-cache gcc g++ git openssh-client ca-certificates postgresql postgresql-client

WORKDIR $GOPATH/src/github.com/cuemby/ccp-vault-service
#ENV GO111MODULE=on
ENV GOPRIVATE="github.com/cuembyio,github.com/cuembyio/*,github.com/cuemby,github.com/cuemby/*"

COPY . .

COPY config /root/

WORKDIR /root/.ssh/

RUN chmod 0600 *

COPY go.mod ./
COPY go.sum ./

RUN go mod download
COPY . .

RUN go build  ./main.go

# Expose port 8080 to the outside world
EXPOSE 8200


CMD ["./main"]