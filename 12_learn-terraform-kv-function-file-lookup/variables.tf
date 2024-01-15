# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "creds" {
  description = "creds to used for az login"
  type        = map(string)
}


variable "tags" {
  type = map(any)
  default = {
    "ite" = "development env"
    "ute" = "business test env"
    "prd" = "live env"
  }
}


