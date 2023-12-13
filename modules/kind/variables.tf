variable "name" {
  type = string
}

variable "extra_port_mappings" {
  type    = list(any)
  default = []
}

variable "pod_subnet" {
  type = string
}

variable "service_subnet" {
  type = string
}
