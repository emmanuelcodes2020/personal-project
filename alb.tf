# Application load balancer
resource "aws_lb" "personal_application_lb" {
    name = "personal-application-lb"
    load_balancer_type = "application"
    security_groups = [aws_security_group.personal_application_lb_sg.id]
    subnets = var.subnet_ranges
}


resource "aws_alb_target_group" "personal_alb_tg" {
  name = "personal-app-alb-tg"
  target_type = "instance"
  protocol = "HTTP"
  port = 80
  vpc_id = var.vpc_id
  health_check {
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
    path = "/"
    port = 80
  
  }
}

resource "aws_alb_listener" "personal_alb_listener" {
  load_balancer_arn = aws_lb.personal_application_lb.arn
  protocol = "HTTP"
  port = 80
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.personal_alb_tg.arn
  }


}


resource "aws_alb_target_group_attachment" "personal_tg_attachment" {
  target_group_arn = aws_alb_target_group.personal_alb_tg.arn
  target_id = aws_instance.personal-app.id
  port = 80

  
}