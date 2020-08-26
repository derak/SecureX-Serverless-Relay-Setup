#!/bin/bash

aws cloudformation create-stack \
  --capabilities CAPABILITY_NAMED_IAM \
  --template-body file:///full/path/to/file/serverless-relay-pre-setup.yaml \
  --stack-name Serverless-Relay-Pre-Setup \
  --profile <your-aws-profile-name>

while [ 1 ]; do
  status=$(aws cloudformation describe-stacks --stack-name Serverless-Relay-Pre-Setup --profile <your-aws-profile-name> | jq -r '.Stacks[0].StackStatus')
  echo "status = $status"
  if [ $status == "CREATE_COMPLETE" ]; then
    echo "done"
    break;
  fi
  sleep 1
done
