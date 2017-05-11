# Deploying a sharded, production-ready elastic cluster with Ansible

------------------------------------------------------------------------------
####

- Requires Ansible 1.2
- Expects CentOS/RHEL 7 hosts

### Simple Usage For Installation 
---------------------------------------------
  #### Install all, include elasticsearch/filebeat/logstash. The hosts to install should be written in file "hosts". So we can install different package on different host. 
    ansible-playbook -i hosts install_all.yml
    note: need differ the hosts by group. Refer to the hosts file.
    
  #### Just install elasticsearch service.
    ansible-playbook -i "10.99.70.38," install_elasticsearch.yml
    or use inventory file.
    ansible-playbook -i inventory install_elasticsearch.yml

  #### Just install logstash service.
    ansible-playbook -i "10.99.70.38," install_logstash.yml
      
  #### Just install filebeat service.
    ansible-playbook -i "10.99.70.38," install_filebeat.yml

  ####

### Installation Using Tags
----------------------------------------
  #### Install logstash service
    ansible-playbook -i hosts install_all.yml -t "install_logstash"
    
  #### Install filebeat service
    ansible-playbook -i hosts install_all.yml -t "install_filebeat"
    
  #### Install all services
    ansible-playbook -i hosts install_all.yml -t "install_all"
    
  ####

### Simple Usage For Stopping Services
----------------------------------------------------------
  #### Just stop logstash service
    ansible-playbook -i "10.99.70.38," stop_logstash.yml
  
  #### Just stop filebeat service
    ansible-playbook -i "10.99.70.38," stop_filebeat.yml

  ####
  
### Other Usage
---------------------------------------------
  #### Assign username and ssh pass.
    ansible-playbook -i "10.99.70.38," install_all.yml -u cloud -e ansible_ssh_pass=123456
    
  #### Assign username, ssh pass and sudo pass.
    ansible-playbook -i "10.99.70.38," install_all.yml -u cloud -e ansible_ssh_pass=123456 -e ansible_sudo_pass=654321


### How to use with different values
---------------------------------------
  #### Install elasticsearch => version:5.3.0, cluster name: **, node name: **, not create cron job 
    ansible-playbook -i "10.99.70.38," install_elasticsearch.yml -e version=5.3.0 -e es_cluster_name=cluster_logmgr_1 -e es_node_name=node_logmgr_1_10.99.70.38 -e es_need_clean_indices=false

  #### Install elasticsearch => create cron job: clean indies, reserve indices: 7 day, clean interval 1 day
    ansible-playbook -i "10.99.70.38," install_elasticsearch.yml -e es_need_clean_indices=true -e es_reserve_indices=7d -e es_clean_interval_of_day=1
    
  #### Install logstash => set es host: **, set es user: **, set es password: **
    ansible-playbook -i "10.99.70.38," install_logstash.yml -e es_host=10.99.70.52 -e es_user=elastic -e es_password=changeme
    
  #### Install logstash => set pattern path: /opt/logstash-patterns, set pattern name: **, set doctype: **
    ansible-playbook -i "10.99.70.38," install_logstash.yml -e logstash_pattern_path=/opt/logstash-patterns -e logstash_filter_access_message="%{NGINXACCESSONE}" -e logstash_output_access_es_index="logstash-access-%{[@metadata][beat]}-%{+YYYY.MM.dd}" -e logstash_output_access_es_doctype="%{[@metadata][type]}"

  #### Install filebeat => set access path: **, set output.logstash.index: **
    ansible-playbook -i "10.99.70.38," install_filebeat.yml -e beats_log_access_path=/opt/nginxlogs/demo.acc.log -e beats_output_index=butest1_grtest1
  
  
  #### Install filebeat => set one logstash host, you can use: '"10.99.70.38:5044"', "10.99.70.38:5044", 10.99.70.38:5044
    ansible-playbook -i "10.99.70.38," install_filebeat.yml -e beats_output_logstash_hosts='"10.99.70.38:5044"'
  
  #### Install filebeat => set more logstash hosts: **
    ansible-playbook -i "10.99.70.38," install_filebeat.yml -e beats_output_logstash_hosts='"10.99.70.38:5044","10.99.70.35:5044"'
    