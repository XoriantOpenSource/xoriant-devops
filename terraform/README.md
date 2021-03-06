# Terraform "AWS EC2 Instance-prometheus module" 

# Author: Pankaj Yadav

--------------------------------------------------------------------------------------
#  Prerequisites:
--------------------------------------------------------------------------------------
1.  Terraform  should be installed.
2.  An AWS account.
3.  Access key and secrete key of AWS account.
4.  Public and private RSA keys for connecting AWS instance.  Use below link for generating Public and private key 
        https://support.rackspace.com/how-to/generating-rsa-keys-with-ssh-puttygen/
 

  Note : Predefine  name of  RSA private key “prometheuskey” and public key  “prometheuskey.pub”   are used in the  module and 
          user can changes  as per there key name in the files "main.tf and variables.tf". 

----------------------------------------------------------------------------------------
# AWS resources are supported by this module.
----------------------------------------------------------------------------------------
These types of resources are supported:

EC2 instance: t2 micro

VPC: Default

VPC cidr_block = "172.33.1.0/16”

Gateway : default

Subnet: default

Subnet cidr_block = "172.33.1.0/20"

Security : open port : 22,80,9090,9100

Region :us-east-1

AMI: ami-2757f631

OS: Amazon Linux 

-----------------------------------------------------------------------------------------
# Terraform "AWS Prometheus module".
---------------------------------------------------------------------------------------------

 Terraform "AWS Prometheus module " which creates  EC2 instance(t2 micro) on AWS and installed Prometheus version 1.8

 For AWS instance  creation  and Prometheus installation , following files and  folder are used:

 Filename: main.tf: This  is main configure file for AWS resource creation.

 Filename: variables.tf: This file enclose  AWS  variable.  e.g.  AWS  secrete key, access key , region, AMI, RSA file name and location.

 Filename: vpc.tf: this file enclose network  resource information. 

 Filename: security.tf: this file enclose security rules and open port.

 Folder: prometheus: this folder keep all configuration and installation file for prometheus 1.8 .

----------------------------------------------------------------------------------------------
For instance creation and installing Prometheus,  follow the  below  Procedure:

Copy all files along with  prometheus folder on your local system.

Follow the sequence execution of command  as described below:
# Usage
terraform plan

This command output show resource before actual create it. If no error  please run below command:

# Usage
terraform apply

This command will create t2-mirco EC2 instance and installed Prometheus 1.8.


# Usage
terraform show |grep -i "public_ip"

The above command will provide public ip of new  created  instance.

Now access  prometheus   use url : http://public_ip:9090 .

#  License

Apache 2 Licensed. See LICENSE for full details.
