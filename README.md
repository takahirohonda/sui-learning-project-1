# Sui Learning Projects 1

## 1. Setup local dev environment

- (1) Set up the sui docker container

We are using the container so that we don't need to install anything in our local machine. Make sure to execute `docker run` from the root of this repo so that we can map this folder to the container.

```bash
docker pull mysten/sui-tools:devnet
# Start docker by mapping this directory to /sui in the container & mapping the host port 9001 to the container port 9000
docker run --platform linux/amd64 --name hellosui -itd -e DOCKER_TLS_VERIFY=0 -v $(pwd):/sui -p 9001:9000 mysten/sui-tools:devnet
```

- (2) Start local network in the container

```bash
# Start a terminal process for running local network.
docker exec -it hellosui bash
# Start the local network
RUST_LOG="off,sui_node=info" sui start --with-faucet --force-regenesis
```

- (3) Configure sui client and set up deployment

```bash
# Start the second termainal process to use sui client.
docker exec -it hellosui bash
# Configure client in an interactive mode -> add http://127.0.0.1:9000 (from inside the container, we connect to the local network launched inside the container).
# If you misconfigure and getting `invalid peer certificate contents: invalid peer certificate: UnknownIssuer` error, you misconfigured it. The local network has to be running while you're configuring it. If you get the error, delete sui config in `/root/.sui/sui_config.
sui client
```

- (4) Configure Suit wallet

Use [Sui Wallet](https://suiwallet.com/) because [Suiet](https://suiet.app/) doesn't let us configure the network manually. Import account by using the secret pass phrase from the successful sui client config command.

- (5) Get Sui into the account from local network.

```bash
# make sure to add some coins from the faucet
sui client faucet
# check the gas coin
sui client gas
```

- (6) Create a project and deploy

```bash
# this will create a project folder in the current directory. As we mapped this local directory to /sui when we started the container, this will create a folder with template.
sui move new hello_world
# Modify the move code and then publish
sui client publish --gas-budget 20000000 ./hello_world
```

- Other things you can do...

From the second terminal we can run curl. The container doesn't have curl installed, so need to install it first. `-k` for SSL certificate workaround.

```bash
apt install curl
curl -k --location --request POST 'http://127.0.0.1:9001' --header 'Content-Type: application/json' --data-raw '{"jsonrpc": "2.0","id": 1,"method": "sui_getTotalTransactionBlocks","params": []}'

# for the testnet
curl -k --location --request POST 'https://fullnode.testnet.sui.io:443' --header 'Content-Type: application/json' --data-raw '{"jsonrpc": "2.0","id": 1,"method": "sui_getTotalTransactionBlocks","params": []}'
```

To stop or remove container

```bash
docker stop hellosui
docker rm hellosui
```

## Reference

Starting the local network (https://docs.sui.io/guides/developer/getting-started/local-network)

Other useful sui client commands:

```bash
# Connect Sui CLI to local network
sui client new-env --alias local --rpc http://127.0.0.1:9000
sui client switch --env local
```
