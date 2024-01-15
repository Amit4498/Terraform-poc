# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Variable declarations

variable "creds" {
  description = "Creds used to login in azure"
  type        = map(string)
}

variable "rg" {
  description = "rg dtails"
  type        = map(string)
  default = {
    name     = "test_rg_for_appser"
    location = "east us"
  }
}
