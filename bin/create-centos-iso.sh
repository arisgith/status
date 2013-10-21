#!/bin/bash

LIST=$(mktemp)
TARGET=$(mktemp)

#$ find /ftp/centos/ -name 'isos'
#/ftp/centos/6.4/isos
#/ftp/centos/5.9/isos
#/ftp/centos/6/isos
#/ftp/centos/5/isos

rm -rf /ftp/iso/centos/*

find /ftp/centos/ -name 'isos' -type d > $LIST
sed -e 's/\// /g' $LIST | awk {'print$3'} > /tmp/rilis

cat /tmp/rilis | while read rilis
        do
#        if [ ! -d /ftp/iso/centos/$rilis ]; then
#                mkdir -p /ftp/iso/centos/$rilis/
#        fi
	cd /ftp/iso/centos/
#	ln -s ../../centos/5.9/isos/ 5.9
	ln -s ../../centos/$rilis/isos/ $rilis
	cd -
done
cp $LIST /tmp/list-centoscd
rm $LIST

