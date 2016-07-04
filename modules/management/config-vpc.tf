resource "aws_vpc" "relog_vpc_ireland" {
    cidr_block           = "10.30.0.0/16"
    enable_dns_hostnames = false
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "Name" = "Relog VPC Ireland"
        "VersionNumber" = "1.0"
    }
}

output "relog_vpc_id" {
    value = "${aws_vpc.relog_vpc_ireland.id}"
}
