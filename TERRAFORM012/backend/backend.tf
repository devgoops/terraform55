terraform {
  backend "s3" {
    key    = "terraform/tfstate.tf"
    bucket = "tf-bucket-devops"
    region = "us-east-1"
  }
}   