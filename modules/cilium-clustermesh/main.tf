resource "cilium" "this" {
  set = [
    "cluster.name=${var.cluster_name}",
    "cluster.id=${var.cluster_id}",
    "ipam.mode=kubernetes",
  ]
  version = var.release_version
}

resource "cilium_clustermesh" "this" {
  service_type = var.service_type
  depends_on = [
    cilium.this
  ]
}
