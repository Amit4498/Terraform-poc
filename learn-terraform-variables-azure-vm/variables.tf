# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Variable declarations

variable "rg" {
  description = "provide the name of rg "
  type        = string
  default     = "rg_to_test_variables"
}

variable "creds" {
  description = "azure creds"
  type = map(string)
}

variable "vnet" {
  description = "provide the name of vent"
  type        = string
  default     = "vnet11"
}

variable "subnet" {
  description = "name of subnet"
  type        = string
  default     = "subnet11"
}

variable "location" {
  description = "specify the location"
  type        = string
  default     = "eastus"
}

variable "nic" {
  description = "specify the nic name"
  type        = string
  default     = "nic1"
}

variable "vm" {
  description = "specify the vm name"
  type        = string
  default     = "linux_vm_by_terraform"
}

variable "comp_name" {
  description = "specify the comp_name name"
  type        = string
}

#list() example
variable "address_ips" {
  description = "range if address ips"
  type        = list(string)
  default = [
    "10.0.2.0/24",
    "10.0.2.1/24",
    "10.0.2.2/24",
    "10.0.2.3/24",
    "10.0.2.4/24",
    "10.0.2.5/24",
    "10.0.2.6/24",
    "10.0.2.7/24",
    "10.0.2.8/24"
  ]
}

# map() example
variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "project-alpha",
    environment = "dev"
  }

  # Validatation of variables

  validation {
    condition     = length(var.resource_tags["project"]) <= 16 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["project"])) == 0
    error_message = "The project tag must be no more than 16 characters, and only contain letters, numbers, and hyphens."
  }

  validation {
    condition     = length(var.resource_tags["environment"]) <= 8 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["environment"])) == 0
    error_message = "The environment tag must be no more than 8 characters, and only contain letters, numbers, and hyphens."
  }

}
