terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.5.1"
    }
    cilium = {
      source  = "littlejo/cilium"
      version = "~> 0.2.0"
    }
  }
  required_version = ">= 1.3"
}

provider "kind" {}

provider "cilium" {
  alias   = "mesh1"
  context = module.kind["mesh1"].context
}

provider "cilium" {
  alias   = "mesh2"
  context = module.kind["mesh2"].context
}
