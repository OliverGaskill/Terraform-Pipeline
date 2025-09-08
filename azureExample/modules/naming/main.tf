locals {
  rg_name   = "${var.company}-${var.project}-${var.environment}-rg"
  vnet_name = "${var.company}-${var.project}-${var.environment}-vnet"

  # Storage account must be lowercase, only alphanumeric, <= 24 chars
  sa_name   = substr(lower(replace("${var.company}${var.project}${var.environment}st", "/[^a-z0-9]/", "")), 0, 24)
}