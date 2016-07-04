resource "aws_instance" "relog_nat" {
    ami                         = "ami-14913f63"
    availability_zone           = "${var.relog_az}"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "relog-nat"
    subnet_id                   = "${aws_subnet.public_subnet.id}"
    vpc_security_group_ids      = ["${aws_security_group.relog_security_group_nat.id}"]
    associate_public_ip_address = true
    source_dest_check           = false

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        iops                  = 24
        delete_on_termination = true
    }

    tags {
        Name = "${var.environment} - Relog NAT (public)"
        Environment = "${var.environment}"
        Role = "nat"
        VPC = "${aws_vpc.relog_vpc_ireland.id}"
        VersionNumber = "1.0"
        Tier = "Public"
        Account = "${var.aws_account}"
        AZ = "${var.relog_az}"
    }
}

output "relog_nat_id" {
    value = "${aws_instance.relog_nat.id}"
}
