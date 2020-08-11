provider "aws" {}

resource "aws_instance" "db" {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5.xlarge"
    key_name = var.ssh-key

    tags = {
        Name = join("-", [var.prefix, "database"])
        owner = var.owner
        enddate = var.enddate
    }

    root_block_device {
        volume_type           = var.volume_type
        volume_size           = var.volume_size
        iops                  = var.iops
        delete_on_termination = true
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]

}

resource "aws_instance"  "manager"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5.xlarge"
    key_name = var.ssh-key

    tags = {
        Name = join("-", [var.prefix, "manager"])
        owner = var.owner
        enddate = var.enddate
    }

    root_block_device {
        volume_type           = var.volume_type
        volume_size           = var.volume_size
        delete_on_termination = true
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]

}

resource "aws_instance"  "krb5"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5.large"
    key_name = var.ssh-key

    tags = {
        Name = join("-", [var.prefix, "krb5"])
        owner = var.owner
        enddate = var.enddate
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]

}

resource "aws_instance"  "master"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5.2xlarge"
    key_name = var.ssh-key

    count = 3

    root_block_device {
        volume_type           = var.volume_type
        volume_size           = var.volume_size
        iops                  = var.iops
        delete_on_termination = true
    }

    tags = {
        Name = join("-", [var.prefix, "master"])
        owner = var.owner
        enddate = var.enddate
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]

}

resource "aws_instance"  "edge"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5.xlarge"
    key_name = var.ssh-key

    tags = {
        Name = join("-", [var.prefix, "edge"])
        owner = var.owner
        enddate = var.enddate
    }

    root_block_device {
        volume_type           = var.volume_type
        volume_size           = var.volume_size
        iops                  = var.iops
        delete_on_termination = true
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]

}

resource "aws_instance"  "data"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5.2xlarge"
    key_name = var.ssh-key

    count = var.node_count

    root_block_device {
        volume_type           = var.volume_type
        volume_size           = var.volume_size
        iops                  = var.iops
        delete_on_termination = true
    }

    tags = {
        Name = join("-", [var.prefix, "data"])
        owner = var.owner
        enddate = var.enddate
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]

}

resource "aws_instance"  "cdf"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5.xlarge"
    key_name = var.ssh-key

    count = var.cdf_node_count

    root_block_device {
        volume_type           = var.volume_type
        volume_size           = var.volume_size
        iops                  = var.iops
        delete_on_termination = true
    }

    tags = {
        Name = join("-", [var.prefix, "cdf"])
        owner = var.owner
        enddate = var.enddate
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]

}


resource "aws_instance"  "cdf_admin"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5.xlarge"
    key_name = var.ssh-key

    root_block_device {
        volume_type           = var.volume_type
        volume_size           = var.volume_size
        iops                  = var.iops
        delete_on_termination = true
    }

    tags = {
        Name = join("-", [var.prefix, "cdf_admin"])
        owner = var.owner
        enddate = var.enddate
    }

    subnet_id = var.subnet_id

    security_groups = [var.security_group]

}