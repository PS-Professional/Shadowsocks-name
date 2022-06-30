#!/usr/bin/env bash

help(){
    echo "Usage:"
    echo "    ./ss.sh -i INPUT -o OUTPUT"
    echo "or"
    echo "    ./ss.sh CONFIG  #single config and output in console"
}

ip_manager(){
    curl -s -H "User-Agent: keycdn-tools:https://www.google.com" https://tools.keycdn.com/geo.json\?host\=$1 | json_pp -json_opt pretty,canonical | sed -e 's/"//g' -e 's/ *//g' -e 's/,//g' > /tmp/ipinfo.txt
    country_code=`cat /tmp/ipinfo.txt | grep 'country_code' | cut -d ':' -f 2`
    country=`cat /tmp/ipinfo.txt | grep 'country_name' | cut -d ':' -f 2`
    flag=`cat FlagDB | grep $country_code | cut -d ' ' -f 2`
    rm /tmp/ipinfo.txt
}

ss_run(){
    IP=`echo $@ | cut -d '@' -f 2 | cut -d ':' -f 1`
    CONFIG=`echo $@ | cut -d '#' -f 1` || `echo $line`
    ip_manager $IP
    NAME=`echo "$flag$country($country_code)"`
}

if [ $1 = "-i" ]
then
    INPUT=`echo $2`
    OUTPUT=`echo $4`
    count=`uniq $INPUT | wc -l`
    step=1
    for line in `cat $INPUT | uniq`
    do
        ss_run $line
        echo "$CONFIG#$NAME" | tee -a $OUTPUT
        echo "$step/$count"
        step=$(($step+1))
    done
else
    Test=`echo $1 | cut -d ':' -f 1`
    if [ $Test = "ss" ]
    then
        ss_run $1
        echo "$CONFIG#$NAME"
    else
        help
    fi
fi 2>/dev/null