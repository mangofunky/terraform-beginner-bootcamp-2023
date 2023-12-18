terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
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

provider "random" {
  #https://registry.terraform.io/providers/hashicorp/random/latest/docs
  # Configuration options
}