# Terraform
Kronos directory service
This Terraform code automates the deployment of AWS Managed Microsoft AD with the following configurations:

Creates a Microsoft AD directory service with enterprise edition.
Configures VPC settings including subnet associations.
Uses a null resource with a local-exec provisioner to run an AWS CLI command for enabling additional settings.
Outputs the Directory ID for reference.
⚠️ Limitation: The "User and Group Management" feature needs to be enabled manually, as AWS does not provide a direct API or Terraform support for this yet.
