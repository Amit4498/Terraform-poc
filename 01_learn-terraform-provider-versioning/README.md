# Learn Terraform Provider Versioning

This repo is a companion repo to the [Lock and Upgrade Provider Versions tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/provider-versioning), containing Terraform configuration files to provision a S3 bucket.


In this tutorial, you used the dependency lock file to manage provider versions, and upgraded the lock file.

Created the Azure App insight and understood the how versions is managed in terraform

.terraform.lock.hcl file :

When multiple users or automation tools run the same Terraform configuration, they should all use the same versions of their required providers. There are two ways for you to manage provider versions in your configuration.

Specify provider version constraints in your configuration's terraform block.
Use the dependency lock file

When you initialize a Terraform configuration for the first time with Terraform 1.1 or later, Terraform will generate a new .terraform.lock.hcl file in the current working directory. You should include the lock file in your version control repository to ensure that Terraform uses the same provider versions across your team and in ephemeral remote execution environments.

The lock file instructs Terraform to always install the same provider version, ensuring that consistent runs across your team or remote sessions.

terraform init -upgrade command :
The -upgrade flag will upgrade all providers to the latest version consistent within the version constraints specified in your configuration.