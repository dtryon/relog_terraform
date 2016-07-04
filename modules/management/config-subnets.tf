resource "aws_subnet" "public_subnet" {
    vpc_id                  = "${aws_vpc.relog_vpc_ireland.id}"
    cidr_block              = "10.30.0.64/28"
    availability_zone       = "${var.relog_az}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "mngt - Relog Public Subnet"
    }
}

output "relog_mngt_public_subnet_id" {
    value = "${aws_subnet.public_subnet.id}"
}

output "relog_mngt_public_subnet_cidr_block" {
    value = "${aws_subnet.public_subnet.cidr_block}"
}




resource "aws_subnet" "app_subnet" {
    vpc_id                  = "${aws_vpc.relog_vpc_ireland.id}"
    cidr_block              = "10.30.3.0/24"
    availability_zone       = "${var.relog_az}"
    map_public_ip_on_launch = false

    tags {
        "Name" = "mngt - Relog App Layer Subnet"
    }
}

output "relog_mngt_app_subnet_id" {
    value = "${aws_subnet.app_subnet.id}"
}

output "relog_mngt_app_subnet_cidr_block" {
    value = "${aws_subnet.app_subnet.cidr_block}"
}
