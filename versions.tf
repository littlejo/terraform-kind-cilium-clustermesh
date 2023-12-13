terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.2.1"
    }
    cilium = {
      source  = "littlejo/cilium"
      version = "0.0.3"
    }
  }
  required_version = ">= 1.3"
}

provider "kind" {}

provider "cilium" {
  alias       = "mesh1"
  config_path = module.kind["mesh1"].kubeconfig_path
}

provider "cilium" {
  alias       = "mesh2"
  config_path = module.kind["mesh2"].kubeconfig_path
}

provider "cilium" {
  alias   = "global"
  context = terraform_data.context1.input
}
