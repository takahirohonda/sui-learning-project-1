# Staring a new sui project

This will initialise a Hello World Sui package and create a hello world project folder.

See details here (https://github.com/sui-foundation/sui-move-intro-course/blob/main/unit-one/lessons/2_sui_project_structure.md).

```bash
sui move new hello_world
```

```bash
sui client publish --gas-budget 2000000 ./hello_world
```

Note that container needs to have git installed `apt install git`.

# Local network

https://huggingface.co/spaces/666lcz/knowledge_base/blob/main/doc-examples/build/sui-local-network.md

```bash
# Start
docker exec -it hellosui bash
RUST_LOG="off,sui_node=info" sui start --with-faucet --force-regenesis

# make sure to add some coins from the faucet
sui client faucet
sui client gas # check the gas coin

# Then publish
sui client publish --gas-budget 20000000 ./hello_world
```

```bash
> sui client gas
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x5657d5870729fe7ba53d849728e145733a96153b9eff809b9e9bd846b0744479 │ 200000000000       │ 200.00           │
│ 0x57ede259ab4505271415e82fc1fab3b3cfe08d08a57e3ff63fbb8e30341300cf │ 200000000000       │ 200.00           │
│ 0x5dd58ff098c7ba8d3dfae9cd01272ccef7673ef1a181dd0d4d37155e905bd5aa │ 200000000000       │ 200.00           │
│ 0xce690017066746adec6d6300d36741f0671450111a3471e025f237ea72ea30d3 │ 200000000000       │ 200.00           │
│ 0xdf6143611adfd3f62f0697caaf295497c5ed4356f384cfea52e48d3bf3fe305b │ 200000000000       │ 200.00           │
```

## Proble with insufficient gas -> Error executing transaction 'Burz8Tib8H6jWV3umx82gWwiAwB6gmFMYmAWezcuHY5x': InsufficientGas

This was because I didn't set the gas-budget correctly...

```bash
root@665633f9d211:/sui# sui client publish --gas-budget 2000000 ./hello_world
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
From https://github.com/MystenLabs/sui
 * [new tag]               sui_v1.39.0_1732672595_ci -> sui_v1.39.0_1732672595_ci
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
Error executing transaction 'Burz8Tib8H6jWV3umx82gWwiAwB6gmFMYmAWezcuHY5x': InsufficientGas
```

It got fixed after setting the gas budget correctly..

```bash
root@665633f9d211:/sui# sui client publish --gas-budget 20000000 ./hello_world
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
Transaction Digest: 9Yedezh4Mry8SP1BACS4H6mmHywZpX41dTsPCBfPQgwH
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c                                   │
│ Gas Owner: 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c                                │
│ Gas Budget: 20000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x5657d5870729fe7ba53d849728e145733a96153b9eff809b9e9bd846b0744479                                    │
│  │ Version: 3                                                                                                │
│  │ Digest: GiMbo6JQ2UUAgqPvwZy13pXSUsPUASmXvDrMNpmfcdAw                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    +YvnDnWINsPhjXnMNahy85F5LyZM20vfiNrjVD3qmZoicLmj++gzDafJXllMAILz+F/v7vB1HK8Im51vUwIfDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9Yedezh4Mry8SP1BACS4H6mmHywZpX41dTsPCBfPQgwH                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 3                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x9bfdb8917d540b4d4ccd3c79fc4112853e8e82bf41cd4e6a1c4fd24396dbafea                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 3euMa7Fsfe78S98EBCKr14aB7CgJAF1j2F6Gy8TD5KXa                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf1bb18305be020738e59e5ffc9c3038b5e392e89ae4a67182643f34695942aa2                         │
│  │ Owner: Account Address ( 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c )  │
│  │ Version: 4                                                                                     │
│  │ Digest: H761bNwzKMsQG1UFEyfH3fR2MRpHzQ1uhiViMJSZjbzV                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5657d5870729fe7ba53d849728e145733a96153b9eff809b9e9bd846b0744479                         │
│  │ Owner: Account Address ( 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c )  │
│  │ Version: 4                                                                                     │
│  │ Digest: GdrMirEhk4nMrQ981GxZ1zi4SryjR2PhxfcN766J5ipE                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5657d5870729fe7ba53d849728e145733a96153b9eff809b9e9bd846b0744479                         │
│  │ Owner: Account Address ( 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c )  │
│  │ Version: 4                                                                                     │
│  │ Digest: GdrMirEhk4nMrQ981GxZ1zi4SryjR2PhxfcN766J5ipE                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 5168000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Burz8Tib8H6jWV3umx82gWwiAwB6gmFMYmAWezcuHY5x                                                   │
│    GUViinyGps4GoLSond8T5GxZNn8wrGpV1kjJ4BqgFZsX                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xf1bb18305be020738e59e5ffc9c3038b5e392e89ae4a67182643f34695942aa2                  │
│  │ Sender: 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c                    │
│  │ Owner: Account Address ( 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 4                                                                                    │
│  │ Digest: H761bNwzKMsQG1UFEyfH3fR2MRpHzQ1uhiViMJSZjbzV                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x5657d5870729fe7ba53d849728e145733a96153b9eff809b9e9bd846b0744479                  │
│  │ Sender: 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c                    │
│  │ Owner: Account Address ( 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 4                                                                                    │
│  │ Digest: GdrMirEhk4nMrQ981GxZ1zi4SryjR2PhxfcN766J5ipE                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x9bfdb8917d540b4d4ccd3c79fc4112853e8e82bf41cd4e6a1c4fd24396dbafea                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 3euMa7Fsfe78S98EBCKr14aB7CgJAF1j2F6Gy8TD5KXa                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x57fd48324fe82cd2cc2eb1e463f13929708ee88ef1c363e580d0f8ed8524d53c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -5189880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
