#!/bin/bash

NETWORK=albatross-1
CONFIG=~/.starsd/config
INITIAL_COINS=100000000ustarx

rm -rf $CONFIG/gentx && mkdir $CONFIG/gentx

for i in $NETWORK/gentx/*.json; do
  echo $i
  starsd add-genesis-account $(jq -r '.body.messages[0].delegator_address' $i) $INITIAL_COINS
  cp $i $CONFIG/gentx/
done
starsd collect-gentxs

cp $CONFIG/genesis.json $NETWORK
