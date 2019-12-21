terraform {
  backend "s3" {
    bucket = "terraform-task-tfstate"
    key    = "infrastructure"
    region = "us-east-1"
  }
}