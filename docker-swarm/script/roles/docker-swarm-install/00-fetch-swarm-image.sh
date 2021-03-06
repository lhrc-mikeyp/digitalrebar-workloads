#!/bin/bash
[[ -x /usr/local/bin/swarm ]] && exit 0
curl -fgLO https://s3-us-west-2.amazonaws.com/rackn-swarm/swarm-linux-amd64
curl -fgLO https://s3-us-west-2.amazonaws.com/rackn-swarm/swarm-linux-amd64.sha256sum
if ! sha256sum -c swarm-linux-amd64.sha256sum; then
    echo "Swarm download corrupted"
    exit 1
fi
mv swarm-linux-amd64 /usr/local/bin/swarm
chmod 755 /usr/local/bin/swarm
rm swarm-linux-amd64.sha256sum
