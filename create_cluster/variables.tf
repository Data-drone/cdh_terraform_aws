variable "owner" {
    type = string
    default = "test"
}

variable "prefix" {
    type = string
    default = "dev"
}

variable "enddate" {
    type = string
    default = "07202020"
}

variable "security_group" {
    type = string
    default = "sg-0000000"
}

variable "subnet_id"  {
    type = string
    default = "sb-000000"
}

variable "ssh-key" {
    type = string
}

variable "node_count" {
    type = number
    default = 3
}

variable "cdf_node_count" {
    type = number
    default = 3
}

variable "volume_type" {
    type = string
    default = "gp2"
}

variable "volume_size" {
    type = number
    default = 100
}

variable "iops" {
    type = number
    default = 1000
}

