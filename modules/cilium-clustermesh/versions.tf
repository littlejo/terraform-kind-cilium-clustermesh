terraform {
  required_providers {
    cilium = {
      source  = "littlejo/cilium"
      version = ">= 0.1.0"
    }
  }
  required_version = ">= 1.3"
}
