# Sui Learning Projects 1

## 1. Setup local dev environment

```bash
docker pull mysten/sui-tools:devnet
# Start - not sure if I need the port mapping... No doc mentioned it
docker run --platform linux/amd64 --name hellosui -itd -p 9000:9000 mysten/sui-tools:devnet
# This is what the doc says...
docker run --platform linux/amd64 --name hellosui -itd -e DOCKER_TLS_VERIFY=0 -v $(pwd):/sui mysten/sui-tools:devnet
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

# -k for SSL certificate workaround
curl -k --location --request POST 'https://fullnode.testnet.sui.io:443' --header 'Content-Type: application/json' --data-raw '{"jsonrpc": "2.0","id": 1,"method": "sui_getTotalTransactionBlocks","params": []}'
```

In progress..

Starting the local network (https://docs.sui.io/guides/developer/getting-started/local-network)

```bash
RUST_LOG="off,sui_node=info" sui start --with-faucet --force-regenesis
```

https://medium.com/@muiak/sui-and-docker-quick-start-guide-for-developers-20f12252b8f7

###

Configuring the network with `sui client` command in the interactive mode.

1. At the prompt, type y and press Enter to connect to a Sui Full node server.
2. At the following prompt, type the address of the Testnet server (https://fullnode.testnet.sui.io:443) and press Enter.
3. At the following prompt, type testnet to give the network an alias and press Enter. You can use the alias in subsequent commands instead of typing the complete URL.
4. At the following prompt, type 0 and press Enter. The selection creates an address in the ed25519 signing scheme.
5. The response provides an alias for your address, the actual address ID, and a secret recovery phrase. Be sure to save this information for later reference. Because this is on the Testnet network, the security of this information is not as important as if it were on Mainnet.
6. In your terminal or console, use the following command to get SUI for your account.

```bash
$ sui client faucet
```

7. You can confirm that you received SUI by using the following command. There may be a delay in receiving coins depending on the activity of the network.

```bash
$ sui client gas
```

You are now connected to the Sui Testnet network and should have an account with available SUI.
