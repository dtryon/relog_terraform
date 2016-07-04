
##############################################################
#### - Instances - Application Services
##############################################################


resource "aws_instance" "relog_app_services" {
    ami                         = "${var.app_services.ami}"
    instance_type               = "${var.app_services.instance_type}"
    subnet_id                   = "${aws_subnet.app_subnet.id}"
    key_name                    = "${var.app_services.key_name}"
    vpc_security_group_ids      = ["${aws_security_group.relog_app_services_security_group.id}"]
    associate_public_ip_address = false
    monitoring                  = true
    ebs_optimized               = true
    root_block_device {
        volume_type = "gp2"
        volume_size = "${var.app_services.ebs_volume_size}"
    }
    tags {
        Environment = "${var.environment}"
        Role = "app_services"
        Name = "${var.environment} - Relog Application Services Instance"
        VPC = "${module.management.relog_vpc_id}"
        VersionNumber = "1.0"
        Tier = "Application"
        Account = "${var.aws_account}"
        AZ = "${var.relog_az}"
    }
}
