
resource "aws_security_group" "relog_rev_proxy_security_group" {
  name        = "${var.environment} - Relog Reverse Proxy Security Group"
  description = "Allow all inbound traffic"
  vpc_id      = "${module.management.relog_vpc_id}"

  tags {
    Environment     = "${var.environment}"
    Name            = "${var.environment} - Relog Reverse Proxy Security Group"
  }

  # ssh bastion
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["${module.management.relog_mngt_public_subnet_cidr_block}"]
  }

  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
