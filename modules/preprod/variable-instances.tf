##############################################################
#### - Instances - Variables (defaults)
##############################################################

variable "rev_proxy" {
    default = {
        ami               = "ami_variable"
        availability_zone = "az_variable"
        key_name          = "key_name_variable"
        instance_type     = "instance_type_variable"
    }
}

variable "app_services" {
    default = {
        ami               = "ami_variable"
        availability_zone = "az_variable"
        key_name          = "key_name_variable"
        instance_type     = "instance_type_variable"
        ebs_volume_size   = "ebs_volume_size"
    }
}
