data "azurerm_resource_group" "staging" {
  name = "sky-staging"
}

data "azurerm_kubernetes_cluster" "staging" {
  name                = "sky-staging"
  resource_group_name = data.azurerm_resource_group.staging.name
}

data "azurerm_private_dns_zone" "staging" {
  name                = "staging.mitigasolutions.com"
  resource_group_name = data.azurerm_resource_group.staging.name
}

data "kubernetes_service" "nginx" {
  metadata {
    name      = "nginx-internal-ic-nginx-ingress-controller"
    namespace = "ingress-controller"
  }
}

resource "azurerm_private_dns_a_record" "rabbit" {
  name                = "rabbit"
  zone_name           = data.azurerm_private_dns_zone.staging.name
  resource_group_name = data.azurerm_resource_group.staging.name
  ttl                 = 300
  records             = [data.kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.ip]
}
