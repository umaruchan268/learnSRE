terraform {
   backend "s3" {
     bucket = "uyen260801"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
    shared_credentials_file = "$HOME/.aws/credentials
   }
 }

 provider "aws" {
   region = "us-east-2"
   
   default_tags {
     tags = local.tags
   }
 }