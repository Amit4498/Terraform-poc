# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

#output "vpc_public_subnets" {
#  description = "IDs of the VPC's public subnets"
#  value       = module.vpc.public_subnets
#}

output "vnet_name" {
  description = "name of vnet"
  value       = module.vnet.vnet_name
}



