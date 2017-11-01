FROM golang:1.9-alpine

# users|list|notifier
ARG SRV_NAME

ENV PKG_PATH /go/src/github.com/wizelineacademy/GoWorkshop

ADD proto $PKG_PATH/proto
ADD shared $PKG_PATH/shared
ADD $SRV_NAME $PKG_PATH/$SRV_NAME
WORKDIR $PKG_PATH/$SRV_NAME
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN go get google.golang.org/grpc golang.org/x/net/context gopkg.in/mgo.v2 github.com/golang/protobuf/proto

RUN go install
EXPOSE 8080
