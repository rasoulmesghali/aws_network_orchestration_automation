# aws_network_orchestration_automation
## Overview

This repository contains the Terraform codes for network provisioning and orchestration and Ansible for network automation parts.
You can find IP address planning and physical/Logicla topologies it the "Topologies" folder.

There are 2 sites including edge_router1 and edge_router2 as well as central_router which connects thosed sites together.
we have put one VM in each VRF for end to end connectivity test.

In this Lab we use 
1- vrf lite + gre over ipsec between siteA and central router
2- VXLAN EVPN betwork siteB and central router.

central is in charge of providing nat and internet access to VRF site1 in both edge1 and edge2

### Prerequirements

1- Have the latest version of Terraform installed on your local machine.
2- Have the latest version of Asnible installed on your local machine.
3- Have the latest version of AWS CLI installed on your local machine.
4- Have AWS user credential set on your local machine using the "aws configure" command.
### Network Provisioning using Terraform

We use terraform in order to build the whole AWS infrustracture.
> **Note**
> You need to have AWS account and its credential stored on your local machine

use the following commands in order to run and build the infrastructure:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

After running terraform a new VPN called "my-vpc" with cidr block 10.0.0.0/16
then it will create required subnets and route tables, security groups, elastic interfaces, aws instances, ...

> **NOTE** 
>
> It is assumed you've an AWS CLI profile and credentials already setup.You have to add your aws profile name inside the file "versions.tf"

> **NOTE** 
>
> You need to create key pair for ssh connection you can do it from AWS console inside ec2 console or create ssh key pair 
in your local machine and copy your public key inside the file "ec2_key_pair.tf" in terraform folder and uncomment all lines. 

> **NOTE** 
> Do not forget to put the key file(.pem) inside the "ansible_configs" folder

> **NOTE** 
>
> We use cisco CSR1000v free trial, you need to subscribe in aws marketplace in order to get free trial subscription for CSR (don't scare you will get error and the redirect link in the error message if you click you can go and subscribe for the CSR AMI) 

> **NOTE** 
>
> after applying terraform it will create inventory file (hosts.cfg) inside "ansible_configs" folder for router configurations 
### Network Automation using Ansible

Befor running the ansible commands, in AWS console in EC2 check the status of all your machines is "running" then you can run ansible commands.
in order to configure all your routers, you need to go the "ansible_configs" folder and run the following commands.

```bash
ansible-playbook siteA_router.yml -i hosts.cfg
ansible-playbook siteB_router.yml -i hosts.cfg
ansible-playbook central_router.yml -i hosts.cfg
```
### How to connect to our ec2 instances and our routers using SSH

Pleas go to the "ansible_configs" folder where you have put your key pair, then run the following command to connect to your ec2 router or vms:


```bash
ssh -i key1.pem ec2-user@public_ip_address_of_your_instance
```
### What is the publib ip address of all routers?

1- After running "terraform apply" it will automatically update the "hosts.cfg" file you can find the routers ip addresses
2- from AWS/EC2/instnaces console
## notes
- Inside AWS/EC2 console check the public ip address of "connection_test_vm" then connect using ssh and create a new key file and copy the content of key pair inside "ansible_configs" folder.