# Create Security Group - SSH Traffic and other ports
resource "aws_security_group" "web-traffic" {
  name = "Grafana-sg"

  dynamic "ingress" {
    for_each = var.ingressrules
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.egressrules
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    "Name" = "Grafana-sg"
  }
}
