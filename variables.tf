variable "owner" {
    type = string
    default = "test"
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
    type=string
}

variable "node_count" {
    type=number
    default=3
}
