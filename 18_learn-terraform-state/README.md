# Learn Terraform State Management

This repo is a companion repo to the [Learn Terraform State Management](https://developer.hashicorp.com/terraform/tutorials/state/state-cli) tutorial.
It contains Terraform configuration you can use to learn how to create an AWS instance and security group, examine a state file, and then manipulate resources to observe how vital state is to your Terraform operations.

Terraform stores information about your infrastructure in a state file. This state file keeps track of resources created by your configuration and maps them to real-world resources.

Run terraform show command :
to get a human-friendly output of the resources contained in your state.

Run terraform state list command :
 to get the list of resource names and local identifiers in your state file. This command is useful for more complex configurations where you need to find a specific resource without parsing state with terraform show.

Replace a resource with CLI

Terraform usually only updates your infrastructure if it does not match your configuration. You can use the "-replace" flag for terraform plan and terraform apply operations to safely recreate resources in your environment even if you have not edited the configuration, which can be useful in cases of system malfunction.
Replacing a resource is also useful in cases where a user manually changes a setting on a resource or when you need to update a provisioning script.
This allows you to rebuild specific resources and avoid a full terraform destroy operation on your configuration.
The -replace flag allows you to target specific resources and avoid destroying all the resources in your workspace just to fix one of them.

In older versions of Terraform, you may have used the terraform taint command to achieve a similar outcome. That command has now been deprecated in favor of the -replace flag, which allows for a simpler, less error-prone workflow.
If you are using an older version of Terraform, consider upgrading or review the taint documentation for more information.

Tip
The -replace flag was introduced in Terraform 0.15.2. Ensure you are using the correct version of Terraform for this next step.

Run terraform apply with the -replace flag to force Terraform to destroy and recreate the resource.
Using the terraform apply command with the -replace flag is the HashiCorp-recommended process for managing resources without manually editing your state file.

Move a resource to a different state file

Some of the Terraform state subcommands are useful in very specific situations. HashiCorp recommends only performing these advanced operations as the last resort.

The terraform state mv command moves resources from one state file to another. You can also rename resources with mv. The move command will update the resource in state, but not in your configuration file.
Moving resources is useful when you want to combine modules or resources from other states, but do not want to destroy and recreate the infrastructure.

Remove a resource from state
The terraform state rm subcommand removes specific resources from your state file. This does not remove the resource from your configuration or destroy the infrastructure itself.

Refresh modified infrastructure
The terraform refresh command updates the state file when physical resources change outside of the Terraform workflow.
Run the terraform refresh command to update your state file.

