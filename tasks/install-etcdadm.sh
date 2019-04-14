#!/bin/bash

ETCDADM_INSTALL_SCRIPT=`cat <<EOT
apt-get update \
&& apt-get install -y --no-install-recommends ca-certificates git golang-1.10 \
&& /usr/lib/go-1.10/bin/go get -u sigs.k8s.io/etcdadm \
&& cp /root/go/bin/etcdadm /out/
EOT
`

BUILDER_IMAGE=ubuntu:18.04

docker run --rm \
    -v /opt/bin:/out \
    $BUILDER_IMAGE /bin/bash -c "$ETCDADM_INSTALL_SCRIPT"
docker image rm $BUILDER_IMAGE
