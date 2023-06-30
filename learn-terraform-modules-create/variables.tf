# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Input variable definitions

variable "creds" {
  description = "creds for auth"
  type        = map(string)
}

variable "resource_group_name" {
  description = "details of rg"
  type        = string
  default     = "rgbyterraformlocalmodule"

}

variable "name" {
  description = "storage ac name"
  type        = string
  default     = "amitstbylocalmodule"
}