#!/bin/bash

echo "Enter your miner address:";
read MINER_ADDRESS

if [ "${MINER_ADDRESS}" == "" ]
then
  echo "Please enter your miner address."
  exit 1
fi

pid=$(pidof snarkos)
if [ $pid > 0 ]; then
    echo -e "---------- check snarkos running process ---------\n"
    echo -e "---------- kill current snarkos process ----------\n"
    kill -15 $pid
    sleep 3
    echo -e "---------- check snarkos was killed ----------\n"
    ps -ef | grep snarkos
fi

rm -rf $HOME/.cargo/bin/snarkos
cp $PWD/target/debug/snarkos $HOME/.cargo/bin/snarkos
snarkos --prover $MINER_ADDRESS --pool 95.214.55.117:4132 --verbosity 2 >> /var/log/aleo/aleo.log 2>&1 &
echo -e "---------- Run Aleo prover node ----------\n"
tail -f /var/log/aleo/aleo.log
