#!/bin/bash

ETCDADM_INSTALL_SCRIPT=`cat <<EOT
go get -u sigs.k8s.io/etcdadm \
&& cp /go/bin/etcdadm /out/
EOT
`

INSTALLER_IMAGE=golang:1.10

docker run --rm \
    -v /opt/bin:/out \
    $INSTALLER_IMAGE /bin/bash -c "$ETCDADM_INSTALL_SCRIPT"
docker image rm $INSTALLER_IMAGE
