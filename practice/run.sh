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

java -server -Xms${min_RAM}G -Xmx${max_RAM}G -jar -XX:+UseG1GC mohist-1.16.5-1096-server.jar --nogui
