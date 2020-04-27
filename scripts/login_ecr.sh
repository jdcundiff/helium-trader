# login to ECR
echo 'logging into ECR'

aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID" --profile ${AWS_PROJECT}
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY" --profile ${AWS_PROJECT}
aws configure set default.region ${AWS_REGION} --profile ${AWS_PROJECT}
aws configure set default.output json --profile ${AWS_PROJECT}

# get ecr logging details.
token=$(aws ecr get-authorization-token)
registry=$(echo "$token" | jq -r .authorizationData[].proxyEndpoint | sed -e 's|https://||g')
pass=$(echo "$token" | jq -r .authorizationData[].authorizationToken | base64 -d | cut -d: -f2)

# login via docker
echo "$pass" | docker login -u AWS --password-stdin "$registry"
echo 'aws auth successful'