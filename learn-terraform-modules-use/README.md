# Learn Terraform Modules Create

Learn what Terraform modules are and when to create them.

This repo is a companion repo to the [Use Modules from the Registry tutorial](https://developer.hashicorp.com/terraform/tutorials/modules/module-use), containing Terraform configuration files to provision infrastructure using the `vpc` and `ec2-instances` modules.
--------------------------------------------------------------------------
In this POC, used vnet module

For theory info regarding modules : https://developer.hashicorp.com/terraform/tutorials/certification-associate-tutorials-003/module

The example configuration sets two arguments: source and version.

The source argument is required when you use a Terraform module. In the example configuration, Terraform will search for a module in the Terraform Registry that matches the given string. You could also use a URL or local module. Refer to the Terraform documentation for a full list of possible module sources.

The version argument is not required, but we highly recommend you include it when using a Terraform module. For supported sources, this argument specifies the module version Terraform will load. Without the version argument, Terraform will load the latest version of the module. In this tutorial, you will specify an exact version number for the modules you use. Refer to the module documentation for more methods to specify module versions.

Modules can contain both required and optional arguments. You must specify all required arguments to use the module. Most module arguments correspond to the module's input variables. Optional inputs will use the module's default values if not explicitly defined.

Understand how modules work
When using a new module for the first time, you must run either terraform init or terraform get to install the module. When you run these commands, Terraform will install any new modules in the .terraform/modules directory within your configuration's working directory. For local modules, Terraform will create a symlink to the module's directory. Because of this, any changes to local modules will be effective immediately, without having to reinitialize or re-run terraform get.

After following this tutorial, your .terraform/modules directory will look like the following.

.terraform/modules/
├── vnet