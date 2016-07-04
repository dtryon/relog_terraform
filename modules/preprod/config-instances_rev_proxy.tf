
##############################################################
#### - Instances - reverse proxy
##############################################################


resource "aws_instance" "relog_rev_proxy" {
    ami                         = "${var.rev_proxy.ami}"
    instance_type               = "${var.rev_proxy.instance_type}"
    subnet_id                   = "${aws_subnet.dmz_subnet.id}"
    key_name                    = "${var.rev_proxy.key_name}"
    vpc_security_group_ids      = ["${aws_security_group.relog_rev_proxy_security_group.id}"]
    associate_public_ip_address = false
    monitoring                  = true
    tags {
        Environment = "${var.environment}"
        Role = "rev_proxy"
        Name = "${var.environment} - Relog Reverse Proxy Instance"
        VPC = "${module.management.relog_vpc_id}"
        VersionNumber = "1.0"
        Tier = "DMZ"
        Account = "${var.aws_account}"
        AZ = "${var.relog_az}"
    }
}
