terraform {
  backend "s3" {
    bucket = "eks-proj-bucket"
    key    = "terraform/dev-blue.tfstate"
    region = "us-east-1"
  }
}

