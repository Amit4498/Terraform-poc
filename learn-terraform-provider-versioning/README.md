# Learn Terraform Provider Versioning

This repo is a companion repo to the [Lock and Upgrade Provider Versions tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/provider-versioning), containing Terraform configuration files to provision a S3 bucket.


In this tutorial, you used the dependency lock file to manage provider versions, and upgraded the lock file.

Created the Azure App insight and understood the how versions is managed in terraform

.terraform.lock.hcl file :
When you initialize a Terraform configuration for the first time with Terraform 1.1 or later, Terraform will generate a new .terraform.lock.hcl file in the current working directory. You should include the lock file in your version control repository to ensure that Terraform uses the same provider versions across your team and in ephemeral remote execution environments.

terraform init -upgrade command :
The -upgrade flag will upgrade all providers to the latest version consistent within the version constraints specified in your configuration.