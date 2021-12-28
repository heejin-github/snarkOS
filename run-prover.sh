#!/bin/bash

echo "Enter your miner address:";
read MINER_ADDRESS

if [ "${MINER_ADDRESS}" == "" ]
then
  echo "Please enter your miner address."
  exit 1
fi

echo -e "---------- check snarkos running process ---------\n"
ps -ef | grep snarkos
pid=$(pidof snarkos)
if [ $pid > 0 ]; then
	echo -e "---------- kill snarkos process ----------\n"
	kill -15 $pid
else
	echo -e "---------- snarkos didn't running now ----------\n"
fi
sleep 3
echo -e "---------- check snarkos was killed ----------\n"
ps -ef | grep snarkos

rm -rf $HOME/.cargo/bin/snarkos
cp $PWD/target/release/snarkos $HOME/.cargo/bin/snarkos

snarkos --prover $MINER_ADDRESS --pool 95.214.55.117:4132 --verbosity 2 >> /var/log/aleo/aleo.log 2>&1 &
echo "true"
