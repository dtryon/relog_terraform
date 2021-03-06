##############################################################
#### - Relog Public Route Table
##############################################################

resource "aws_route_table" "public_route_table" {
    vpc_id              = "${aws_vpc.relog_vpc_ireland.id}"
    
    route {
        cidr_block      = "0.0.0.0/0"
        gateway_id      = "${aws_internet_gateway.igw.id}"
    }

    tags {
        Name            = "mngt - Relog Public Route Table"
    }
}

resource "aws_route_table_association" "public_route_table_association" {
    subnet_id           = "${aws_subnet.public_subnet.id}"
    route_table_id      = "${aws_route_table.public_route_table.id}"
}


##############################################################
#### - Relog Application Layer Route Table
##############################################################

resource "aws_route_table" "app_route_table" {
    vpc_id              = "${aws_vpc.relog_vpc_ireland.id}"
    
    route {
        cidr_block      = "0.0.0.0/0"
        instance_id     = "${aws_instance.relog_nat.id}"
    }

    tags {
        Name            = "mngt - Relog App Layer Route Table"
    }
}

resource "aws_route_table_association" "app_route_table_association" {
    subnet_id           = "${aws_subnet.app_subnet.id}"
    route_table_id      = "${aws_route_table.app_route_table.id}"
}
