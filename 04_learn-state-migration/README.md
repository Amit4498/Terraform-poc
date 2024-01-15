# Migrate State to Terraform Cloud

This is a companion repository for the Hashicorp [Terraform Cloud workspace state migration](https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate) tutorial.

The repository contains configuration you can use to learn how to migrate your existing state file to a Terraform Cloud workspace.


In this POC, understood the terraform cloud and did the state migration form local to terraform cloud.

Ref for terraform cloud : https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-sign-up
Info : https://developer.hashicorp.com/terraform/tutorials/certification-associate-tutorials-003/cloud-sign-up 

Terraform Cloud :

Terraform Cloud builds on these features by managing Terraform runs in a consistent and reliable environment instead of on your local machine. It securely stores state and secret data, and can connect to version control systems so that you can develop your infrastructure using a workflow similar to application development. The Terraform Cloud UI provides a detailed view into the resources managed by a Terraform project and gives enhanced visibility into each Terraform operation.

Terraform Cloud also has a private registry for sharing your organization's Terraform modules and providers. Paid features include access controls for approving changes to infrastructure, detailed policy controls for governing the contents of Terraform configurations, cost estimates for runs, and more.

Terraform Cloud helps you collaborate on each step of your infrastructure development process. For example, each time you plan a new change, your team can review and approve the plan before you apply it. It also automatically locks state during operations to prevent concurrent modifications that may corrupt the state file.

Workflows :

In Terraform Cloud, your resources are organized by workspaces, which contain your resource definitions, environment and input variables, and state files. A Terraform operation occurs within a workspace, and Terraform uses the configuration and state for that workspace to modify your infrastructure.

Terraform Cloud supports three workflows for your Terraform runs:

The CLI-driven workflow, which uses Terraform's standard CLI tools to execute runs in Terraform Cloud.

The UI/Version Control System(VCS)-driven workflow, in which changes pushed to version control repositories trigger runs in the associated workspace.
The API-driven workflow, which allows you to create tooling to interact with the Terraform Cloud API programmatically.
These tutorials will introduce the CLI and VCS-driven workflows. To learn more about the API-driven workflow, refer to Terraform Cloud's API Documentation.

The CLI-driven workflow
In the CLI-driven workflow, you initiate Terraform operations in your Terminal, and use Terraform Cloud's ephemeral remote execution environments for your operations. Terraform Cloud securely stores any input and environment variables needed by your configuration, as well as your current and previous state files. The CLI-driven workflow enables collaboration and allows you to leverage the stability, security, and enhanced visiblity of Terraform Cloud while still using the same familiar Terraform workflow, with minimal additional configuration.

The VCS-driven workflow
For the VCS-driven workflow, you must configure VCS access and create your workspace, then associate it with a repository containing your Terraform configuration. You can then configure your workspace to create speculative plans for any Pull Requests, which allows your team to review how the changes would modify infrastructure. Any merges to your main branch then trigger Terraform runs to implement your changes.

Variable Set :

Terraform Cloud lets you define input and environment variables using either workspace-specific variables, or sets of variables that you can reuse in multiple workspaces. Variable sets allow you to avoid redefining the same variables across workspaces, so you can standardize common configurations throughout your organization.


