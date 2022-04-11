terraform {

  required_version = "1.1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9"
    }
  }
  backend "s3" {
    bucket = "peakon-infrastructure"
    key    = "states/infra/fakeproduct"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

