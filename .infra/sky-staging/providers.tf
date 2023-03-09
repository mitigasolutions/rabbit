terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "mitigatfstate"
    container_name       = "tfstate"
    key                  = "sky/staging/rabbit/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.staging.kube_config.0.host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.staging.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.staging.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.staging.kube_config.0.cluster_ca_certificate)
}
