# Learn Terraform data sources - VPC

Learn how Terraform data sources help you import data into your Terraform configuration.

Follow along [with this Hashicorp
tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/data-sources).

In this POC, created NSG, VNET and subnet.

Terraform data sources
let you dynamically fetch data from APIs or other Terraform state backends. Examples of data sources include machine image IDs from a cloud provider or Terraform outputs from other configurations. Data sources make your configuration more flexible and dynamic and let you reference values from other configurations, helping you scope your configuration while still referencing any dependent resource attributes. In Terraform Cloud, workspaces let you share data between workspaces.

used existing NSG to use for newly created VENT from terraform.