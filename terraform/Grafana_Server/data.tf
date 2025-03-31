data "aws_ami" "amazonlinux2023" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-2023.6.20250317.2-kernel-6.1-x86_64"]
  }
}
