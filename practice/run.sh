#!/bin/bash

echo "Shell Script 【run.sh】 starts working..."
echo " _____                                              _ "
echo "/  ___|                                            (_)"
echo "\ \`--.    __ _   _ __ ___    _   _   _ __    __ _   _ "
echo " \`--. \  / _\` | | '_ \` _ \  | | | | | '__|  / _\` | | |"
echo "/\__/ / | (_| | | | | | | | | |_| | | |    | (_| | | |"
echo "\____/   \__,_| |_| |_| |_|  \__,_| |_|     \__,_| |_|"
echo ""
echo ""

min_RAM=2
max_RAM=8

server_require_jdk="17.0.1"

javaVersion=
function checkJavaVersion() {
    basicstr=$(java -version 2>&1 | sed '1!d')
    if [[ -z $basicstr ]]; then
        echo "You haven 't install jdk, or you haven 't add PATH: JAVA_HOME to your operator, please check your PATH or install one particular jdk."
        echo "Our jdk version is ${server_require_jdk}, please input: "
        echo "apt install openjdk-${server_require_jdk}-jre"
        echo "To finish installation."
        return 255
    fi

    javaVersion=$(echo $basicstr | sed -e 's/"//g' | awk '{print $3}')

    if [[ $javaVersion != $server_require_jdk ]]; then
        echo "Your java version is:$javaVersion, which may not support our server client."
        echo "Recommended java version:${server_require_jdk}"
    else
        echo "Your java version is:$javaVersion, supported."
    fi
    return 0
}

checkJavaVersion

echo ""
echo "Server mods list:"
ls -1 ./mods

# java -server -Xms${min_RAM}G -Xmx${max_RAM}G -jar -XX:+UseG1GC mohist-1.16.5-1096-server.jar --nogui
