# Learn Terraform Drift Management

This is a companion repository for the [Learn Terraform Drift Management tutorial](https://developer.hashicorp.com/terraform/tutorials/state/resource-drift). Follow along to learn more about state management.

In this POC, created linux vm, NIC, VNET, NSG, subnet

The Terraform state file is a record of all resources Terraform manages. You should not make manual changes to resources controlled by Terraform, because the state file will be out of sync, or "drift," from the real infrastructure. If your state and configuration do not match your infrastructure, Terraform will attempt to reconcile your infrastructure, which may unintentionally destroy or recreate resources.

Run a refresh-only plan :

By default, Terraform compares your state file to real infrastructure whenever you invoke terraform plan or terraform apply. The refresh updates your state file in-memory to reflect the actual configuration of your infrastructure. This ensures that Terraform determines the correct changes to make to your resources.

If you suspect that your infrastructure configuration changed outside of the Terraform workflow, you can use a -refresh-only flag to inspect what the changes to your state file would be. This is safer than the refresh subcommand, which automatically overwrites your state file without displaying the updates.

Tip
The -refresh-only flag was introduced in Terraform 0.15.4, and is preferred over the terraform refresh subcommand.

A refresh-only operation does not attempt to modify your infrastructure to match your Terraform configuration -- it only gives you the option to review and track the drift in your state file.
If you ran terraform plan or terraform apply without the -refresh-only flag now, Terraform would attempt to revert your manual changes.
