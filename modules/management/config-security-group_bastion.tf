resource "aws_security_group" "relog_security_group_bastion" {
    name        = "Relog Bastion Security Group"
    vpc_id      = "${aws_vpc.relog_vpc_ireland.id}"

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        "Name" = "mngt - Relog Bastion Security Group"
    }
}
