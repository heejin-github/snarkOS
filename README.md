<p align="center">
    <img alt="snarkOS" width="1412" src="https://cdn.aleo.org/snarkos/banner.png">
</p>

<p align="center">
    <a href="https://circleci.com/gh/AleoHQ/snarkOS"><img src="https://circleci.com/gh/AleoHQ/snarkOS.svg?style=svg&circle-token=6e9ad6d39d95350544f352d34e0e5c62ef54db26"></a>
    <a href="https://codecov.io/gh/AleoHQ/snarkOS"><img src="https://codecov.io/gh/AleoHQ/snarkOS/branch/master/graph/badge.svg?token=cck8tS9HpO"/></a>
    <a href="https://discord.gg/5v2ynrw2ds"><img src="https://img.shields.io/discord/700454073459015690?logo=discord"/></a>
</p>

## <a name='TableofContents'></a>Table of Contents

* [1. Overview](#1-overview)
    * [1.1 Commission](#11-commission)
* [2. Build Guide](#2-build-guide)
    * [2.1 Requirements](#21-requirements)
    * [2.2 Installation](#22-installation)
* [3. Run an Aleo Prover Node](#3-run-an-aleo-prover-node)
* [4. Update SnarkOS](#4-update-snarkos)

## 1. Overview

__snarkOS__ is a decentralized operating system for private applications. It forms the backbone of [Aleo](https://aleo.org/) and
enables applications to verify and store state in a publicly verifiable manner.

- Node Types in Aleo mining pool
  - Operator : An operating node is a full node, capable of coordinating provers in a pool.
  - Prover : A proving node is a full node, capable of producing proofs for a pool.
You can join our mining pool as a prover, prover will be contributed to the probability of finding a block.
and operator will broadcast mined block over a network, and split the reward equally to provers.

### 1.1 Commission
**NO COST, NO COMMISSION**

We'll open our mining pool for all community members, and our mining pool operated at NO COST and NO COMMISSION.

## 2. Build Guide

### 2.1 Requirements

The following are **minimum** requirements to run an Aleo node:
 - **CPU**: 16-cores (32-cores preferred)
 - **RAM**: 16GB of memory (32GB preferred)
 - **Storage**: 128GB of disk space
 - **Network**: 50 Mbps of upload **and** download bandwidth

Please note to run an Aleo mining node that is **competitive**, the machine will require more than these requirements.

### 2.2 Installation

> Before beginning, please ensure your machine has `Rust v1.56+` installed. Instructions to [install Rust can be found here.](https://www.rust-lang.org/tools/install)
>
> **[For Ubuntu users]** You can skip Rust installation. It was included in helper script as below instructions.

Start by cloning the snarkOS Github repository:
```
git clone -b feat/mining-pool https://github.com/dsrvlabs/snarkOS.git --depth 1
```

Next, move into the snarkOS directory:
```
cd snarkOS
```

**[For Ubuntu users]** A helper script to install dependencies is available. From the snarkOS directory, run:
```
./testnet2_ubuntu.sh
```

## 3. Run an Aleo Prover Node

Start by following the instructions in the [Build Guide](#2-build-guide).

Next, to generate an Aleo miner address, run:
```
snarkos experimental new_account 
```
or from the snarkOS directory, run:
```
cargo run --release -- experimental new_account
```
This will output a new Aleo account in the terminal.

**Please remember to save the account private key and view key.** The following is an example output:
```
 Attention - Remember to store this account private key and view key.

  Private Key  APrivateKey1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  <-- Save Me
     View Key  AViewKey1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  <-- Save Me
      Address  aleo1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  <-- Use Me For The Next Step
```

Next, to start a prover node, from the snarkOS directory, run:
```
./start-prover.sh
```

When prompted, enter your Aleo miner address:
```
Enter your Aleo miner address:
aleo1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
---------- Run Aleo prover node ----------


         ╦╬╬╬╬╬╦
        ╬╬╬╬╬╬╬╬╬                    ▄▄▄▄        ▄▄▄
       ╬╬╬╬╬╬╬╬╬╬╬                  ▐▓▓▓▓▌       ▓▓▓
      ╬╬╬╬╬╬╬╬╬╬╬╬╬                ▐▓▓▓▓▓▓▌      ▓▓▓     ▄▄▄▄▄▄       ▄▄▄▄▄▄
     ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬              ▐▓▓▓  ▓▓▓▌     ▓▓▓   ▄▓▓▀▀▀▀▓▓▄   ▐▓▓▓▓▓▓▓▓▌
    ╬╬╬╬╬╬╬╜ ╙╬╬╬╬╬╬╬            ▐▓▓▓▌  ▐▓▓▓▌    ▓▓▓  ▐▓▓▓▄▄▄▄▓▓▓▌ ▐▓▓▓    ▓▓▓▌
   ╬╬╬╬╬╬╣     ╠╬╬╬╬╬╬           █▓▓▓▓▓▓▓▓▓▓█    ▓▓▓  ▐▓▓▀▀▀▀▀▀▀▀▘ ▐▓▓▓    ▓▓▓▌
  ╬╬╬╬╬╬╣       ╠╬╬╬╬╬╬         █▓▓▓▌    ▐▓▓▓█   ▓▓▓   ▀▓▓▄▄▄▄▓▓▀   ▐▓▓▓▓▓▓▓▓▌
 ╬╬╬╬╬╬╣         ╠╬╬╬╬╬╬       ▝▀▀▀▀      ▀▀▀▀▘  ▀▀▀     ▀▀▀▀▀▀       ▀▀▀▀▀▀
╚╬╬╬╬╬╩           ╩╬╬╬╬╩

Welcome to Aleo! We thank you for running a network node and supporting privacy.

Your Aleo address is aleo1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Starting a proving node on testnet2.


 ==================================================================================================

                         Welcome to Aleo Testnet2 - Incentivization Period

 ==================================================================================================

```
## 4. Update SnarkOS
Run update script to keep the snarkOS up to date.
```
./update.sh
---------- Checking for updates... ----------

pull updated codes

---------- Clean Build ----------
---------- Build Start ----------
   Compiling libc v0.2.112
   Compiling proc-macro2 v1.0.34
   Compiling unicode-xid v0.2.2
   Compiling cfg-if v1.0.0
...
   Compiling rocksdb v0.17.0
   Compiling snarkos-storage v2.0.0
   Compiling snarkos v2.0.0
    Finished release [optimized] target(s) in xm xxs
---------- Build finished!!! ----------

```
After Build finished, Run prover node with up to dated snarkOS.
```
./run-prover.sh
```
Nothing will be happened, If the snarkOS already up to date.
```
./update.sh

---------- Checking for updates... ----------

From https://github.com/dsrvlabs/snarkOS
 * branch              testnet2   -> FETCH_HEAD
Already up to date!!
```

### Status Report

After the proving node has booted up, a periodic report is provided with the status of node:
```
DEBUG Status Report (type = Prover, status = Mining, block_height = 95372, cumulative_weight = 23089354694, block_requests = 0, connected_peers = 1)
INFO Prover found unconfirmed block 95373 for share target
TRACE Sending 'PoolResponse' to 95.214.55.117:4132
TRACE Sending 'PoolRegister' to 95.214.55.117:4132
TRACE Received 'PoolRequest' from 95.214.55.117:4132
```

## License

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](./LICENSE.md)
