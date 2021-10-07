#/bin/bash

export REGION=us-east-2

#export CLUSTERNAME=api-kpmgocp-stotenrhos-com:6443

# /usr/local/bin/aws ec2 stop-instances --region ${REGION} --instance-ids $(aws ec2 describe-instances --filters "Name=tag:Name,Values=${CLUSTERNAME}-*" "Name=instance-state-name,Values=running" --query Reservations[*].Instances[*].InstanceId --region ${REGION} --output text)

echo /usr/local/bin/aws ec2 stop-instances --dry-run --region ${REGION} --instance-ids $(aws ec2 describe-instances | jq '.Reservations[].Instances[0] | select(.IamInstanceProfile.Arn=="arn:aws:iam::191858346030:instance-profile/kpmgocp-2sp98-worker-profile") | .InstanceId' | tr -d '"')

/usr/local/bin/aws ec2 stop-instances --dry-run --region ${REGION} --instance-ids $(aws ec2 describe-instances | jq '.Reservations[].Instances[0] | select(.IamInstanceProfile.Arn=="arn:aws:iam::191858346030:instance-profile/kpmgocp-2sp98-worker-profile") | .InstanceId'  | tr -d '"')

