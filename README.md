# Terraform AWS EC2 with Remote Backend (S3 + DynamoDB)

This project demonstrates provisioning AWS infrastructure using **Terraform** with a **production-style remote backend configuration**.

It includes:

* ✅ EC2 instance provisioning
* ✅ Remote state storage using Amazon S3
* ✅ State locking using DynamoDB
* ✅ Structured variable and output management
* ✅ Clean Infrastructure as Code (IaC) practices

---

## Project Overview

This repository showcases how to:

* Write Terraform configuration files in a structured way
* Configure a remote backend using S3
* Enable state locking using DynamoDB
* Safely manage infrastructure lifecycle (apply, destroy)
* Follow DevOps best practices for state management

---

## Architecture

Terraform → AWS Provider →
• EC2 Instance
• Security Group
• Key Pair
• S3 (Remote State Storage)
• DynamoDB (State Locking)

---

## 📂 Project Structure

```
terraform-aws-ec2-remote-backend/
│
├── main.tf              # Infrastructure resources
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── backend.tf           # Remote backend configuration (S3 + DynamoDB)
├── .gitignore           # Prevents state & sensitive files from being committed
└── README.md            # Project documentation
```

---

## Prerequisites

* Terraform installed
* AWS account
* AWS CLI configured (`aws configure`)
* S3 bucket created for remote backend
* DynamoDB table created for state locking

---

## Remote Backend Configuration

The project uses:

* **S3 bucket** for storing Terraform state
* **DynamoDB table** for state locking
* **Encryption enabled**

Example backend configuration:

```hcl
terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"
    key            = "ec2-project/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
```

---

## Usage

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Review Execution Plan

```bash
terraform plan
```

### 3️⃣ Apply Infrastructure

```bash
terraform apply
```

### 4️⃣ Destroy Infrastructure

```bash
terraform destroy
```

---

## State Locking Verification

This project includes DynamoDB-based state locking to prevent:

* Concurrent apply operations
* State corruption
* Race conditions
* Multi-user conflicts

Locking behavior was tested using parallel Terraform operations.

---

## Key Concepts Demonstrated

* Infrastructure as Code (IaC)
* Terraform backend configuration
* Remote state management
* DynamoDB state locking
* Resource lifecycle management
* Dependency graph handling
* Clean DevOps workflow

---

## Security Note

The following files are excluded from version control:

* `.terraform/`
* `*.tfstate`
* `*.tfstate.backup`
* `terraform.tfvars` (if containing sensitive data)

Never commit Terraform state files to GitHub.

---

## Learning Outcome

Through this project, the following skills were implemented:

* Designing Terraform project structure
* Configuring production-grade remote backend
* Implementing safe state locking
* Managing AWS infrastructure lifecycle
* Applying DevOps best practices

---

## Author

**Bhoopendra Singh Bhadauria**

DevOps Learning Journey 🚀
Focused on Infrastructure Automation, Cloud, and Production-Grade IaC Practices.

---

## 📜 License

This project is created for educational and learning purposes.
