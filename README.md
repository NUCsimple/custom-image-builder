# Custom-image-builder
## Overview
Custom-image-builder aims to help users quickly build their own system images in a docker environment.
Now we support two ways to build system image:
- Parametric construction of the mirror, the customer enters the required fields to complete the construction.
- The customer himself mounts alicloud.json through the volume to complete the construction with the container.
## Prerequisites
- [Docker](https://docs.docker.com/get-docker/)
## Supported OS
- CentOS 7.6/7.7
- Aliyun Linux 2 (Alibaba Cloud Linux 2)

## Usage:
1.Use build.sh 
```shell script
$ bash build.sh -f example/ack-centos.json 
```
required:
- IMAGE_NAME(custom)
- [Alicloud ACCESS_KEY](https://help.aliyun.com/document_detail/53045.html?spm=a2c4g.11186623.2.18.60be682bppY9d0#concept-53045-zh)
- [Alicloud SECRET_KEY](https://help.aliyun.com/document_detail/53045.html?spm=a2c4g.11186623.2.18.60be682blplKSc#concept-53045-zh)
- [REGION](https://help.aliyun.com/document_detail/140601.html?spm=a2c4g.11186623.4.3.41b74c07HvI7Kj)
- [INSTANCE_TYPE](https://www.alibabacloud.com/help/zh/doc-detail/25378.htm)

2.Build the OS image By mounting custom alicloud.json
```shell script
$ docker run -v $hostPath:$containerPath registry.aliyuncs.com/acs/custom-sys-image:v1.0.0  $containerPath/alicloud.json
```
## Verify
***
When executing the build task, as follows:
![building](doc/image/building.png)
***
The system image is built, as follows:
![down](doc/image/building.png)
## RAM Policy
If you are using a sub account，the ram policy should at least include actions as below:
```shell script
{
    "Version": "1",
    "Statement": [
        {
            "Action": [
                "ecs:DescribeImages",
                "ecs:CreateImage",
                "ecs:ModifyImageSharePermission",
                "ecs:CreateKeyPair",
                "ecs:DeleteKeyPairs",
                "ecs:DetachKeyPair",
                "ecs:AttachKeyPair",
                "ecs:CreateSecurityGroup",
                "ecs:DeleteSecurityGroup",
                "ecs:AuthorizeSecurityGroupEgress",
                "ecs:AuthorizeSecurityGroup",
                "ecs:CreateSnapshot",
                "ecs:AttachDisk",
                "ecs:DetachDisk",
                "ecs:DescribeDisks",
                "ecs:CreateDisk",
                "ecs:DeleteDisk",
                "ecs:CreateNetworkInterface",
                "ecs:DescribeNetworkInterfaces",
                "ecs:AttachNetworkInterface",
                "ecs:DetachNetworkInterface",
                "ecs:DeleteNetworkInterface",
                "ecs:DescribeInstanceAttribute",
                "ecs:CreateInstance",
                "ecs:DeleteInstance",
                "ecs:StartInstance",
                "ecs:StopInstance",
                "ecs:DescribeInstances"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "vpc:CreateVpc",
                "vpc:DeleteVpc",
                "vpc:DescribeVpcs",
                "vpc:CreateVSwitch",
                "vpc:DeleteVSwitch",
                "vpc:DescribeVSwitches",
                "vpc:AllocateEipAddress",
                "vpc:AssociateEipAddress",
                "vpc:UnassociateEipAddress",
                "vpc:DescribeEipAddresses",
                "vpc:ReleaseEipAddress"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        }
    ]
}
```


## More information
- [Aliyun Help doc](https://help.aliyun.com/document_detail/60822.html?spm=a2c4g.11186623.2.25.3ae026adG47BDI#concept-idd-4cm-xdb)
- [Packer doc](https://www.packer.io/docs/builders/alicloud-ecs)