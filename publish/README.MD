# Usage

### Install one or many software using yum. 
#### you can set a "app-version" list, or no version means default newest version.
#### for example:   install sl with version 5.02 and install cowsay with the newest version.
    ansible-playbook -i "10.99.70.38," collection/install_many.yml -e "@jsonfile"
     
     "jsonfile" contents:
    {
        "apps_list": ["sl-5.02", "cowsay"]
    }
    
### Download business apps for project like fangjs.
#### download file(s) for a specific module-group.
#### for example: download files for fangjs-cas
     ansible-playbook -i "10.99.70.38," publish/playbooks/fangjs/cas/transfer_version.yml -e "@jsonfile"
      
      "jsonfile" contents:
      {
          "host": "all",
          "project": "fangjs",
          "module": "cas",
          "file_list": [
              {
                  "file_url": "http://test1.essintra.ejudata.com/file_version.zip",
                  "file_name": "file_version.zip",
                  "md5:: "weyd8sjaf1hc32"
              }
           ]
      }