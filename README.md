# Terraform Vulhub Deployment Project

## 🎉 Project Overview
This project provides a simple and automated way to deploy vulnerable applications from the [Vulhub](https://github.com/vulhub/vulhub) repository into AWS EC2 instances using Terraform.

It is designed as a **training and educational project** for:
- Learning Terraform basics and infrastructure automation
- Understanding AWS EC2 deployments and security groups
- Practicing penetration testing techniques on real-world CVEs

The project automates the deployment of selected vulnerabilities from Vulhub without manual intervention.

---

## 🔄 How It Works
- Terraform provisions an EC2 instance (Ubuntu 24.04) with Docker and Docker Compose pre-installed.
- A selected vulnerable application is cloned from the Vulhub repository.
- The application is deployed automatically inside the instance.
- You can then access and test the vulnerability directly from your browser or tools.

The selection of the vulnerability to deploy is fully automated via a Python script (`select_vulnerability.py`).

---

## 🔍 Project Structure
```
terraform-vulhub/
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Variables definitions
├── outputs.tf              # Outputs after deployment
├── terraform.tfvars        # User-defined variables (region, key pair, etc.)
├── user_data.sh            # EC2 instance bootstrap script
├── select_vulnerability.py # Python script to select and deploy a Vulhub vulnerability
```

---

## 🛠 Prerequisites
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) installed and configured
- [Terraform](https://developer.hashicorp.com/terraform/install) installed
- [Python 3.x](https://www.python.org/) installed
- `requests` library for Python (`pip install requests`)
- An existing AWS Key Pair

---

## ⚡ Setup Instructions

### 1. AWS Login
Before running Terraform, make sure you are authenticated with AWS CLI:

```bash
aws configure
```
Or if you are using named profiles:
```bash
aws login --profile your-profile-name
```

### 2. Configure `terraform.tfvars`
Edit `terraform.tfvars` with your own AWS settings:

```hcl
aws_region    = "your-aws-region"         # e.g., eu-central-1
aws_ami       = "your-ubuntu-ami-id"       # Ubuntu 24.04 LTS AMI ID for your region
instance_type = "t2.micro"                 # or any instance type you prefer
key_name      = "your-aws-keypair-name"    # Name of your AWS EC2 Key Pair (not the .pem file)
```

### 3. Select Vulnerability
Run the Python script to select the vulnerability you want to deploy:

```bash
python select_vulnerability.py
```
The script will:
- Fetch the latest categories and vulnerabilities from Vulhub GitHub
- Let you pick one through an interactive menu
- Update `user_data.sh`
- Apply Terraform with resource replacement to recreate the EC2 instance

### 4. Access the Deployed Vulnerability
After deployment, Terraform will output the public IP of your EC2 instance.  
Visit:

```
http://<your-ec2-public-ip>:8080/
```
(or directly on port 80 if configured)

### 5. SSH Access (Optional)
You can connect to the instance using your AWS Key Pair:

```bash
ssh -i your-key.pem ubuntu@<your-ec2-public-ip>
```

---

## 🌍 References
- [Vulhub - Pre-Built Vulnerable Environments Based on Docker](https://github.com/vulhub/vulhub)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

---

## 🚀 Future Improvements
- Support for multiple simultaneous deployments
- Integration with security scanning tools like Nikto, Nmap

---

> This project is intended for **educational and testing purposes** only. Do not expose vulnerable instances to the public without proper firewall rules or protections.
