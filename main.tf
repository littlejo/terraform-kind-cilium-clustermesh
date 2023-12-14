module "kind" {
  source = "./modules/kind"

  for_each       = var.kind
  name           = each.value.name
  pod_subnet     = each.value.pod_subnet
  service_subnet = each.value.service_subnet
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
}

module "cilium_clustermesh2" {
  source          = "./modules/cilium-clustermesh"
  cluster_name    = var.kind.mesh2.name
  cluster_id      = var.cilium.mesh2.cluster_id
  release_version = var.cilium.mesh2.version
  service_type    = "NodePort"

  providers = {
    cilium = cilium.mesh2
  }
}

resource "terraform_data" "context1" {
  input = "kind-${var.kind.mesh1.name}"
  depends_on = [
    module.kind,
  ]
}

resource "cilium_clustermesh_connection" "this" {
  destination_context = "kind-${var.kind.mesh2.name}"
  provider            = cilium.global
  depends_on = [
    module.cilium_clustermesh1,
    module.cilium_clustermesh2,
  ]
}
