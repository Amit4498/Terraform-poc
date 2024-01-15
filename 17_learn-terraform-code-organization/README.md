# Learn Terraform Code Organization

This repo is a companion repo to the [Learn Terraform Code Organization](https://developer.hashicorp.com/terraform/tutorials/modules/organize-configuration) tutorial.
It contains Terraform configuration you can use to learn best practices for Terraform as your organization grows.

In this POC, 2 storage ac for dev and prd, with static site hosting

Some Terraform projects start as a monolith, a Terraform project managed by a single main configuration file in a single directory, with a single state file. Small projects may be convenient to maintain this way. However, as your infrastructure grows, restructuring your monolith into logical units will make your Terraform configurations less confusing and safer to manage.

Your root directory contains four files and an "assets" folder. The root directory files compose the configuration as well as the inputs and outputs of your deployment.

main.tf - configures the resources that make up your infrastructure.
variables.tf- declares input variables for your dev and prod environment prefixes, and the AWS region to deploy to.
terraform.tfvars.example- defines your region and environment prefixes.
outputs.tf- specifies the website endpoints for your dev and prod buckets.
assets- houses your webapp HTML file.
