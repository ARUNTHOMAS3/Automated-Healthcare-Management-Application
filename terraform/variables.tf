# Azure Authentication Variables
variable "arm_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "arm_client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "arm_client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "arm_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

# Resource Variables
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "acr_name" {
  description = "Azure Container Registry Name"
  type        = string
}

# AKS Variables
variable "aks_cluster_name" {
  description = "AKS Cluster Name"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in AKS cluster"
  type        = number
}

variable "node_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}
