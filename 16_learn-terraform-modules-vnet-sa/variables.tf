# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "creds" {
  description = "creds to used for az login"
  type        = map(string)
}

variable "resource_group_name" {
  description = "rg name"
  type        = string
  default     = "testrgbyterraform"
}