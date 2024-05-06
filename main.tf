locals {
  cert = module.cilium_clustermesh1.cilium_ca["crt"]
  key  = module.cilium_clustermesh1.cilium_ca["key"]
}

module "kind" {
  source = "./modules/kind"

  for_each       = var.kind
  name           = each.value.name
  pod_subnet     = each.value.pod_subnet
  service_subnet = each.value.service_subnet
  nodes_number   = 1
}

module "cilium_clustermesh1" {
  source          = "./modules/cilium-clustermesh"
  cluster_name    = var.kind.mesh1.name
  cluster_id      = var.cilium.mesh1.cluster_id
  release_version = var.cilium.mesh1.version
  service_type    = "NodePort"

  providers = {
    cilium = cilium.mesh1
  }

  depends_on = [module.kind]
}

module "cilium_clustermesh2" {
  source          = "./modules/cilium-clustermesh"
  cluster_name    = var.kind.mesh2.name
  cluster_id      = var.cilium.mesh2.cluster_id
  release_version = var.cilium.mesh2.version
  service_type    = "NodePort"
  extra_set       = ["tls.ca.cert=${local.cert}", "tls.ca.key=${local.key}"]

  providers = {
    cilium = cilium.mesh2
  }

  depends_on = [module.kind]
}

resource "cilium_clustermesh_connection" "this" {
  destination_context = "kind-${var.kind.mesh2.name}"
  provider            = cilium.mesh1
  depends_on = [
    module.cilium_clustermesh1,
    module.cilium_clustermesh2,
  ]
}
