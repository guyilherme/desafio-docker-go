FROM golang AS build

WORKDIR /go/hello

COPY hello.go /go/hello

RUN go mod init hello

RUN go build

FROM scratch
COPY --from=build /go/hello/hello /go/hello
ENTRYPOINT ["/go/hello"]