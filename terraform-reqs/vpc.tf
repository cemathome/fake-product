locals {
  aws_region = "us-east-1"
}

module "fake_product_production_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = "fake-product-production"
  cidr = "10.0.0.0/16"

  azs             = ["${local.aws_region}a", "${local.aws_region}b", "${local.aws_region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  create_igw             = false
  create_egress_only_igw = false

  private_subnet_tags = {
    "private_subnet" = true
  }

  public_subnet_tags = {
    "public_subnet" = true
  }
}

module "fake_product_staging_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = "fake-product-staging"
  cidr = "10.1.0.0/16"

  azs             = ["${local.aws_region}a", "${local.aws_region}b", "${local.aws_region}c"]
  private_subnets = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  public_subnets  = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]

  create_igw             = false
  create_egress_only_igw = false

  private_subnet_tags = {
    "private_subnet" = true
  }

  public_subnet_tags = {
    "public_subnet" = true
  }
}
