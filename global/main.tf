# example.tf

provider "aws" {
  region = "ap-southeast-1"
}

# terraform state file setup
# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "hcvn-terraform-state-storage-s3" {
    bucket = "hcvn-terraform-remote-state-storage-s3"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    tags {
      Name = "S3 Remote Terraform State Store"
    }
}

resource "aws_dynamodb_table" "hcvn-dynamodb-terraform-state-lock" {
  name = "hcvn-terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags {
    Name = "DynamoDB Terraform State Lock Table"
  }
}
