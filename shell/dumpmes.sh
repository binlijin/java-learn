#!/bin/sh

topthread=`top -bn1 -p $1 -H|awk 'NR==8{print $1}'`
echo $topthread
topthread=`printf "%x\n" $topthread`
echo $topthread

jstack $1|grep $topthread -A 30

