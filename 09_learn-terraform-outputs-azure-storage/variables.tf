# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "creds" {
  description = "creds to used for az login"
  type        = map(string)
}

variable "rg_name" {
  description = "rg name"
  type        = string
  default     = "test-rg"
}

variable "rg_loc" {
  description = "rg location"
  type        = string
  default     = "westus"
}

variable "storage_ac_name" {
  description = "storage ac name"
  type        = string
}