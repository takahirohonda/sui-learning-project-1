# Random notes...

## Configuring Sui Client

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
