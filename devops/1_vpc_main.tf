module "vpc" {
  source = "git::http://gitlab-ce/tf-aws-mods/vpc.git?ref=v1.0"

  name = "staging-environment-vpc"

  cidr = "10.20.32.0/20"

  azs                 = ["ap-southeast-1a", "aps-southeast-1b"]
  public_subnets      = ["10.20.32.0/23","10.20.34.0/23"]
  private_subnets     = ["10.20.36.0/23","10.20.38.0/23"]
  database_subnets    = ["10.20.40.0/23","10.20.42.0/23"]
  intra_subnets       = ["10.20.44.0/23","10.20.46.0/23"]

  create_database_subnet_group = true
  create_database_subnet_route_table = true

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_vpn_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_s3_endpoint       = true
  enable_dynamodb_endpoint = true

  enable_dhcp_options              = true
  dhcp_options_domain_name         = "staging.hcvn-awscloud.com"
  dhcp_options_domain_name_servers = ["127.0.0.1", "10.20.32.0.2"]

  database_subnet_tags = {
    target = "db instances"
  }

  private_subnet_tags = {
    target = "application instances"
  }

  intra_subnet_tags = {
    target = "services, others"
  }

  tags = {
    Owner       = "itarch"
    Environment = "staging"
    terraform   = "true"
    Name        = "staging evnironment"
  }
}
