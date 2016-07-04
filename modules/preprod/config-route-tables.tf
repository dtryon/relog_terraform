
##############################################################
#### - Relog Public Route Table
##############################################################

resource "aws_route_table" "public_route_table" {
    vpc_id              = "${module.management.relog_vpc_id}"
    
   route {
        cidr_block      = "0.0.0.0/0"
        gateway_id      = "${module.management.relog_igw_id}"
    }

    tags {
        Environment     = "${var.environment}"
        Name            = "${var.environment} - Relog Public Route Table"
    }
}

resource "aws_route_table_association" "public_route_table_association" {
    subnet_id           = "${aws_subnet.public_subnet.id}"
    route_table_id      = "${aws_route_table.public_route_table.id}"
}

##############################################################
#### - Relog DMZ Route Table
##############################################################

resource "aws_route_table" "dmz_route_table" {
    vpc_id              = "${module.management.relog_vpc_id}"
    
    route {
        cidr_block      = "0.0.0.0/0"
        instance_id     = "${module.management.relog_nat_id}"
    }

    tags {
        Environment     = "${var.environment}"
        Name            = "${var.environment} - Relog DMZ Route Table"
    }
}

resource "aws_route_table_association" "dmz_route_table_association" {
    subnet_id           = "${aws_subnet.dmz_subnet.id}"
    route_table_id      = "${aws_route_table.dmz_route_table.id}"
}


##############################################################
#### - Relog Application Layer Route Table
##############################################################

resource "aws_route_table" "app_route_table" {
    vpc_id              = "${module.management.relog_vpc_id}"
    
    route {
        cidr_block      = "0.0.0.0/0"
        instance_id     = "${module.management.relog_nat_id}"
    }

    tags {
        Environment     = "${var.environment}"
        Name            = "${var.environment} - Relog Application Layer Route Table"
    }
}

resource "aws_route_table_association" "app_route_table_association" {
    subnet_id           = "${aws_subnet.app_subnet.id}"
    route_table_id      = "${aws_route_table.app_route_table.id}"
}

