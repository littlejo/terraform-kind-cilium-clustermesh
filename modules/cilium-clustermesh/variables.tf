variable "cluster_name" {
  type = string
}

variable "cluster_id" {
  type = string
}


variable "extra_set" {
  type    = list(string)
  default = []
}

variable "release_version" {
  type = string
}

variable "service_type" {
  type = string
}
