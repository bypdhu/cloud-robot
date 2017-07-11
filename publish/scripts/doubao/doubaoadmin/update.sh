#!/bin/bash
env=$1
project=$2
module=$3
version=$4
build=$5

file_name=${module}_${version}_${env}_${build}.zip
zipfile=/home/admin/release/tmp/${version}/${file_name}

function check ()  {
    if [ $? -ne 0 ];then
        exit 1
    fi
}

function check_file(){
if [ ! -f "${zipfile}" ]; then
        echo "can not find file ${zipfile}"
        exit 1
fi

}

function production_prepare(){
mkdir -p /home/admin/release/${version}
rm /home/admin/release/${version}/* -rf
unzip ${zipfile} -d /home/admin/release/${version}
rsync -av /home/admin/conf/default/ /home/admin/release/${version}/config/
}

function production_update(){
pm2 stop ${module}
pm2 delete ${module}
rm /home/admin/app-run -rf
ln -s /home/admin/release/${version} /home/admin/app-run

cd /home/admin/app-run && pm2 start ${module}.js --merge-logs --log-date-format="YYYY-MM-DD" -l  /data/logs/app/${module}.log
}

function production_check(){

prod_status=`pm2 status| grep ${module} | sed -n 1p | awk '{print $10}'`

if [ "x${prod_status}" == "xonline" ];then
    echo done
    exit 0
else
    echo fail
    exit 1
fi
}

check_file
production_prepare
production_update
production_check