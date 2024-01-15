# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Output declarations




output "db_connect_string" {
  description = "postgresql database connection string"
  value       = "Server=${azurerm_postgresql_database.example.name}; Database=ExampleDB; Uid=${var.ps_server.username}; Pwd=${var.ps_server.pass}"


  #If you do intend to export this data, annotate the output value as sensitive by adding the following argument:
  #sensitive = true
  sensitive = true
}

