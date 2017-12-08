#!/bin/bash



echo "" >> /opt/storm/conf/storm.yaml
echo "storm.zookeeper.servers:" >> /opt/storm/conf/storm.yaml
echo " - \"$ZOOKEEPER\"" >> /opt/storm/conf/storm.yaml
echo "" >> /opt/storm/conf/storm.yaml
echo "nimbus.seeds:" >> /opt/storm/conf/storm.yaml
echo " - \"$NIMBUS\"" >> /opt/storm/conf/storm.yaml
echo "" >> /opt/storm/conf/storm.yaml
echo "supervisor.slots.ports:" >> /opt/storm/conf/storm.yaml
echo " - 6701" >>  /opt/storm/conf/storm.yaml
echo " - 6702" >>  /opt/storm/conf/storm.yaml
echo "" >>  /opt/storm/conf/storm.yaml
echo "ui.port: 8080" >> /opt/storm/conf/storm.yaml
echo "storm.local.dir: \"/var/lib/storm\"" >> /opt/storm/conf/storm.yaml 
echo "drpc.childopts: \"-Xmx384m\"" >> /opt/storm/conf/storm.yaml
echo "nimbus.childopts: \"-Xmx384m\"" >> /opt/storm/conf/storm.yaml
echo "worker.childopts: \"-Xmx512m\"" >> /opt/storm/conf/storm.yaml



