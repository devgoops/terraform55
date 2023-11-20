variable "server_names" {
  type = list(string)
}

variable "ingress" {
  type    = list(number)
  default = [80, 443, 22]
}

variable "egress" {
  type    = list(number)
  default = [80, 443]
}