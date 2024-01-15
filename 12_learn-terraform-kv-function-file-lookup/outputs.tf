# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


output "tags_value" {
  value = lookup(var.tags, "prd")
}

output "current_config_value" {
  value = data.azurerm_client_config.current
}
