resource "aws_instance" "relog_bastion" {
    ami                         = "ami-69b9941e"
    availability_zone           = "${var.relog_az}"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "relog-bastion"
    subnet_id                   = "${aws_subnet.public_subnet.id}"
    vpc_security_group_ids      = ["${aws_security_group.relog_security_group_bastion.id}"]
    associate_public_ip_address = true
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        iops                  = 24
        delete_on_termination = true
    }

    tags {
        Name = "${var.environment} - Relog Bastion Instance (public)"
        Environment = "${var.environment}"
        Role = "bastion"
        VPC = "${aws_vpc.relog_vpc_ireland.id}"
        VersionNumber = "1.0"
        Tier = "Public"
        Account = "${var.aws_account}"
        AZ = "${var.relog_az}"
    }
}
