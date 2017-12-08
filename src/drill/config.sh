#!/bin/sh

echo "Zookeeper: $ZOOKEEPER"
echo "drill.exec: {
  cluster-id: \"drillbits1\",
  zk.connect: \"$ZOOKEEPER\",
  drill.exec.sys.store.provider.local.path=\"/tmp/drill\"  
}
" > /opt/drill/conf/drill-override.conf
