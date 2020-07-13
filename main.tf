provider "aws" {}

resource "aws_instance" "db" {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5a.xlarge"

    tags = {
        Name = "database"
        owner = var.owner
        enddate = var.enddate
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]
}

resource "aws_instance"  "manager"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5a.xlarge"

    tags = {
        Name = "manager"
        owner = var.owner
        enddate = var.enddate
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]
}

resource "aws_instance"  "data"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5a.xlarge"

    count = var.node_count
    tags = {
        Name = "data"
        owner = var.owner
        enddate = var.enddate
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]
}