AWS CLI Script

Tasks - 
1. Launche two EC2 instances and installs a web server of your choice using --user-data.
2. Waits until instance is up and running
3. Once you run the run-instances command you will need to capture and parse the output to get the instance id, you will
   need to pass the instance id as a parameter to create Load balancer
4. Creates a classic load balancer (previous generation)
5. Registers the EC2 instance created with the load balancer.

Packages to be installed -

Requirements

Python 2 version 2.6.5+ or Python 3 version 3.3+

Windows, Linux, macOS, or Unix

If you already have pip and a supported version of Python, you can install the AWS CLI with the following command:

$ pip install awscli --upgrade --user

$ aws configure
AWS Access Key ID [None]: Access Key
AWS Secret Access Key [None]: Secret Access key
Default region name [None]: .....
Default output format [None]: .....


AWS Configurations settings -
The AWS credentials file – located at ~/.aws/credentials on Linux, macOS, or Unix, or at 
C:\Users\USERNAME \.aws\credentials on Windows 
This file can contain multiple named profiles in addition to a default profile.

The CLI configuration file – typically located at ~/.aws/config on Linux, macOS, or Unix, or at 
C:\Users\USERNAME \.aws\config on Windows
This file can contain a default profile, named profiles, and CLI specific configuration parameters for each.


