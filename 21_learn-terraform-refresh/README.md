# Learn Terraform - Use Refresh-Only Plans and Applies

This is a companion repository for the [Use Refresh-Only Mode to Sync Terraform
State](https://developer.hashicorp.com/terraform/tutorials/state/refresh) tutorial. It contains Terraform
configuration files for you to use to learn how to safely refresh your Terraform state file.

In this POC, created App service plan, storage ac and function app

Review Terraform's refresh functionality
In previous versions of Terraform, the only way to refresh your state file was by using the terraform refresh subcommand. However, this was less safe than the -refresh-only plan and apply mode since it would automatically overwrite your state file without giving you the option to review the modifications first. In this case, that would mean automatically dropping all of your resources from your state file.

The -refresh-only mode for terraform plan and terraform apply operations makes it safer to check Terraform state against real infrastructure by letting you review proposed changes to the state file. It lets you avoid mistakenly removing an existing resource from state and gives you a chance to correct your configuration.

A refresh-only apply operation also updates outputs, if necessary. If you have any other workspaces that use the terraform_remote_state data source to access the outputs of the current workspace, the -refresh-only mode allows you to anticipate the downstream effects.

In order to propose accurate changes to your infrastructure, Terraform first attempts to reconcile the resources tracked in your state file with your actual infrastructure. Terraform plan and apply operations first run an in-memory refresh to determine which changes to propose to your infrastructure. Once you confirm a terraform apply, Terraform will update your infrastructure and state file.

Though Terraform will continue to support the refresh subcommand in future versions, it is deprecated, and we encourage you to use the -refresh-only flag instead. This allows you to review any updates to your state file. Unlike the refresh subcommand, -refresh-only mode is supported in workspaces using Terraform Cloud as a remote backend, allowing your team to collaboratively review any modifications.

Review the Terraform troubleshooting model
The Terraform application layers

There are four potential types of issues that you could experience with Terraform: language, state, core, and provider errors. Starting from the type of error closest to the user:

Language errors:
The primary interface for Terraform is the HashiCorp Configuration Language (HCL), a declarative configuration language. The Terraform core application interprets the configuration language. When Terraform encounters a syntax error in your configuration, it prints out the line numbers and an explanation of the error.

State errors:
The Terraform state file stores information on provisioned resources. It maps resources to your configuration and tracks all associated metadata. If state is out of sync, Terraform may destroy or change your existing resources. After you rule out configuration errors, review your state. Ensure your configuration is in sync by refreshing, importing, or replacing resources.

Core errors:
The Terraform core application contains all the logic for operations. It interprets your configuration, manages your state file, constructs the resource dependency graph, and communicates with provider plugins. Errors produced at this level may be a bug. Later in this tutorial, you will learn best practices for opening a GitHub issue for the core development team.

Provider errors:
The provider plugins handle authentication, API calls, and mapping resources to services. Later in this tutorial, you will learn best practices for opening a GitHub issue for the provider development team.