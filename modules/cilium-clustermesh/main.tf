resource "cilium" "this" {
  set = concat([
    "cluster.name=${var.cluster_name}",
    "cluster.id=${var.cluster_id}",
    "ipam.mode=kubernetes",
  ], var.extra_set)
  version = var.release_version
}

resource "cilium_clustermesh" "this" {
  service_type = var.service_type
  depends_on = [
    cilium.this
  ]
}
