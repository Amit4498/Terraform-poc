# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  /* Uncomment this block to use Terraform Cloud for this tutorial
  cloud {
      organization = "organization-name"
      workspaces {
        name = "learn-terraform-expressions"
      }
  }
  */

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }
  required_version = "~> 1.4.6"
}

