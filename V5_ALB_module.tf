module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.8.0"
  
  name = "${local.name}-alb"

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = [ module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  security_groups    = [module.loadbalancer_sg.this_security_group_id]

  http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      # action_type        = "forward"
    }
  ]

  target_groups = [
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"

      #Register target information



      targets = {
        my_app1_vm1 = {
          target_id = module.private_instance.id
          port      = 80
        }
      }
      tags = {
        InstanceTargetGroupTag = "baz"
      }
    }
  ]

}
