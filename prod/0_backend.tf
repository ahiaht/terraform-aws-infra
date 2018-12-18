terraform {
  backend "s3" {
    bucket = "hcvn-terraform-remote-state-storage-s3"
    key    = "itarch/prdo/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

