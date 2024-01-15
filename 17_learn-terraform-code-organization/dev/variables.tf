# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "creds" {
  description = "creds to used for az login"
  type        = map(string)
}

variable "dev_prefix" {
  description = "This is the environment where your webapp is deployed. qa, prod, or dev"
}

