# liquid-prometheus-exporter
A prom exporter for the liquidd/elementsd projects

## Docker

```
docker run -p 9111:9111 -e LIQUID_RPC_USER=liquidd -e LIQUID_RPC_PASS=pass -e LIQUID_RPC_HOST=mainnet.liquid.svc -e HTTP_LISTENADDR=":9111" -it --rm deviavir/liquid-prometheus-exporter:latest
```

## Props

Heavily inspired by https://github.com/arjunrn/bitcoin-prometheus-exporter
