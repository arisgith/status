#!/bin/bash

LIST=$(mktemp)
TARGET=$(mktemp)
BASE=/ftp/opensuse
DIST=$BASE/distribution/
TARGET=/ftp/iso/opensuse/

rm -rf $TARGET/*

cd $BASE
find distribution/ -maxdepth 1 -type d > /tmp/opensuse
sed -e 's/distribution\///g' -e '1d' /tmp/opensuse > $LIST

cat $LIST | while read release
	do
	cd $TARGET
	ln -s ../../opensuse/distribution/$release/iso $release
done
#ln -s ../../opensuse/distribution/11.4/iso/ 11.4

rm $LIST

