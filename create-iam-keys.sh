#!/bin/bash
creds_file="credentials"

output_json=$(aws iam create-access-key --user-name serverless)

id=$(echo $output_json | jq .AccessKey.AccessKeyId)
key=$(echo $output_json | jq .AccessKey.SecretAccessKey)

echo "[serverless]" > credentials
echo "aws_access_key_id     = $id" >> credentials
echo "aws_secret_access_key = $key" >> credentials

chmod 600 $creds_file
