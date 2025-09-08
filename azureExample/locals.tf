locals {
  rg_name   = "${var.company}-${var.project}-rg"
  sa_name   = lower(replace("${var.company}${var.project}st", "/[^a-z0-9]/", ""))
  vnet_name = "${var.company}-${var.project}-vnet"
}