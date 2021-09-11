# Project-1
Cloud Security Project 
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

 ![alt text](https://github.com/christopherowusu-appiah/Project-1/blob/main/repo/Diagram/Cloud_Security_Diagram.PNG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the elk-playbook.yml, filebeat-playbook.yml, metricbeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

- [Elk-playbook](https://github.com/christopherowusu-appiah/Project-1/blob/main/repo/Ansible/Elk-playbook.yml) 
- [Filebeat-playbook](https://github.com/christopherowusu-appiah/Project-1/blob/main/repo/Ansible/filebeat-playbook.yml)
- [Metricbeat-playbook](https://github.com/christopherowusu-appiah/Project-1/blob/main/repo/Ansible/metricbeat-playbook.yml)
- [Metricbeat.cfg](https://github.com/christopherowusu-appiah/Project-1/blob/main/repo/Ansible/Config-files/metricbeat.cfg.yml)
- [Filebeat.cfg](https://github.com/christopherowusu-appiah/Project-1/blob/main/repo/Ansible/Config-files/filebeat-cfg.yml)
- [My-playbook](https://github.com/christopherowusu-appiah/Project-1/blob/main/repo/Ansible/My-playbook.yml)
- [Ansible.cfg](https://github.com/christopherowusu-appiah/Project-1/blob/main/repo/Ansible/Config-files/ansible.cfg.yml)
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available , in addition to restricting access to the network.
-   They protect the availability of a network by distributing the incoming traffic across different servers
	The jump box helps to simplify the deployment of applications and configurations across different servers. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- filebeat monitors the log files that you specify and forwards them to elasticsearch or logstash to be indexed
- metricbeat records the metrics and statistics 

The configuration details of each machine may be found below.

| Name     | Function  | IP Address | Operating System |
|----------|---------- |------------|------------------|
| Jump Box | Gateway   | 10.0.0.6   | Linux (ubuntu 20.04   |
| Web-1    | Web server| 10.0.0.7   | Linux (ubuntu 20.04   |
| Web-2    | web server| 10.0.0.8   | Linux (ubuntu 20.04   |
| Elk-Stack| Elk Server| 10.1.0.4   | Linux (ubuntu 20.04)  |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Workstation public 

Machines within the network can only be accessed by workstation and Jumpbox.
-Jumpbox-provisioner-ip 10.0.0.4
- Workstation public ip:  99.156.170.50

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box  | No                  | 10.0.0.6       |
| Web-1       | No                  | 10.0.0.6        |
| Web-2       | No                  | 10.0.0.6        |
| Elk Stack  | No	        | 10.0.0.6         |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The Advantage of using Ansible is that it lets you quickly and efficiently download and configure  multi-tier apps without a custom code. The playbooks created will allow ansible to get the system to the state needed.  

The playbook implements the following tasks:
- Install docker.io
	-name: Install docker.io apt: update_cache: yes name: docker.io state: present
-Install Python-pip
	name: Install pip3 apt: force_apt_get: yes name: python3-pip state: present
-Install: docker
	- name: Install Docker python module pip: name: docker state: present
- Command: sysctl -w vm.max_map_count=262144
- Launch docker container: elk
	-name: download and launch a docker elk container docker_container: name: elk image: sebp/elk:761 state: started restart_policy: always published_ports: - 5601:5601 - 9200:9200 - 5044:5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

 ![alt text](https://github.com/christopherowusu-appiah/Project-1/blob/main/repo/Images/Sudo_docker_ps_screenshot.PNG)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.0.0.7
- Web-2: 10.0.0.8

We have installed the following Beats on these machines:
- successfully installed Filebeat and Metricbeat on the Elk-stack, Web-1 and Web-2

These Beats allow us to collect the following information from each machine:
- Filebeat collects log events and metricbeat collects metrics and system statistics, and example of what you would see is mysql database for logs, for metricbeat would be CPU usage.


### Using the Playbook

SSH into the control node and follow the steps below:
- Copy the playbook (.yml) file to /etc/ansible.
- Update the host file to include the webserver and Elk chosen including the   private ip addresses followed by  ansible_python_interpreter=/usr/bin/python3
- Run the playbook, and navigate to the ELK server to check that the installation worked as expected.
- .yml file is the playbook and it is copied into the /etc/ansible folder or /etc/ansible/roles 
 	- elkplaybook.yml
	- filebeat-playbook.yml
	- metricbeat-playbook.yml
Updating the hosts file with the ip addresses and ansible_python_interpeter script allows ansible to run on a specific machine, for the ELK server it is the same process, only - [ELK] and the ip address followed by the interpreter script. 
- Test Kibana on web : http://[your.ELK-VM.External.IP]:5601/app/kibana
