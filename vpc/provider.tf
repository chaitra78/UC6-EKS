# here we configure AWS provider
provider "aws" {
  #configuration options
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
}
  backend "s3" { #backend info should always be in terraform block
    bucket         = "my-s3-bucket-name-cr"
    key            = "terraform.tfstate"
    region         = "us-east-1" # region of bucket and dynamodb
  #  use_lockfile = true     #s3 by default supports locking but to be explicit
  # encrypt       = true
  }
}

