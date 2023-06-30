# Learn Terraform outputs

This repo is a companion repo to the [Learn Terraform outputs](https://developer.hashicorp.com/terraform/tutorials/configuration-language/outputs) tutorial.
It contains Terraform configuration you can use to learn how Terraform output values allow you to export structured data about your resources.

In this POC, created the azure storage ac

Terraform output values
let you export structured data about your resources. You can use this data to configure other parts of your infrastructure with automation tools, or as a data source for another Terraform workspace. Outputs are also how you expose data from a child module to a root module.

output {} block :
While the description argument is optional, you should include it in all output declarations to document the intent and content of the output.
You can use the result of any Terraform expression as the value of an output.

Redact sensitive outputs
You can designate Terraform outputs as sensitive. Terraform will redact the values of sensitive outputs to avoid accidentally printing them out to the console. Use sensitive outputs to share sensitive data from your configuration with other Terraform modules, automation tools, or Terraform Cloud workspaces.
Terraform will redact sensitive outputs when planning, applying, or destroying your configuration, or when you query all of your outputs. Terraform will not redact sensitive outputs in other cases, such as when you query a specific output by name, query all of your outputs in JSON format, or when you use outputs from a child module in your root module.

terraform output -json command :
The Terraform CLI output is designed to be parsed by humans. To get machine-readable format for automation, use the -json flag for JSON-formatted output.