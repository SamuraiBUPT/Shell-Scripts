#!/bin/bash

echo "Shell Script 【run.sh】 starts working..."
echo " _____                                              _ "
echo "/  ___|                                            (_)"
echo "\ \`--.    __ _   _ __ ___    _   _   _ __    __ _   _ "
echo " \`--. \  / _\` | | '_ \` _ \  | | | | | '__|  / _\` | | |"
echo "/\__/ / | (_| | | | | | | | | |_| | | |    | (_| | | |"
echo "\____/   \__,_| |_| |_| |_|  \__,_| |_|     \__,_| |_|"

min_RAM=2
max_RAM=8

javaVersion=
function checkJavaVersion() {
    basicstr=$(java -version 2>&1 | sed '1!d')
    if [[ -z $basicstr ]]; then
        return 255
    fi

    echo ${javaVersion:=$(echo $basicstr | sed -e 's/"//g' | awk '{print $3}')}

    if [[ $javaVersion != "17.0.1" ]]; then
        echo "Your java version is:$javaVersion, which may not support our server client."
        echo "Recommended java version:17.0.1"
    else
        echo "Your java version is:$javaVersion, supported."
    fi
    return 0
}

checkJavaVersion
# java -server -Xms${min_RAM}G -Xmx${max_RAM}G -jar -XX:+UseG1GC mohist-1.16.5-1096-server.jar --nogui
