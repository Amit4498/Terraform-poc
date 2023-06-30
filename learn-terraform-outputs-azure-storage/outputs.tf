# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Output declarations

output "storage_ac_id" {
  description = "ID of storage ac"
  value       = azurerm_storage_account.storage_ac.id
  sensitive   = true
}

output "storage_ac_id_len" {
  description = "len function"
  value       = length(azurerm_storage_account.storage_ac.id)
  sensitive   = true
}
