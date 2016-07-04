resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.relog_vpc_ireland.id}"

    tags {
        Name = "Relog IGW Ireland"
        Environment = "${var.environment}"
        Role = "igw"
        VPC = "${aws_vpc.relog_vpc_ireland.id}"
        VersionNumber = "1.0"
        Tier = "Public"
        Account = "${var.aws_account}"
        AZ = "${var.relog_az}"
    }
}

output "relog_igw_id" {
    value = "${aws_internet_gateway.igw.id}"
}
