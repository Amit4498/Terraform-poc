# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "creds" {
  description = "creds to used for az login"
  type        = map(string)
}

variable "rg" {
  description = "rg details"
  type        = map(string)
  default = {
    name = "test_rg"
    loc  = "eastus2"
  }
}

variable "name" {
  description = "for condition name"
  type        = string
  #  default     = "amit"
}

variable "name_condition" {
  type        = bool
  description = "If this true choose then name will be truename else falsename"
  default     = true
}
