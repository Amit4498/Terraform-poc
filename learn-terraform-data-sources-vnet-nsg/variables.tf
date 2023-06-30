# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "creds" {
  description = "creds to used for az login"
  type        = map(string)
}

variable "test_rg" {
  description = "name of rg"
  type =string
  default = "test_rg"
}

variable "test_rg_loc" {
  description = "loc of rg"
  type = string
  default = "westus"
}