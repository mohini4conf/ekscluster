resource "aws_vpc" "main-vpc" {
cidr_block = "10.0.0.0/16"
enable_dns_support = "true" #gives you an internal domain name
enable_dns_hostnames = "true" #gives you an internal host name
instance_tenancy = "default"

tags =  {
Name = "main-vpc"
}
}
resource "aws_subnet" "prod-subnet-public-1" {
vpc_id = "${aws_vpc.main-vpc.id}"
cidr_block = "10.0.1.0/24"
map_public_ip_on_launch = "true" //it makes this a public subnet
availability_zone = "ap-south-1a"
tags =  {
Name = "prod-subnet-public-1"
}
}

resource "aws_subnet" "prod-subnet-public-2" {
  vpc_id = "${aws_vpc.main-vpc.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone = "ap-south-1b"
  tags =  {
    Name = "prod-subnet-public-2"
  }
}