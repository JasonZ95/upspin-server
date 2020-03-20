FROM golang:alpine as builder
RUN apk add --update git && go get upspin.io/cmd/...

FROM  alpine
MAINTAINER kratoszhou
RUN apk add --update ca-certificates
COPY --from=builder /go/bin/upspinserver /usr/bin/
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["usr/bin/upspinserver"]