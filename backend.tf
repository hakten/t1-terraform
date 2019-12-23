terraform {
  backend "s3" {
    bucket = "terraform-tfstate-huseyin"
    key    = "t1-terraform"
    region = "us-east-1"
  }
}