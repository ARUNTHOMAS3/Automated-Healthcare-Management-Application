terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.110.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2dd3ecce-ca24-4ef4-9d28-70a5f724d730"
  tenant_id       = "b758bf8d-183c-4dea-bb75-e0a7d021c643"
}





# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "healthcare-rg"
  location = "eastus"
}

# Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                          = "hhealthcareacr2025arun123"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  sku                           = "Basic"
  admin_enabled                 = true
  public_network_access_enabled = true
}

# Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "healthcare-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "healthcare"

  default_node_pool {
    name         = "default"
    node_count   = 1
    vm_size      = "Standard_D2s_v3"
    os_disk_type = "Managed"
  }




  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true
  sku_tier                          = "Free"
}

# Give AKS permission to pull from ACR
# resource "azurerm_role_assignment" "aks_to_acr" {
#   principal_id                     = azurerm_kubernetes_cluster.aks.identity[0].principal_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.acr.id
#   skip_service_principal_aad_check = true
# }


# Output kubeconfig and ACR login info
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
