# Deploying a sharded, production-ready MongoDB cluster with Ansible

------------------------------------------------------------------------------
####

- Requires Ansible 1.2
- Expects CentOS/RHEL 7 hosts

### Simple Usage 
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
  
### Other Usage
---------------------------------------------

    ansible-playbook -i hosts site.yml 