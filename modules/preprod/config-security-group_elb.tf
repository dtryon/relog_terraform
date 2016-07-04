
resource "aws_security_group" "relog_elb_security_group" {
  name        = "${var.environment} - Relog ELB Group"
  description = "ELB Security Group"
  vpc_id      = "${module.management.relog_vpc_id}"

  tags {
    Environment     = "${var.environment}"
    Name            = "${var.environment} - Relog ELB Security Group"
  }

  # public
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
