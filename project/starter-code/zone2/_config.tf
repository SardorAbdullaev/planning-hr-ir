terraform {
   backend "s3" {
     bucket = "udacity-tf-sardor-west"
     key    = "terraform/terraform.tfstate"
     region = "us-west-1"
   }
 }

 provider "aws" {
   region = "us-west-1"
   profile = "udacity"
   
   default_tags {
     tags = local.tags
   }
 }
