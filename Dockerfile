FROM golang:1.17-alpine AS builder

ENV GO111MODULE="on"
ENV CGO_ENABLED="0"

RUN apk add --update git

RUN mkdir -p /go/src/github.com/DeviaVir/liquid-prometheus-exporter

COPY . /go/src/github.com/DeviaVir/liquid-prometheus-exporter

RUN cd /go/src/github.com/DeviaVir/liquid-prometheus-exporter \
 && go mod vendor \
 && go build \
      -mod vendor \
      -o /go/bin/liquid-prometheus-exporter

FROM gcr.io/distroless/base-debian11
COPY --from=builder /go/bin/liquid-prometheus-exporter /
CMD ["/liquid-prometheus-exporter"]