#VPC conf
resource "aws_vpc" "main" {
  cidr_block       = "172.33.0.0/16"
  instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "main"
    }
}

# Subnets
resource "aws_subnet" "main-public-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.33.1.0/20"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"

    tags {
        Name = "main-public-1"
    }
}

# Internet GW
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "main"
    }
}

# route tables
resource "aws_route_table" "main-public" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "main-public"
    }
}

# route associations public
resource "aws_route_table_association" "main-public" {
    subnet_id = "${aws_subnet.main-public-1.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
