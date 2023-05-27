terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.55.0"
        }   
    }
    backend "s3" {
      bucket = "state-bucket"
      key = "ak"
      region = "us-east-1"
    }
}
provider "aws" {
    region = "us-east-1"
}
