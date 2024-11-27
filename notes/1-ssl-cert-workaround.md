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

https://forums.sui.io/t/sui-client-connection-refused/2346/7

maybe delete config? /root/.sui/sui_config/client.yam

```
sui client new-env --alias local --rpc http://127.0.0.1:9000
```

```bash
Networking or low-level protocol error: HTTP error: error trying to connect: invalid peer certificate contents: invalid peer certificate: UnknownIssuer

Caused by:
    HTTP error: error trying to connect: invalid peer certificate contents: invalid peer certificate: UnknownIssuer
```

Some more errors;

```
Cannot find gas coin for signer address 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c with amount sufficient for the required gas budget 2000000. If you are using the pay or transfer commands, you can use pay-sui or transfer-sui commands instead, which will use the only object as gas payment.
```
