#!/bin/bash

echo "This is a tutorial for server to install python packages."
echo ""
echo "Please first check your 'apt', 'apt-get', 'wget'...commandLine is working or not."
echo ""
echo "It' s recommended to update/upgrade first and then follow these steps."
echo ""
echo "First: Conda."

first=$(python -V 2>&1 | awk '{print $2}' | awk '{split($1, arr, "."); print arr[1]}')
second=$(python -V 2>&1 | awk '{print $2}' | awk '{split($1, arr, "."); print arr[2]}')
if [[ $first == "3" ]]; then
    if [[ $second -ge "7" ]]; then
        echo "python version check pass."
    else
        echo "your python version is too low, please upgrade."
        exit
    fi
fi

echo "install conda"
echo "Please mkdir a folder named 'Download'."
echo "and cd there"
echo ""
echo "input ' wget https://mirrors.bfsu.edu.cn/anaconda/archive/Anaconda3-2021.11-Linux-x86_64.sh ' to download."
echo ""
echo "input ' bash Anaconda3-2021.11-Linux-x86_64.sh ' to install"
echo ""
echo "remember to change install location to /anaconda3 (home path)"
echo "then re-connect your server to update."

echo ""
echo "use ' conda create --name pytorch python=your_version ' to create a envs"
echo "follow the tips"

echo ""
echo ""
echo ""
echo "input : 'conda install pytorch torchvision torchaudio cpuonly -c pytorch' "
echo ""

echo "test."
