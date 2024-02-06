provider "aws" {
  region = "us-east-1"
}
terraform {
  required_version = ">= 1.0"
  
  backend "s3" {
    bucket = "bucket-ilia-terraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

module "eks" {
  source = "./modules/EKS"
  subnet1 = "subnet-0be1e8ed6f8ec00ea"
  subnet2 = "subnet-0c1a6ae745c5a36f2"
}

module "Athena" {
  source = "./modules/Athena"
  
}
