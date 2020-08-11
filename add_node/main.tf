provider "aws" {}

resource "aws_instance"  "data"  {
    ami = "ami-0b2045146eb00b617"
    instance_type = "m5.4xlarge"
    key_name = var.ssh-key

    count = var.new_node_count

    root_block_device {
        volume_type           = var.volume_type
        volume_size           = var.volume_size
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