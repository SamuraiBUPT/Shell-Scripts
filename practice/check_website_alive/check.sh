#!/bin/bash

sample="www.baidu.com https://cn.bing.com/ https://www.bilibili.com/"
for URL in $sample; do
    FAIL_COUNT=0
    for ((i = 0; i < 3; i++)); do
        HTTP_CODE=$(curl -o /dev/null --connect-timeout 3 -s -w "%{http_code}" $URL)
        if [ $HTTP_CODE -eq 200 ]; then
            break
        else
            let FAIL_COUNT++
        fi
    done
    if [ $FAIL_COUNT -eq 3 ]; then
        echo "[WRAN]: $URL Access failure!"
    fi
done
