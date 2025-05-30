variable "region" {
  type    = string
  default = "us-east-1"
}
variable "my_instance_type" {
  type    = string
  default = "t2.micro"
}


variable "my_key" {
  description = "AWS EC2 Key pair that needs to be associated with EC2 Instance"
  type        = string
  default     = "cicd"
}

variable "ingressrules" {
  type    = list(number)
  default = [22, 80, 443, 8080]
}

variable "egressrules" {
  type    = list(number)
  default = [25, 80, 443, 8080, 8090, 3306, 53]
}