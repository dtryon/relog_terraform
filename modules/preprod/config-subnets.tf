
##############################################################
#### - Relog Public Subnet
##############################################################

resource "aws_subnet" "public_subnet" {
    vpc_id            = "${module.management.relog_vpc_id}"
    availability_zone = "${var.relog_az}"
    cidr_block        = "${var.relog_public_cidr}"

    tags {
        Environment   = "${var.environment}"
        Name          = "${var.environment} - Relog Public Subnet"
    }
}

##############################################################
#### - Relog DMZ Subnet
##############################################################

resource "aws_subnet" "dmz_subnet" {
    vpc_id            = "${module.management.relog_vpc_id}"
    availability_zone = "${var.relog_az}"
    cidr_block        = "${var.relog_dmz_cidr}"

    tags {
        Environment   = "${var.environment}"
        Name          = "${var.environment} - Relog DMZ Subnet"
    }
}


##############################################################
#### - Relog Application Layer Subnet
##############################################################

resource "aws_subnet" "app_subnet" {
    vpc_id              = "${module.management.relog_vpc_id}"
    availability_zone   = "${var.relog_az}"
    cidr_block          = "${var.relog_app_cidr}"

    tags {
        Environment     = "${var.environment}"
        Name            = "${var.environment} - Relog Application Layer Subnet"
    }
}
