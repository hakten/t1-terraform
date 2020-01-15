region          = "us-east-1"

cidr            = "10.20.0.0/16"

project         = "Test"
environment     = "Prod"

azs             = ["us-east-1a","us-east-1b","us-east-1c"]
public_subnets  = ["10.20.1.0/24","10.20.2.0/24","10.20.3.0/24"]
private_subnets = ["10.20.11.0/24","10.20.12.0/24","10.20.13.0/24"]