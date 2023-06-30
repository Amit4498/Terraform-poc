# Create a Terraform Plan

This repo is a companion repo to the [Create a Terraform Plan](https://developer.hashicorp.com/terraform/tutorials/cli/plan) tutorial.
It contains Terraform configuration you can use to learn how Terraform generates an execution plan.

The core Terraform workflow consists of three main steps once you have written your Terraform configuration:

Initialize :
prepares the working directory so Terraform can run the configuration.
Plan :
lets you preview any changes before you apply them.
Apply :
executes the changes defined by your Terraform configuration to create, update, or destroy resources.

There are three commands that tell Terraform to generate an execution plan:

The terraform plan command :
lets you to preview the actions Terraform would take to modify your infrastructure, or save a speculative plan which you can apply later. The function of terraform plan is speculative: you cannot apply it unless you save its contents and pass them to a terraform apply command. In an automated Terraform pipeline, applying a saved plan file ensures the changes are the ones expected and scoped by the execution plan, even if your pipeline runs across multiple machines.

The terraform apply command :
is the more common workflow outside of automation. If you do not pass a saved plan to the apply command, then it will perform all of the functions of plan and prompt you for approval before making the changes.

The terraform destroy command :
creates an execution plan to delete all of the resources managed in that project.

terraform plan -out filename
Generate a saved plan with the -out flag. You will review and apply this plan later in this tutorial.
You can apply the saved plan file to execute these changes, but the contents are not in a human-readable format. Use the terraform show -json command to convert the plan contents into JSON

Review resource drift
Terraform also accounts for the possibility that resources have changed outside of the Terraform workflow. As a result, the prior state may not reflect the actual attributes and settings of the resource at the time of the plan operation, which is known as state "drift". Terraform must reconcile these differences to understand which actions it must actually take to make your resources match the written configuration.
To determine whether state drift occurred, Terraform performs a :refresh" operation before it begins to build an execution plan. This refresh step pulls the actual state of all of the resources currently tracked in your state file.
Terraform does not update your actual state file, but captures the refreshed state in the plan file.