provider "aws" {}

resource "aws_instance" "db" {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5a.xlarge"

    count = 1
    tags = {
        Name = "database"
        owner = var.owner
    }

    subnet_id = var.subnet_id

    security_groups = var.security_groups
}

resource "aws_instance"  "manager"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5a.xlarge"

    count = 1
    tags = {
        Name = "database"
        owner = var.owner
    }

    subnet_id = var.subnet_id

    security_groups = var.security_groups
}