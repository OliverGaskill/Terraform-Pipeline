variable "company" {
  description = "Company or organization prefix"
  type        = string
  default = "testcompany"
}

variable "project" {
  description = "Project or application name"
  type        = string
  default = "runner"
}

variable "environment" {
  description = "Environment (dev/test/prod)"
  type        = string
  default = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

