terraform {
   backend "s3" {
     bucket = "uyen260801"
     key    = "terraform/terraform.tfstate"
     region = "us-west-1"
    access_key = "AKIA542XT4NUDQKUL2ME"
    secret_key = "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"
   }
 }

 provider "aws" {
   region = "us-west-1"
   
   default_tags {
     tags = local.tags
   }
 }