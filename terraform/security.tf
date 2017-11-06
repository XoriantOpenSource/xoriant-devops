resource "aws_security_group" "main_security_group" {
  name        = "terraform"
  description = "VPC SG"
  vpc_id      = "${aws_vpc.main.id}"
}

// Allow any internal network flow.
resource "aws_security_group_rule" "ingress_any_any_self" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  self              = true
  type              = "ingress"
}

// Allow egress all
resource "aws_security_group_rule" "egress_all_all_all" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  type = "egress"
}

// Allow TCP:80 (HTTP)
resource "aws_security_group_rule" "ingress_tcp_80_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
}

// Allow TCP:22 (SSH)
resource "aws_security_group_rule" "ingress_ssh_22_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
}
// Allow TCP:9090 (Prom)
resource "aws_security_group_rule" "ingress_tcp_9090_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
}

// Allow TCP:9100 (HTTP-ALT)
resource "aws_security_group_rule" "ingress_tcp_9100_cidr" {
  security_group_id = "${aws_security_group.main_security_group.id}"
  from_port         = 9100
  to_port           = 9100
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
}
