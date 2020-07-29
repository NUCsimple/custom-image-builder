#!/bin/bash
##
read  -p "Please input the AliCloud access_key:" ACCESS_KEY
read  -p "Please input the AliCloud secret_key:" SECRET_KEY
read  -p "The Alicloud region is: " REGION
read  -p "The type of instance is:" INSTANCE_TYPE
read  -p "Please fill  the base image id which you want to create your customized images:" SOURCE_IMAGE
read  -p "The name of the user-defined image is:" IMAGE_NAME

## check params
if [[ -z $ACCESS_KEY || -z $SECRET_KEY || -z $REGION || -z $INSTANCE_TYPE || -z $SOURCE_IMAGE || -z $IMAGE_NAME ]]; then
   printf "[ERROR] `date '+%F %T'` following parameters is empty:\naccess_key=${ACCESS_KEY}\nsecret_key=${SECRET_KEY}\nregion=${REGION}\ninstance_type=${INSTANCE_TYPE}\nsource_image=${SOURCE_IMAGE}\nimage_name=${IMAGE_NAME}"
   exit 0
fi

##build system base image
docker run -e ACCESS_KEY=$ACCESS_KEY -e SECRET_KEY=$SECRET_KEY  -e REGION=$REGION  -e INSTANCE_TYPE=$INSTANCE_TYPE \
-e SOURCE_IMAGE=$SOURCE_IMAGE -e  IMAGE_NAME=$IMAGE_NAME registry.aliyuncs.com/acs/custom-sys-image:v1.0.0  \
/tmp/alicloud.json