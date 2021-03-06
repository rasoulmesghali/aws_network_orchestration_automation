# aws_network_orchestration_automation
## Overview

This repository contains the Terraform codes for network provisioning and orchestration and Ansible for network automation parts.
You can find IP address planning and physical/Logicla topologies it the "Topologies" folder.

There are 2 sites including edge_router1 and edge_router2 as well as central_router which connects thosed sites together.
we have put one VM in each VRF for end to end connectivity test.

In this Lab we use 
```
1- VRF Lite + GRE over IPSec between siteA and central router
2- VXLAN/BGP_EVPN using L3VNI between siteB and central router.
```
central is in charge of providing nat and internet access to VRF site1 in both edge1 and edge2

### Prerequirements
```
1- Have the latest version of Terraform installed on your local machine.
2- Have the latest version of Asnible installed on your local machine.
3- Have the latest version of AWS CLI installed on your local machine.
4- Have AWS user credential set on your local machine using the "aws configure" command.
```
### Network Provisioning using Terraform

We use terraform in order to build the whole AWS infrustracture.
> **Note**
> You need to have AWS account and its credential stored on your local machine

use the following commands in order to run and build the infrastructure:

```bash
chmod +x setup.sh
chmod +x destroy.sh
chmod 600 key1.pem

./setup.sh
```

After running "setup.sh" a new VPC called "my-vpc" with cidr block 10.0.0.0/16
then it will create required subnets and route tables, security groups, elastic interfaces, aws instances, ...

> **NOTE** 
>
> It is assumed you've an AWS CLI profile and credentials already setup.You have to add your aws profile name inside the file "versions.tf"

> **NOTE** 
>
> You need to create key pair for ssh connection you can do it from AWS console inside ec2 console or create ssh key pair 
in your local machine and copy your public key inside the file "ec2_key_pair.tf" in terraform folder and uncomment all lines. 

> **NOTE** 
> 
> Do not forget to put the key file(.pem) inside the root folder

> **NOTE** 
>
> We use cisco CSR1000v free trial, you need to subscribe in aws marketplace in order to get free trial subscription for CSR (don't scare you will get error and the redirect link in the error message if you click you can go and subscribe for the CSR AMI) 

> **NOTE** 
>
> after applying terraform it will create inventory file (hosts.cfg) inside "ansible_configs" folder for router configurations 
### Network Automation using Ansible

All required command is added to the "setup.sh" file. if you run this file, terraform and ansible will create everything.

```bash
ansible-playbook -i ${WD}/ansible_configs/hosts.cfg ${WD}/ansible_configs/siteA_router.yml 
ansible-playbook -i ${WD}/ansible_configs/hosts.cfg ${WD}/ansible_configs/siteB_router.yml 
ansible-playbook -i ${WD}/ansible_configs/hosts.cfg ${WD}/ansible_configs/central_router.yml
```
### How to connect to our ec2 instances and our routers using SSH

Pleas put your key pair in the root folder, then run the following command to connect to your ec2 router or vms:


```bash
ssh -i key1.pem ec2-user@public_ip_address_of_your_instance
```
### What is the publib ip address of all routers?

1- After running "terraform apply" it will automatically update the "hosts.cfg" file you can find the routers ip addresses
2- from AWS/EC2/instnaces console
## notes
- Inside AWS/EC2 console, check the public ip address of "connection_test_vm" then connect using ssh and create a new key file and copy the content of key pair inside "ansible_configs" folder.


### How to check everything works in routers

The following commands help you to check connectivities:

Router siteB:

```bash
show nve peers
show ip ospf neighbor
show bgp l2vpn evpn
show ip route vrf site1
show ip route vrf site2
show ip cef vrf site1
show ip cef vrf site2
ping vrf site1 10.0.11.100 source 10.0.21.10
ping vrf site1 10.0.12.100 source 10.0.21.10 #must not get response
ping vrf site1 10.0.22.100 source 10.0.21.10
ping vrf site1 8.8.8.8 source 10.0.21.10
```

Router siteA:

```bash
show crypto isakmp sa
show ip route vrf site1
show ip route vrf site2
show ip cef vrf site1
show ip cef vrf site2
ping vrf site1 10.0.12.100 source 10.0.11.10
ping vrf site1 10.0.21.100 source 10.0.11.10
ping vrf site1 10.0.22.100 source 10.0.11.10 #must not get response
ping vrf site1 8.8.8.8 source 10.0.11.10
```

Router central:

```bash
show nve peers
show ip ospf neighbor
show bgp l2vpn evpn
show crypto isakmp sa
show ip route vrf site1
show ip route vrf site2
show ip cef vrf site1
show ip cef vrf site2
```

### Connecting to "connection_test_vm" machine then connect to other vms

1- creat key pair file like below:

```bash
touch key1.pem
nano key1.pem # then copy the content of key pair then paste here

ssh -i key1.pem ec2-user@10.0.11.100
ssh -i key1.pem ec2-user@10.0.12.100
ssh -i key1.pem ec2-user@10.0.21.100
ssh -i key1.pem ec2-user@10.0.22.100
```