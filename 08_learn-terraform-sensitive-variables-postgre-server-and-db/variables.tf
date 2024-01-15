# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "creds" {
  description = "Creds used to login in azure"
  type        = map(string)
}

variable "rg" {
  description = "Creds used to login in azure"
  type        = map(string)
  default = {
    name     = "test_rg_sensitive_variable_poc"
    location = "eastus"
  }
}

variable "ps_server" {
  description = "postgresql creds"
  type        = map(string)
  sensitive   = true
}

variable "ps_server_name" {
  description = "postgresql-server-1"
  type        = string
  default     = "ps-server-1"
  sensitive   = true
}
