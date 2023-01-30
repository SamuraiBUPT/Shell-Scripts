#!/bin/bash

echo "Shell Script 【run.sh】 starts working..."
echo "The script is for Mohist Server Core."
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

echo ""
echo "Server mods list:"

modsNum=0
for i in $(ls ./mods); do
    echo $i
    let modsNum++
done
echo ""
echo "There are ${modsNum} mods on server."
echo ""

# set configurations
# paper.yml

# bukkit.yml
chmod 777 bukkit.yml
sed -i "s/monsters: [1-9][0-9]/monsters: 50/g" bukkit.yml
sed -i "s/animals: [1-9][0-9]/animals: 10/g" bukkit.yml
sed -i "s/water-animals: [1-9][0-9]/water-animals: 7/g" bukkit.yml
sed -i 's/water-ambient: [1-9][0-9]/water-ambient: 10/g' bukkit.yml
sed -i 's/ambient: [1-9][0-9]/ambient: 1/g' bukkit.yml

sed -i 's/period-in-ticks: [1-9][0-9][0-9]/period-in-ticks: 400/g' bukkit.yml

echo "[INFO]:[bukkit.yml] configuration complete."
# server.properties
config_server=server.properties
sed -i '/view-distance/s/10/7/g' $config_server
sed -i '/view-distance/s/[0-9]/7/g' $config_server

view_distance_complete=$(grep "view-distance" $config_server)
view_distance=${view_distance_complete:14:1}

sed -i '/max-players/s/[1-9][0-9]/15/g' $config_server
sed -i '/spawn-protection/s/[1-9][0-9]/0/g' $config_server
echo "[INFO]:[server.properties] configuration complete."

# spigot.yml
let view_distance--
sed -i 's/view-distance: 10/view-distance: '"${view_distance}"'/g' spigot.yml
sed -i 's/view-distance: [0-9]/view-distance: '"${view_distance}"'/g' spigot.yml
echo "[INFO]:[spigot.yml] configuration complete."

# java -server -Xms${min_RAM}G -Xmx${max_RAM}G -jar -XX:+UseG1GC mohist-1.16.5-1096-server.jar --nogui
