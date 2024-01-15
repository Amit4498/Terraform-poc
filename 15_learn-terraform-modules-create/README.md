In this POC, developed local module stoarge ac

got issue that unsupported argument in main.tf from root folder.
So in this case we need to check the variable.tf files of both root and module.
all variale names hsould match in both then only it will work.

Article link: https://discuss.hashicorp.com/t/terraform-keep-saying-variable-not-defined-though-its-defined-please-help/41555

Module structure
Terraform treats any local directory referenced in the source argument of a module block as a module. A typical file structure for a new module is:

.
├── LICENSE
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf

None of these files are required, or have any special meaning to Terraform when it uses your module. You can create a module with a single .tf file, or use any other file structure you like.

Each of these files serves a purpose:

LICENSE
will contain the license under which your module will be distributed. When you share your module, the LICENSE file will let people using it know the terms under which it has been made available. Terraform itself does not use this file.

README.md
will contain documentation describing how to use your module, in markdown format. Terraform does not use this file, but services like the Terraform Registry and GitHub will display the contents of this file to people who visit your module's Terraform Registry or GitHub page.

main.tf
will contain the main set of configuration for your module. You can also create other configuration files and organize them however makes sense for your project.
variables.tf will contain the variable definitions for your module. When your module is used by others, the variables will be configured as arguments in the module block. Since all Terraform values must be defined, any variables that are not given a default value will become required arguments. Variables with default values can also be provided as module arguments, overriding the default value.

outputs.tf
will contain the output definitions for your module. Module outputs are made available to the configuration using the module, so they are often used to pass information about the parts of your infrastructure defined by the module to other parts of your configuration.
There are also some other files to be aware of, and ensure that you don't distribute them as part of your module:

terraform.tfstate and terraform.tfstate.backup:
These files contain your Terraform state, and are how Terraform keeps track of the relationship between your configuration and the infrastructure provisioned by it.

.terraform:
This directory contains the modules and plugins used to provision your infrastructure. These files are specific to a specific instance of Terraform when provisioning infrastructure, not the configuration of the infrastructure defined in .tf files.

*.tfvars:
Since module input variables are set via arguments to the module block in your configuration, you don't need to distribute any *.tfvars files with your module, unless you are also using it as a standalone Terraform configuration.

If you are tracking changes to your module in a version control system, such as git, you will want to configure your version control system to ignore these files. For an example, see this .gitignore file from GitHub.

