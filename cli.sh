#!/bin/bash
#This will create two instances with web servers and get instance id in $instance_id
instance_id=$(aws ec2 run-instances --image-id ami-xxxxxxxx  --count 2 --instance-type t2.micro --key-name xxxxxxx --subnet-id subnet-xxxxxxx --tag-specifications 'ResourceType=instance,Tags=[{Key=xxxxx,Value=xxxxxxx},{Key=xxxx,Value=xxxxxxxxxx}]' 'ResourceType=volume,Tags=[{Key=xxxx,Value=xxxxxxxxxxxx},
{Key=xxxxx,Value=xxxxxxxxx}]' --user-data file://myscript.txt --output text --query 'Instances[*].InstanceId')
echo instance_id=$instance_id

#This will give output for all instances with instance-type t2.micro
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro"

#Create load balancer
aws elb create-load-balancer --load-balancer-name xxxxxxxxxxx --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80" --subnets subnet-xxxxxxx --security-groups sg-xxxxxxxxxx

#Register instances created above to load balancer
aws elb register-instances-with-load-balancer --load-balancer-name xxxxxxxxxxx --instances $instance_id

#Checks instance health on load balancer
aws elb configure-health-check --load-balancer-name xxxxxxxxxxx --health-check Target=HTTP:80/ping,Interval=30,UnhealthyThreshold=2,HealthyThreshold=2,Timeout=3
aws elb describe-instance-health --load-balancer-name xxxxxxxxxxx 

