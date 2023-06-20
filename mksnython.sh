#!/bin/sh

set -e

CAP='cap_net_raw=eip'

if [ $# != 2 ]; then
    echo 1>&2 "usage: `basename $0` PYTHON DSTDIR"
    exit 1
fi
srcfile=$(realpath -e $1)
dstfile=$(realpath -e $2)/$(basename $srcfile)nx

if setcap -q -v $CAP $dstfile; then
  srcsum=$(sha256sum $srcfile | awk '{ print $1 }')
  dstsum=$(sha256sum $dstfile | awk '{ print $1 }')
  if [ $dstsum = $srcsum ]; then
    echo $dstfile
    exit 2
  fi
fi

tmpfile=$(mktemp --tmpdir=$(dirname $dstfile) XXXXXXXXXX)

cp --preserve=ownership,timestamp $srcfile $tmpfile
chown 0.nx-sniffers $tmpfile
chmod 0750 $tmpfile
mv $tmpfile $dstfile
setcap -q $CAP $dstfile
ln -sf $(basename $dstfile) $(echo $dstfile | sed 's/\.[^.]nx$/nx/')
echo $dstfile
