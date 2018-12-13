provider "aws" {
  access_key = "AKIAJRYJXKM7WICMCQ2Q"
  secret_key = "1FIAMjUPBmV8jQthxVmRZjALohEUURDTBKc2Mero"
  region     = "ap-southeast-1"
}

data "aws_subnet_ids" "example" {
  vpc_id = "vpc-62222d06"
}

data "aws_subnet" "example" {
  count = "${length(data.aws_subnet_ids.example.ids)}"
  id    = "${data.aws_subnet_ids.example.ids[count.index]}"
}

output "subnet_cidr_blocks" {
  value = ["${data.aws_subnet.example.*.cidr_block}"]
}

