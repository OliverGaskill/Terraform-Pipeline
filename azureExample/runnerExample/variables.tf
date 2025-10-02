variable "company" {
  description = "Company or organization prefix"
  type        = string
  default = "RealCompany"
}

variable "project" {
  description = "Project or application name"
  type        = string
  default = "runner"
}

variable "environment" {
  description = "Environment (dev/test/prod)"
  type        = string
  default = "prod"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}

