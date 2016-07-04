# Create a new elastic load balancer

resource "aws_elb" "relog_elb" {
  name            = "${var.environment}-Relog-ELB"
  subnets         = ["${aws_subnet.public_subnet.id}"]
  security_groups = [ "${aws_security_group.relog_elb_security_group.id}"]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/health"
    interval            = 10
  }

  instances                   = ["${aws_instance.relog_rev_proxy.id}"]
  cross_zone_load_balancing   = false
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "${var.environment} - Relog ELB"
    Environment = "${var.environment}"
    Role = "ELB"
    VPC = "${module.management.relog_vpc_id}"
    VersionNumber = "1.0"
    Tier = "Public"
    Account = "${var.aws_account}"
  }
}
