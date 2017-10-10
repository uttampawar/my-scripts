#!/bin/bash

INTERVAL="1"  # update interval in seconds
if [ -z "$1" ]; then
        echo
        echo usage: $0 [interface]
        echo
        echo e.g. $0 eth0
        echo
        exit
fi
IF=$1
while true
do
        R1=`cat /sys/class/net/$1/statistics/rx_bytes`
        T1=`cat /sys/class/net/$1/statistics/tx_bytes`
        RD1=`cat /sys/class/net/$1/statistics/rx_dropped`
        TD1=`cat /sys/class/net/$1/statistics/tx_dropped`
        sleep $INTERVAL
        R2=`cat /sys/class/net/$1/statistics/rx_bytes`
        T2=`cat /sys/class/net/$1/statistics/tx_bytes`
        RD2=`cat /sys/class/net/$1/statistics/rx_dropped`
        TD2=`cat /sys/class/net/$1/statistics/tx_dropped`
        RBPS=`expr $R2 - $R1`
        TBPS=`expr $T2 - $T1`
        TMBPS=`expr $TBPS / 1048576`
        RMBPS=`expr $RBPS  / 1048576`

        RDBPS=`expr $RD2 - $RD1`
        TDBPS=`expr $TD2 - $TD1`
        TDMBPS=`expr $TDBPS / 1048576`
        RDMBPS=`expr $RDBPS / 1048576`
        echo "TX $1: $TMBPS MB/s RX $1: $RMBPS MB/s, TXDropped : $TDMBPS MB/s, RXDropped: $RDMBPS MB/s"
done
