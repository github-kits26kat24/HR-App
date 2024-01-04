resource "aws_lb" "hr-load_balancer" {
  name               = "hr-Load-Balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hr-sg.id]
  subnets            = [aws_subnet.Node-One.id, aws_subnet.Node-Two.id, aws_subnet.Monitoring-Machine.id]

  enable_deletion_protection = false
  tags = {
    Environment = "hr"
  }
}
resource "aws_lb_listener" "hr-front_end" {
  load_balancer_arn = aws_lb.hr-load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hr.arn
  }
}
resource "aws_lb_target_group" "hr" {
  name     = "HR-Load-Balancer-Taget-Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.hr.id
}

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

resource "aws_lb_target_group_attachment" "node-three" {
  target_group_arn = aws_lb_target_group.hr.arn
  target_id        = aws_instance.Monitoring-Machine.id
  port             = 80
}
