#!/bin/bash

echo -e "---------- Checking for updates... ----------\n"

STATUS=$(git pull)

if [ "$STATUS" != "Already up to date." ]; then
  echo "---------- Clean Build ----------"
  cargo clean
  echo "---------- Build Start ----------"
  cargo build --release
  echo "---------- Build finished!!! ----------"
  rm -rf $HOME/.cargo/bin/snarkos
  cp $PWD/target/release/snarkos $HOME/.cargo/bin/snarkos
else
  echo "Already up to date!!"
fi
