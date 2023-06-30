# Apply Terraform Configuration

This repo is a companion repo to the [Apply Terraform Configuration tutorial](https://developer.hashicorp.com/terraform/tutorials/cli/apply).

The core Terraform workflow consists of three main steps once you have written your Terraform configuration:

Initialize :
prepares the working directory so Terraform can run the configuration.
Plan :
lets you preview any changes before you apply them.
Apply :
executes the changes defined by your Terraform configuration to create, update, or destroy resources.

Replace Resources
When using Terraform, you will usually apply an entire configuration change at once. Terraform and its providers will determine the changes to make and the order to make them in. However, there are some cases where you may need to replace or modify individual resources. Terraform provides two arguments to the apply command that allow you to interact with specific resources:
-replace and -target

-replace
Use the -replace argument when a resource has become unhealthy or stops working in ways that are outside of Terraform's control. For instance, a misconfiguration in your Docker container's OS configuration could require that the container be replaced. There is no corresponding change to your Terraform configuration, so you want to instruct Terraform to reprovision the resource using the same configuration.
The -replace argument requires a resource address. List the resources in your configuration with terraform state list.

Terraform version constraints
The following table summarizes some of the ways you can pin the Terraform version in the required_version setting, assuming Terraform v0.15.0 as your current target version. Refer to the Terraform documentation for a detailed explanation of version constraints.

link : https://developer.hashicorp.com/terraform/tutorials/certification-associate-tutorials-003/versions#terraform-version-constraints