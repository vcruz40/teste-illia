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
  config = local.config 
  
}

module "Athena" {
  source = "./modules/Athena"
  config = local.config 
  
}