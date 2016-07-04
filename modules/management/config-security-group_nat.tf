resource "aws_security_group" "relog_security_group_nat" {
    name        = "Relog Management NAT"
    description = "NAT instance security group rules"
    vpc_id      = "${aws_vpc.relog_vpc_ireland.id}"

    ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["10.30.0.0/16"]
    }

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["10.30.0.0/16"]
    }

    egress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 25
        to_port         = 25
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["77.103.191.36/32"]
    }

    tags {
        "Name" = "mngt - Relog NAT"
    }
}
