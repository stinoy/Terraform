---

# Microsoft AD Deployment with Terraform  

This Terraform configuration automates the deployment of **AWS Directory Service (Microsoft AD)** and enables **User and Group Management**.  

## Features  
- Deploys **Microsoft AD** in AWS with required VPC settings.  
- Automatically enables **User and Group Management** using a `null_resource` with `local-exec`.  
- Ensures forced execution using Terraform triggers.  

## Deployment Steps  
1. Initialize Terraform:  
   ```bash
   terraform init
   ```  
2. Apply the configuration:  
   ```bash
   terraform apply -auto-approve | tee apply.log
   ```  
3. Once deployed, the **User and Group Management** feature is enabled automatically.  

## Outputs  
- **Directory ID** is displayed after successful deployment.  

## Requirements  
- AWS CLI configured with the required permissions.  
- Terraform installed and initialized.  

---


