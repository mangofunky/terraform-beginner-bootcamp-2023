terraform {
  required_providers {
    aws = {
     source = "hashicorp/aws"
     version = "5.30.0"
    }
  }
  # cloud {
  #   organization = "terraform-bootcamp-1337"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
}

provider "aws" {
  region = "us-east-1"
}
