# Apply Terraform Configuration

This repo is a companion repo to the [Apply Terraform Configuration tutorial](https://developer.hashicorp.com/terraform/tutorials/cli/apply).

The core Terraform workflow consists of three main steps once you have written your Terraform configuration:

Initialize :
prepares the working directory so Terraform can run the configuration.
Plan :
lets you preview any changes before you apply them.
Apply :
executes the changes defined by your Terraform configuration to create, update, or destroy resources.

When you approve the plan and apply this configuration, Terraform will:

1. Lock your workspace's state, so that no other instances of Terraform will attempt to modify your state or apply changes to your resources. If Terraform detects an existing lock file (.terraform.tfstate.lock.info), it will report an error and exit.
2. Create a plan, and wait for you to approve it. Alternatively, you can provide a saved plan created with the terraform plan command, in which case Terraform will not prompt for approval.
3. Execute the steps defined in the plan using the providers you installed when you initialized your configuration. Terraform executes steps in parallel when possible, and sequentially when one resource depends on another.
4. Update your workspace's state with a snapshot of the new state of your resources.
5. Unlock your workspace's state.
6. Report the changes it made, as well as any output values defined in your configuration.

Common reasons for apply errors include:

1. A change to a resource outside of Terraform's control.
2. Networking or other transient errors.
3. An expected error from the upstream API, such as a duplicate resource name or reaching a resource limit.
4. An unexpected error from the upstream API, such as an internal server error.
5. A bug in the Terraform provider code, or Terraform itself.


Replace Resources
When using Terraform, you will usually apply an entire configuration change at once. Terraform and its providers will determine the changes to make and the order to make them in. However, there are some cases where you may need to replace or modify individual resources. Terraform provides two arguments to the apply command that allow you to interact with specific resources:

A) -replace
B) -target

A) -replace :
Use the -replace argument when a resource has become unhealthy or stops working in ways that are outside of Terraform's control. For instance, a misconfiguration in your Docker container's OS configuration could require that the container be replaced. There is no corresponding change to your Terraform configuration, so you want to instruct Terraform to reprovision the resource using the same configuration.
The -replace argument requires a resource address. List the resources in your configuration with terraform state list.

B) -target :
Use the -target command line argument when you apply to target individual resources rather than apply the entire configuration. Refer

Terraform version constraints
The following table summarizes some of the ways you can pin the Terraform version in the required_version setting, assuming Terraform v0.15.0 as your current target version. Refer to the Terraform documentation for a detailed explanation of version constraints.

link : https://developer.hashicorp.com/terraform/tutorials/certification-associate-tutorials-003/versions#terraform-version-constraints