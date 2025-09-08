variable "company" {
  description = "Company or organization prefix"
  type        = string
}

variable "project" {
  description = "Project or application name"
  type        = string
}

variable "environment" {
  description = "Environment (dev/test/prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}
