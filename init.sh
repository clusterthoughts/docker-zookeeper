#!/bin/sh

if [ "$ENSEMBLE_IPS" ] && [ "$ZOO_ID" ]; then
    echo "$ZOO_ID" > /var/lib/zookeeper/myid
    echo "\n$ENSEMBLE_IPS" | tr ',' '\n' >> /etc/zookeeper/conf/zoo.cfg

    echo "===> Zoo ID: $ZOO_ID\n===> Ensemble:"
    echo "$ENSEMBLE_IPS" | tr ',' '\n'
fi

echo Starting ZooKeeper

/etc/zookeeper/bin/zkServer.sh start-foreground