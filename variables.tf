variable "kind" {
  type = map(any)
  default = {
    mesh1 = {
      name = "clustermesh1"
      extra_port_mappings = [
        {
          container_port = 32042
          host_port      = 32042
        },
        {
          container_port = 31234
          host_port      = 31234
        },
        {
          container_port = 31235
          host_port      = 31235
        },
      ]
      pod_subnet     = "10.1.0.0/16"
      service_subnet = "172.20.1.0/24"
    }
    mesh2 = {
      name                = "clustermesh2"
      extra_port_mappings = []
      pod_subnet          = "10.2.0.0/16"
      service_subnet      = "172.20.2.0/24"
    }
  }
}

variable "cilium" {
  type = map(any)
  default = {
    mesh1 = {
      cluster_id = 1
      version    = "1.14.4"
    }
    mesh2 = {
      cluster_id = 2
      version    = "1.14.4"
    }
  }
}
