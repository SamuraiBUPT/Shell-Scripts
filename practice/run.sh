#!/bin/bash

echo "Shell Script 【run.sh】 starts working..."
echo "written by Samurai_BUPT"

min_RAM=2
max_RAM=8

java -server -Xms${min_RAM}G -Xmx${max_RAM}G -jar -XX:+UseG1GC mohist-1.16.5-1096-server.jar --nogui
