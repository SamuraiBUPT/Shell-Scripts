#!/bin/bash

# Set 'logs' directory path
LOGS_PATH="../logs/"

# Get yesterday date, which helps grep certain logs
yesterday=$(date -d yesterday +%Y%m%d)
actual_date=-${yesterday:4:2}-${yesterday:6:2}-
echo $actual_date

for fileName in $(echo $(ls $LOGS_PATH)); do
    if [[ $fileName =~ $actual_date ]]; then
        touch log_list.txt
        echo $fileName >>log_list.txt
    fi
done

for file in $(cat log_list.txt); do
    unzip $LOGS_PATH/$file
    log_name=$(ls $(dirname $0))
    log_name=$(echo $log_name)
    log_name=($log_name)
    log_name=${log_name[0]}

    # find ERROR INFO
    touch ERROR_INFO.txt
    grep ERROR $log_name >>ERROR_INFO.txt
    rm $log_name
done

rm log_list.txt

cat ERROR_INFO.txt | heirloom-mailx -s "Error ${yesterday}" -t d31409163@163.com

rm ERROR_INFO.txt
