#!/bin/bash

WORK_PATH=`pwd`
imageName="docker.hub.shoogoome.com/common/zentao"
version="3.0"
port=80
resource=http://dl.cnezsoft.com/zentao/11.7/ZenTaoPMS.11.7.stable.zbox_64.tar.gz
volume=${WORK_PATH}'/data'
logs=${WORK_PATH}'/logs'
name="zentao"

case $1 in
    "init")
        curl http://dl.cnezsoft.com/zentao/11.7/ZenTaoPMS.11.7.stable.zbox_64.tar.gz > zentao.tar.gz
        rm -rf ${WORK_PATH}/zbox
        rm -rf ${WORK_PATH}/data
        tar -xzvf zentao.tar.gz
        mv ${WORK_PATH}/zbox/data ${WORK_PATH}/data
        rm -rf ${WORK_PATH}/zbox
    ;;
    "pull")
        docker pull ${imageName}:${version}
    ;;
    "up")
        docker run -dit -p ${port}:80 -v ${volume}:'/opt/zbox/data/mysql' -v ${logs}'/system':'/logs' -v ${logs}'/zentao':'/opt/zbox/logs' --name ${name} ${imageName}:${version}
    ;;
    "down")
        docker rm -f ${name}
    ;;
    "logs")
        docker logs ${name}
    ;;
    "kill")
        docker kill ${name}
    ;;
    "build")
        docker build -t ${imageName}:${version} .
    ;;
    "bash")
        docker exec -it ${name} bash
    ;;
esac

