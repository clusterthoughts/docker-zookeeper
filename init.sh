#!/bin/sh

if [ $LISTEN_ADDRESS ] && [ $ZOO_ID ]; then
    echo $ZOO_ID > /var/lib/zookeeper/myid
    echo $ENSEMBLE_IPS >> /opt/zookeeper/conf/zoo.cfg

    echo "Zoo ID: $ZOO_ID\n Ensemble:\n $ENSEMBLE_IPS"
fi

echo Starting ZooKeeper