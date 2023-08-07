terraform {
   backend "s3" {
     bucket = "uyen260801"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
    access_key = "<access-key>"
    secret_key = "<secret-key>"
   }
 }

  provider "aws" {
   region = "us-east-2"
   
   default_tags {
     tags = local.tags
   }
 }