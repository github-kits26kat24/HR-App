
# create application load balancer
resource "aws_lb" "hr-load_balancer" {
  name               = "hr-Load-Balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hr-sg.id]
  subnets            = [aws_subnet.Node-One.id, aws_subnet.Node-Two.id]

  enable_deletion_protection = false
  tags = {
    Environment = "hr"
  }
}

# create target group
resource "aws_lb_target_group" "hr" {
  name     = "HR-Load-Balancer-Taget-Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.hr.id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }
}

# create target group attachment
resource "aws_lb_target_group_attachment" "node-one" {
  target_group_arn = aws_lb_target_group.hr.arn
  target_id        = aws_instance.Node-One.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "node-two" {
  target_group_arn = aws_lb_target_group.hr.arn
  target_id        = aws_instance.Node-Two.id
  port             = 80
}

# create a listener on port 80 with forward action
resource "aws_lb_listener" "hr_http_listener2" {
  load_balancer_arn = aws_lb.hr-load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hr.arn
  }
}

# # create a listener on port 80 with redirect action
# resource "aws_lb_listener" "hr_http_listener" {
#   load_balancer_arn = aws_lb.hr-load_balancer.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"

#     redirect {
#       port        = 443
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }


# # create a listener on port 443 with forward action
# resource "aws_lb_listener" "hr_https_listener" {
#   load_balancer_arn = aws_lb.hr-load_balancer.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.hr.arn
#   }
# }