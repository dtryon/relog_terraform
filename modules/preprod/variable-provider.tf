
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

variable "mixerati_az" {
    default = "mixerati_az"
}


##############################################################
#### - Relog Subnet Variables (defaults)
##############################################################

variable "mixerati_public_cidr" {
    default = "public_cidr_variable"
}

variable "mixerati_dmz_cidr" {
    default = "dmz_cidr_variable"
}

variable "mixerati_app_cidr" {
    default = "app_cidr_variable"
}

