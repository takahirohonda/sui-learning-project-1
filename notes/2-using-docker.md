# 1. Using commands

```bash
# exposing 9000 to 9001
docker run --platform linux/amd64 --name hellosui -itd -e DOCKER_TLS_VERIFY=0 -v $(pwd):/sui -p 9001:9000 mysten/sui-tools:devnet
docker exec -it hellosui bash

# Start local
RUST_LOG="off,sui_node=info" sui start --with-faucet --force-regenesis
# Now hitting port 9001 will give us the access to the local network
curl -k --location --request POST 'http://127.0.0.1:9001' --header 'Content-Type: application/json' --data-raw '{"jsonrpc": "2.0","id": 1,"method": "sui_getTotalTransactionBlocks","params": []}'
```

**Play inside docker container**

```bash
docker exec -it hellosui bash
apt install git
docker exec -it hellosui bash

# Make sure the local network is working... RUST_LOG="off,sui_node=info" sui start --with-faucet --force-regenesis

# configure with http://127.0.0.1:9000
sui client
# make sure to add some coins from the faucet
sui client faucet
sui client gas # check the gas coin
# check address
sui keytool list

# Then publish
sui client publish --gas-budget 20000000 ./hello_world
```

```
root@9e651cc3c2e6:/sui# sui client
Config file ["/root/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?y
Sui Full node server URL (Defaults to Sui Testnet if not specified) : http://127.0.0.1:9000
Environment alias for [http://127.0.0.1:9000] : local
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1):
0
Generated new keypair and alias for address with scheme "ed25519" [wonderful-coral: 0x0f41fb55d50527f834050cf2bca173fa927a062a791e17227c128e4fd8f0f42c]
Secret Recovery Phrase : [drip swarm try execute library myself crane rebuild core borrow current soccer]
Client for interacting with the Sui network
```

Connecting to wallet -> use the Secret Recovery Phrase from the console.

Wallet needs to be configured with custom network address...

# 2. Using Dockerfile

Note that the -v $(pwd):/sui option in the docker run command still needs to be provided to map your local directory ($(pwd)) to the /sui folder inside the container. Dockerfiles cannot directly define host-to-container volume mappings.

```bash
docker build -t custom-sui-tools .
docker run --platform linux/amd64 --name hellosui -itd -v $(pwd):/sui custom-sui-tools
```
