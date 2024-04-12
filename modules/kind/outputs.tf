output "kubeconfig_path" {
  value = kind_cluster.this.kubeconfig_path
}

output "context" {
  value = "kind-${kind_cluster.this.name}"
}
