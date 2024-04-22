#!/usr/bin/env bash

profile="default"
STACK_NAME="CDN"
S3_BUCKET=$(whoami)-$(date +%Y-%m-%d)

aws cloudformation deploy \
    --template-file template.yml \
    --stack-name ${STACK_NAME} \
    --parameter-overrides \
    BucketName=${S3_BUCKET} \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile ${profile}
