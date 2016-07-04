
resource "aws_security_group" "relog_app_services_security_group" {
  name          = "${var.environment} - Relog App Security Group"
  description   = "Allow all inbound traffic"
  vpc_id        = "${module.management.relog_vpc_id}"

  tags {
        Environment = "${var.environment}"
        Name = "${var.environment} - Relog App Services Security Group"
    }

  # ssh bastion
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["${module.management.relog_mngt_public_subnet_cidr_block}"]
  }

  # app services
  ingress {
      from_port   = 8081
      to_port     = 8081
      protocol    = "tcp"
      cidr_blocks = ["${aws_subnet.dmz_subnet.cidr_block}"]
  }

  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
