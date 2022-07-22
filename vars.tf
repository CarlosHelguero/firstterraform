variable "AWS_REGION" {    
    default = "us-east-1"
}

variable "AWS_AZONE" {
    default = "us-east-1a"
}
variable "PRIVATE_KEY" {
    default = "demo_key_pair"
}
variable "PUBLIC_KEY" {
    default = "demo "
}

variable "EC2_User" {
    default = "ubuntu"
}
variable "AMI" {
    type = "map"
    default {
        ker510 = "ami-0cff7528ff583bf9a"
        ker414 = "ami-065efef2c739d613b"
    }
}


