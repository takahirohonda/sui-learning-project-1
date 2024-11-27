## Curl SSL cert issue

```bash
curl: (60) SSL certificate problem: unable to get local issuer certificate
More details here: https://curl.se/docs/sslcerts.html
```

Use `-k` or `--insecure` -> This tells curl to proceed with the request even if the SSL certificate cannot be verified.

## Docker SSL cert issue

This happened when configuring devnet sui when typed `https://fullnode.testnet.sui.io:443` as the url.

Do `-itd -e DOCKER_TLS_VERIFY=0 mysten/sui-tools:devnet` instead of `-itd mysten/sui-tools:devnet`.

The error below happens if I don't configure sui client correctly...

`sui client` and add `https://fullnode.testnet.sui.io:443` as the network address.

## Publish issue

`sui client publish --gas-budget 2000000 ./hello_world` errors

```bash
Networking or low-level protocol error: HTTP error: error trying to connect: invalid peer certificate contents: invalid peer certificate: UnknownIssuer

Caused by:
    HTTP error: error trying to connect: invalid peer certificate contents: invalid peer certificate: UnknownIssuer
```
