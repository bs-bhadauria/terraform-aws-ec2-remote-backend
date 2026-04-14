terraform {
  backend "s3" {
    bucket         = "bhoopendra-terraform-state-unique"
    key            = "ec2-project/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
