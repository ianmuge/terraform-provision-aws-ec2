# Terraform Create AWS EC2 instances
Terraform script to create AWS EC2 instances per availability zone
 
# Deployment Instructions
Replace the variables in the command to suite your environment.
```
terraform init
terraform plan -var="vpc_id={{vpc-id}}" -var="key_name={{key-name}}"
terraform apply -var="vpc_id={{vpc-id}}" -var="key_name={{key-name}}"
terraform output
```
You can modify these common variables (Others are available on the variables.tf file):
- vpc-id
- key-name
- zone
- instance_count (Per availability zone)
- service
- role
- instance_type

To destroy the instances (Given that the instance doesn't have termination protection enabled)
```
terraform destroy -var="vpc_id={{vpc-id}}" -var="key_name={{key-name}}"
```
