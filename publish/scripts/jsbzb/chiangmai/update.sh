#!/bin/bash

env=$1
project=$2
module=$3
version=$4
build=$5
log_file=/tmp/${module}_${version}_update.log
echo "update script start" > ${log_file}


app_dir="/home/admin/publish/${project}/${module}"
latest_dir="/home/admin/publish/${project}/${module}/lastest"


# jar_file_name="chiangmai_v1.6.16_test_45.war"
jar_file_name=${module}_${version}.jar

check_is_not_root () 
{
current_dir=`pwd`
if [ "${current_dir}#" == "/#" ] ; then
    echo "try to remove root" >>  ${log_file}
    exit 1
fi
}

stop_old_version()
{
pid=`ps -ef|grep "chiangmai.*\.jar"|grep -v grep|awk '{print $2}'`
kill $pid
}

clean_old_version()
{
if [ -d ${app_dir} ] ; then
    echo "delete old jar file..or move to ./tmp/" >> ${log_file}
    echo "${app_dir}/" >> ${log_file}
    if [ -d ${app_dir}/tmp ];then
        mv ${app_dir}/chiangmai*.jar ${app_dir}/tmp/
    else
        mkdir ${app_dir}/tmp
        mv ${app_dir}/chiangmai*.jar ${app_dir}/tmp/
    fi
    cd ${app_dir}
    check_is_not_root
    nohup java -Dspring.profiles.active=${env} -jar ${jar_file_name} & sleep 0
else
    echo "dir or jar_file is None" >> ${log_file}
fi
}

deploy_new_version ()
{
echo app_dir:  ${app_dir}
echo jar file: ${latest_dir}/${jar_file_name} 
if [ -d ${app_dir} -a -f ${latest_dir}/${jar_file_name} ] ; then
    echo "deploy jar file" >> ${log_file}
    echo "${latest_dir}/${jar_file_name}" >> ${log_file}
    mv ${latest_dir}/${jar_file_name} ${app_dir}/
    cd ${app_dir}
    nohup java -Dspring.profiles.active=${env} -jar ${jar_file_name} & sleep 0
else
    echo "dir or jar_file is None" >> ${log_file}
fi
}

stop_old_version
clean_old_version
deploy_new_version
