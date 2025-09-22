# EC2 Instance Automation with Terraform

This folder shows how to use Terraform to create an AWS EC2 instance automatically named **Arjun_Test_Instance**.

## Files in this folder

- `main.tf` — The main Terraform code for EC2
- `variables.tf` — Region, AMI and instance type settings
- `outputs.tf` — Lets you see your instance ID and public IP

## How to use

1. Go into this folder in your terminal:
   ```
   cd ec2-instance
   ```

2. Set up Terraform:
   ```
   terraform init
   ```

3. Preview what will be created:
   ```
   terraform plan
   ```

4. Create the EC2 instance:
   ```
   terraform apply
   ```

5. You will see your new EC2 instance ID and public IP in the output.

## Example Output

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

ec2_instance_id = "i-0123456789abcdef0"
ec2_public_ip   = "18.222.10.123"

- You can change the region, instance type or AMI by editing `variables.tf`.
