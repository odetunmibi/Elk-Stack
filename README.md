## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

 Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the elkplaybook.yml, metricbeat-playbook.yml, and filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

  - /Ansible/elkplaybook.yml
  - /Ansible/metricbeat-playbook.yml
  - /Ansible/elkplaybook.yml
  - /Ansible/AnsibleConfig
  - /Ansible/MetricbeatConfiguration 
  - /Ansible/filebeat-playbook.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
 What aspect of security do load balancers protect? What is the advantage of a jump box?

- Load balancers are use to protect the availability of the network by sending the dat across multiple servers.

- Jump boxes give admins abiltiy to control multiple machines from a centralized system. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the Network and system logs.
- _TODO: What does Filebeat watch for?_
Filebeat watches over the log files/locations that's specified and send them to Elastic-search/Log-stash for indexing.

 What does Metricbeat record?_
Metric beat rescords the statics and metrics and sends the data that's specified to Elasticsearch/Logstash.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4(Private)/ 51.143.103.36(Public)| Linux|
| WEB-1    |DVWA Hosts| 10.0.0.5   | Linux            |
| WEB-2    |DVWA Hosts| 10.0.0.6   | Linux            |
| ELKVM    |ELK Stack Hosts| 10.1.0.4(Private)/40.76.176.15(Public)| Linux|

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- (LocalHost IP address)



Machines within the network can only be accessed by Jump-Box provisioner.
- Which machine did you allow to access your ELK VM? 

   - Jump-Box-Provisioner

- What was its IP address?
   
   - 10.0.0.4 (Private)


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box |        YES          |(LocalHost IP address)|
|  ElK-VM  |        NO           | 10.0.0.4             |
|Web-1(VM1)|        NO           | 10.0.0.4             |
|Web-2(VM2)|        NO           | 10.0.0.4             |

These Virtual machines can only be accessed from the Jump-Box-Provisioner

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- What is the main advantage of automating configuration with Ansible?_

   - The ansible container is capable of automating complex multi-level IT application enviroments.

   - The YAML playbook is another great advandtage because of its ability to configure management and automation.  

The playbook implements the following tasks:
- In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Step 1: first we want to ssh into the Jump-Box-Provisioner
     Command: ssh azdmin@51.143.103.36

- Step 2: then we want to start/attach the ansible container given.
     Commands: sudo docker start vigilant_curie
               sudo docker attach vigilant_curie

- Step 3: Then we go to the /etc/ansible directory to create ELK playbook
        Commands: cd /etc/ansible 
                  nano elkplaybook.yml 

- Step 4: We set the python code in the playbook then run it using the command...
       Commands: ansible-playbook elkplaybook.yml 

- Step 5: To confirm the that the elkvm was up and running we ssh into the elk vm server and run the following commands.
     Commands: ssh azdmin@10.1.0.4
               sudo docker ps

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- List the IP addresses of the machines you are monitoring_
      
    Web-1(VM-1) 10.0.0.5

    Web-2(VM-2) 10.0.0.6

We have installed the following Beats on these machines:
- Specify which Beats you successfully installed_
   	
	Filebeat has been successfully installed 
	
	Metricbeat has been successfully installed

These Beats allow us to collect the following information from each machine:
-  In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
	

	Filebeat uses specific files and to log their data from remote machines. For example, Filebeats files can be generated by MySQL, Microsoft Azure tools, and Nginx web databases.

	The metrics of a machine is called by Metricbeat. It is use to tell analyst howhealthy a machine is. For example, the Cpu usage and uptime can be a Metricbeat.

	
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

-----Filebeat----

SSH into the control node and follow the steps below:
- Copy the filbeat-config.yml file to /etc/ansible directory.
- Update the filbeat-config.yml file to include ELK's private IP in lines 1106 and 1806.
- Run the playbook, and navigate to 40.76.176.15:5601/app/kibana to check that the installation worked as expected.


-----Metricbeat----

SSH into the control node and follow the steps below:
- Copy the metricbeat-config.yml file to /etc/ansible directory.
- Update the metric-config.yml file to include ELK's private IP in lines 1106 and 1806.
- Run the playbook, and navigate to 40.76.176.15:5601/app/kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
 - Which file is the playbook?  filebeat-playbook.yml 

 - Where do you copy it? ~/etc/ansible/

 - Which file do you update to make Ansible run the playbook on a specific machine? /etc/ansible/hosts file (IP of the Virtual Machines)

 - How do I specify which machine to install the ELK server on versus which to install Filebeat on? I go to the /etc/ansible/hosts file and specify two groups. One group will be for the webservers that has the IP's of the VMs that I will install filbert to. The other group is named [ELK] and this has the IP of the VM that elk is installed on.	

- _Which URL do you navigate to in order to check that the ELK server is running? 40.76.176.15:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._


-------Filebeat---------

- To create the filebeat-config.yml file: nano filebeat-config.yml in the /etc/ansible file. For this, I used the filebeat configuration file template. Just use the

- To create the playbook: nano filebeat-playbook.yml

In the playbook you will want to type in these commands

---
 - name: Install filebeat and transfer configuration file to VMs
   hosts: webservers
   become: true
   tasks:

    - name: Download deb file for filebeat
      command:
        cmd: curl -L -O      https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
    - name: Install filebeat from downloaded file
      command:
        cmd: dpkg -i filebeat-7.6.1-amd64.deb

    - name: Copy filebeat config file to VM
      copy:
        src: /etc/ansible/filebeat-config.yml
        dest: /etc/filebeat/filebeat.yml

    - name: Enable filebeat system
      command:
        cmd: filebeat modules enable system

    - name: Setup filebeat
      command:
        cmd: filebeat setup

    - name: Start filebeat service
      command:
        cmd: service filebeat start

    - name: Enable filebeat on boot
      systemd:
        name: filebeat
        enabled: yes
---

Run the playbook using ansible-playbook filebeat-playbook.yml


---------Metricbeat---------


- To create the Metricbeat-config.yml file: nano metricbeat-config.yml in the /etc/ansible file. For this, I used the metricbeat configuration file template. Just use the

- To create the playbook: nano metricbeat-playbook.yml

---
 - name: Install metric beat
   hosts: webservers
   become: true
   tasks:
     # Use command module 
    - name: Download metricbeat
      command: curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-amd64.deb
    
     # Use command module
    - name: install metricbeat
      command: dpkg -i metricbeat-7.6.1-amd64.deb

     # Use copy module 
    - name: drop in metricbeat config 
      copy:
        src: /etc/ansible/metricbeat
        dest: /etc/metricbeat/metricbeat.yml

     # Use command module 
    - name: enable and configure docker module for metric beat
      command: metricbeat modules enable docker 

     # Use command module
    - name: setup metric beat 
      command: metricbeat setup

     # Use command module
    - name: start metric beat
      command: service metricbeat start

     # Use systemd module 
    - name: enable service metricbeat on boot
      systemd:
        name: metricbeat
        enabled: yes 

------




# You can find shell script to update and clean data in the file '~/Elk-Stack/ShellScripts'.
