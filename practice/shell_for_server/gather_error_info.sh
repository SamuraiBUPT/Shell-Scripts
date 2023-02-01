#!/bin/bash

# Set 'logs' directory path
script_path=$(
    cd $(dirname $0)
    pwd
)

script_upper_PATH=$(
    cd $(dirname $0)
    cd ..
    pwd
)

LOGS_PATH=$script_upper_PATH/logs

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
    unzip -d $(dirname $0) $LOGS_PATH/$file
    log_name=$(ls $(dirname $0))
    log_name=$(echo $log_name)
    log_name=($log_name)
    log_name=${log_name[0]}
    echo "LOG_NAME is : ${log_name}"

    # find ERROR INFO
    touch ERROR_INFO.txt
    grep ERROR $script_path/$log_name >>ERROR_INFO.txt
    rm $script_path/$log_name
done

rm log_list.txt

cat ERROR_INFO.txt | heirloom-mailx -s "Error ${yesterday}" -t d31409163@163.com

rm ERROR_INFO.txt

# 0 12 * * * bash /opt/mcsmanager/daemon/data/InstanceData/0ceada06487e44cea1c3960c2909088f/shell_for_server/gather_error_info.sh
