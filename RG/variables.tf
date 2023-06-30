# variables defined here to provide ref in main.tf file
variable "resource_group_name" {
  default = "first_rg_by_terraform_test"
}

variable "creds" {
  description = "azure creds"
  type = map(string)
}
