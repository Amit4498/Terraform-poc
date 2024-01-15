# Learn Terraform sensitive input variables

This repo is a companion repo to the [Learn Terraform sensitive input variables](https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables) tutorial.
It contains Terraform configuration you can use to learn how Terraform sensitive input variables help you manage sensitive information.

In this POC, created the postres-server for sample DB

Set values with a .tfvars file
Terraform supports setting variable values with variable definition (.tfvars) files. You can use multiple variable definition files, and many practitioners use a separate file to set sensitive or secret values.

Setting values with a .tfvars file allows you to separate sensitive values from the rest of your variable values, and makes it clear to people working with your configuration which values are sensitive. However, it requires that you maintain and share the secret.tfvars file with only the appropriate people. You must also be careful not to check .tfvars files with sensitive values into version control. For this reason, GitHub's recommended .gitignore file for Terraform configuration is configured to ignore files matching the pattern *.tfvars.

Sensitive values in state
When you run Terraform commands with a local state file, Terraform stores the state as plain text, including variable values, even if you have flagged them as sensitive. Terraform needs to store these values in your state so that it can tell if you have changed them since the last time you applied your configuration.

terraform apply -var-file="filename.tfvars"
