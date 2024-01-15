# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Output declarations

output "app_svc_name" {
  description = "Randomly generated bucket name."
  value       = azurerm_linux_web_app.app_ser.name
}

output "app_service_plan_id" {
  value = data.azurerm_service_plan.plan.id
}

output "id" {
  value = data.azurerm_resource_group.rg.id
}

output "bucket_name" {
  description = "Randomly generated bucket name."
  value       = azurerm_linux_web_app.app_ser.name
}

