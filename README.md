<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_cilium"></a> [cilium](#requirement\_cilium) | ~> 0.2.0 |
| <a name="requirement_kind"></a> [kind](#requirement\_kind) | 0.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cilium.mesh1"></a> [cilium.mesh1](#provider\_cilium.mesh1) | 0.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cilium_clustermesh1"></a> [cilium\_clustermesh1](#module\_cilium\_clustermesh1) | ./modules/cilium-clustermesh | n/a |
| <a name="module_cilium_clustermesh2"></a> [cilium\_clustermesh2](#module\_cilium\_clustermesh2) | ./modules/cilium-clustermesh | n/a |
| <a name="module_kind"></a> [kind](#module\_kind) | ./modules/kind | n/a |

## Resources

| Name | Type |
|------|------|
| [cilium_clustermesh_connection.this](https://registry.terraform.io/providers/littlejo/cilium/latest/docs/resources/clustermesh_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cilium"></a> [cilium](#input\_cilium) | n/a | `map(any)` | <pre>{<br>  "mesh1": {<br>    "cluster_id": 1,<br>    "version": "1.14.4"<br>  },<br>  "mesh2": {<br>    "cluster_id": 2,<br>    "version": "1.14.4"<br>  }<br>}</pre> | no |
| <a name="input_kind"></a> [kind](#input\_kind) | n/a | `map(any)` | <pre>{<br>  "mesh1": {<br>    "extra_port_mappings": [<br>      {<br>        "container_port": 32042,<br>        "host_port": 32042<br>      },<br>      {<br>        "container_port": 31234,<br>        "host_port": 31234<br>      },<br>      {<br>        "container_port": 31235,<br>        "host_port": 31235<br>      }<br>    ],<br>    "name": "clustermesh1",<br>    "pod_subnet": "10.1.0.0/16",<br>    "service_subnet": "172.20.1.0/24"<br>  },<br>  "mesh2": {<br>    "extra_port_mappings": [],<br>    "name": "clustermesh2",<br>    "pod_subnet": "10.2.0.0/16",<br>    "service_subnet": "172.20.2.0/24"<br>  }<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->