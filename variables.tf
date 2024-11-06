######################### # Administrator VARs
variable "admin" {
  description = "Administrator VARs"

  type = object({
    secret_key  = string
    access_key  = string
    pubkey_name = string
    public_key  = string
  })
}

######################### ID VPC

variable "VPC_ID" {
  description = "INSERT VPC ID HERE !"
  type = string
  default = "vpc-1A738697"
}


######################### Security Group
variable "SecGroup" {

  description = "Security group var"

  type = object({
    name            = string
    allow_tcp_ports = list(string)
    allow_udp_ports = list(string)

    allow_from_ips  = list(string)
    allow_to_ips    = list(string)

    yourself        = bool
    }
  )

  default = {
    name            = "main"

    allow_tcp_ports = ["22", "443", "80", "5443-5445", "6443", "7443", "8443", "10443", "10483", "11443", "12443", "14443", "17443", "18443", "21443", "22443", "23443"]
    allow_udp_ports = ["1194"]

    allow_from_ips  = ["185.12.31.131/32", "8.8.8.8/32"]
    allow_to_ips    = ["0.0.0.0/0"]

    yourself        = true
  }
}
