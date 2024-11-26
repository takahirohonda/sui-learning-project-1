# Sui Learning Projects 1

## 1. Setup local dev environment

```bash
docker pull mysten/sui-tools:devnet
# Start - not sure if I need the port mapping... No doc mentioned it
docker run --platform linux/amd64 --name hellosui -itd -p 9000:9000 mysten/sui-tools:devnet
# This is what the doc says...
docker run --platform linux/amd64 --name hellosui -itd mysten/sui-tools:devnet
docker exec -it hellosui bash
# Start the local network
RUST_LOG="off,sui_node=info" sui start --with-faucet --force-regenesis

# Connect Sui CLI to local network
sui client new-env --alias local --rpc http://127.0.0.1:9000
sui client switch --env local

# stop
docker stop hellosui
docker rm hellosui
```

Check

```bash
curl --location --request POST 'http://127.0.0.1:9000' --header 'Content-Type: application/json' --data-raw '{"jsonrpc": "2.0","id": 1,"method": "sui_getTotalTransactionBlocks","params": []}'
```

In progress..

Starting the local network (https://docs.sui.io/guides/developer/getting-started/local-network)

```bash
RUST_LOG="off,sui_node=info" sui start --with-faucet --force-regenesis
```

https://medium.com/@muiak/sui-and-docker-quick-start-guide-for-developers-20f12252b8f7
