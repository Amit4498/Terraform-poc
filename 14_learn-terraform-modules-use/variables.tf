# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "creds" {
  description = "creds to used for az login"
  type        = map(string)
}