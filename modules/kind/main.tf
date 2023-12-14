resource "kind_cluster" "this" {
  name = var.name

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      dynamic "extra_port_mappings" {
        for_each = var.extra_port_mappings
        content {
          container_port = extra_port_mappings.value["container_port"]
          host_port      = extra_port_mappings.value["host_port"]
        }
      }
    }

    dynamic "node" {
      for_each = range(var.nodes_number)
      content {
        role = "worker"
      }
    }

    networking {
      disable_default_cni = true
      pod_subnet          = var.pod_subnet
      service_subnet      = var.service_subnet
    }
  }
}
