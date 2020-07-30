# Custom-image-builder
## Overview
Custom-image-builder aims to help users quickly build their own system images in a docker environment.
Now we support two ways to build system image:
- Parametric construction of the mirror, the customer enters the required fields to complete the construction.
- The customer himself mounts alicloud.json through the volume to complete the construction with the container.

## Usage:
1.Use build.sh 
```shell script
$ bash build.sh 
```
required:
- IMAGE_NAME
- [Alicloud ACCESS_KEY](https://help.aliyun.com/document_detail/53045.html?spm=a2c4g.11186623.2.18.60be682bppY9d0#concept-53045-zh)
- [Alicloud SECRET_KEY](https://help.aliyun.com/document_detail/53045.html?spm=a2c4g.11186623.2.18.60be682blplKSc#concept-53045-zh)
- [REGION](https://help.aliyun.com/document_detail/140601.html?spm=a2c4g.11186623.4.3.41b74c07HvI7Kj)
- [SOURCE_IMAGE](https://help.aliyun.com/document_detail/25534.html?spm=a2c4g.11186623.2.35.307c26adf43O8X#doc-api-Ecs-DescribeImages)
- [INSTANCE_TYPE](https://www.alibabacloud.com/help/zh/doc-detail/25378.htm)

2.Build by mounting custom alicloud.json
```shell script
$ docker run -v $hostPath:$containerPath registry.cn-shenzhen.aliyuncs.com/carsnow/pack_base:v1  $containerPath/alicloud.json
```
## Verify
***
When executing the build task, as follows:
![building](doc/image/building.png)
***
The system image is built, as follows:
![down](doc/image/building.png)

## More information
- [Aliyun Help doc](https://help.aliyun.com/document_detail/60822.html?spm=a2c4g.11186623.2.25.3ae026adG47BDI#concept-idd-4cm-xdb)
- [Packer doc](https://www.packer.io/docs/builders/alicloud-ecs)