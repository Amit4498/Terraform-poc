# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "rg" {
  description = "rg details"
  type        = map(string)
  default = {
    name = "testrgbyterra"
    loc  = "eastus"
  }
}

variable "creds" {
  description = "creds"
  type        = map(string)
}