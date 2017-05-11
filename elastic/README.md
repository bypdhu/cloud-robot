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
    
  #### Install logstash => 