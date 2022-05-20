#!/bin/bash

export container=mall
export image=mall_img
export os_type=`uname`

# Replace IP
# if [ -n "$1" ] ;then
#     echo "change backend IP to $1"
#     if [[ "${os_type}" == "Darwin" ]]; then
#         sed -i "" "s/localhost/$1/g" src/main.js
#         sed -i "" "s/localhost/$1/g" src/common/js/utils.js
#         sed -i "" "s/localhost/$1/g" src/utils/axios.js
#     else
#         sed -i "s/localhost/$1/g" src/main.js
#         sed -i "s/localhost/$1/g" src/common/js/utils.js
#         sed -i "s/localhost/$1/g" src/utils/axios.js
#     fi
# fi

docker rm -f $container
docker rmi $image

docker build -t $image .
docker run -d --name $container -p 8081:8080 $image
