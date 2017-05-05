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
