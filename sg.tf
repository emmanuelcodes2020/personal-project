resource "aws_security_group" "personal_application_sg" {
  name        = "personal-application-sg"
  description = "security group for HTTP"
  vpc_id      = "vpc-043e1dc52827b0366"

  tags = {

    Name = "personal_application_sg"
  }
}


resource "aws_security_group_rule" "ingress_https_access" {
  type              = "ingress"
  description       = "HTTPS  access"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.personal_application_sg.id
}


resource "aws_security_group_rule" "ingress_ssh_access" {
  type              = "ingress"
  description       = "SSH access"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.personal_application_sg.id

}




resource "aws_security_group_rule" "ingress_http_access" {
  type              = "ingress"
  description       = "HTTP access"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.personal_application_sg.id


}



resource "aws_security_group_rule" "egress_http_access" {
  type              = "egress"
  description       = "All traffic access to our VPC "
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.personal_application_sg.id

}



# Security group for out application load balancer 

resource "aws_security_group" "personal_application_lb_sg" {
  name        = "personal-application-lb-sg"
  description = "security group for HTTP"
  vpc_id      = "vpc-043e1dc52827b0366"

  tags = {

    Name = "personal_application_lb_sg"
  }
}


resource "aws_security_group_rule" "ingress_https_access_lb" {
  type              = "ingress"
  description       = "HTTPS  access"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.personal_application_lb_sg.id
}





resource "aws_security_group_rule" "ingress_http_access_lb" {
  type              = "ingress"
  description       = "HTTP access"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.personal_application_lb_sg.id


}



resource "aws_security_group_rule" "egress_http_access_lb" {
  type              = "egress"
  description       = "All traffic access to our VPC "
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["172.31.0.0/16"]
  security_group_id = aws_security_group.personal_application_lb_sg.id

}
