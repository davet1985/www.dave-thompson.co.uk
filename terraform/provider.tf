provider "aws" {
  region     = "${var.region}"
}

terraform {
  backend "s3" {
    bucket  = "s3-websites-terraform-state"
    key     = "www.dave-thompson.co.uk/terraform.tfstate"
    region  = "eu-west-2"
  }
}
