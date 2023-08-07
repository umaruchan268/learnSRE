terraform {
   backend "s3" {
     bucket = "udacity-tf-tscotto"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
    access_key = "AKIA542XT4NUDQKUL2ME"
    secret_key = "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"
   }
 }

 provider "aws" {
   region = "us-east-2"
   
   default_tags {
     tags = local.tags
   }
 }