FROM golang:alpine AS builder

ENV GO111MODULE="on"
ENV CGO_ENABLED="0"

RUN mkdir -p /go/src/github.com/DeviaVir/liquid-prometheus-exporter

COPY . /go/src/github.com/DeviaVir/liquid-prometheus-exporter

RUN cd /go/src/github.com/DeviaVir/liquid-prometheus-exporter \
 && go mod vendor \
 && go build \
      -mod vendor \
      -o /go/bin/liquid-prometheus-exporter

FROM alpine
COPY --from=builder /go/bin/liquid-prometheus-exporter /usr/local/bin/liquid-prometheus-exporter
CMD ["/usr/local/bin/liquid-prometheus-exporter"]
