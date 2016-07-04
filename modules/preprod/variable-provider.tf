
##############################################################
#### - Relog Security Variables
##############################################################
variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_account" {
    default = "641822815404"
}

##############################################################
#### - Relog Environment
##############################################################
variable "environment" {}


##############################################################
#### - Relog AZ Variables
##############################################################

variable "relog_az" {
    default = "relog_az"
}


##############################################################
#### - Relog Subnet Variables (defaults)
##############################################################

variable "relog_public_cidr" {
    default = "public_cidr_variable"
}

variable "relog_dmz_cidr" {
    default = "dmz_cidr_variable"
}

variable "relog_app_cidr" {
    default = "app_cidr_variable"
}

