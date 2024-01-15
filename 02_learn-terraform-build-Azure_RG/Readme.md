Basic terraform poc to connect with azure, auth with azure and creating 1st RG using terraform.

To deploy infrastructure with Terraform:

Scope - Identify the infrastructure for your project.
Author - Write the configuration for your infrastructure.
Initialize - Install the plugins Terraform needs to manage the infrastructure.
Plan - Preview the changes Terraform will make to match your configuration.
Apply - Make the planned changes.

The terraform{} block
This block contains Terraform settings, including the required providers Terraform will use to provision your infrastructure. For each provider, the source attribute defines an optional hostname, a namespace, and the provider type.
Terraform installs providers from the Terraform Registry by default. 
In this example configuration, the Azure provider's source is defined as hashicorp/azurerm, which is shorthand for registry.terraform.io/hashicorp/azurerm.
You can also set a version constraint for each provider defined in the required_providers block. The version attribute is optional, but we recommend using it to constrain the provider version so that Terraform does not install a version of the provider that does not work with your configuration. If you do not specify a provider version, Terraform will automatically download the most recent version during initialization.

The provider{} block

This block configures the specified provider, in this case Azure. A provider is a plugin that Terraform uses to create and manage your resources.
You can use multiple provider blocks in your Terraform configuration to manage resources from different providers. 
You can even use different providers together

Resource{} block
Use resource blocks to define components of your infrastructure
Resource blocks have two strings before the block: the resource type and the resource name.
Resource blocks contain arguments which you use to configure the resource. Arguments can include things like machine sizes, disk image names, or VPC IDs.

terraform init command :
When you create a new configuration — or check out an existing configuration from version control — you need to initialize the directory with terraform init.

terraform fmt command :
We recommend using consistent formatting in all of your configuration files. The terraform fmt command automatically updates configurations in the current directory for readability and consistency.
Format your configuration. Terraform will print out the names of the files it modified, if any. In this case, your configuration file was already formatted correctly, so Terraform won't return any file names.

terraform validate command :
You can also make sure your configuration is syntactically valid and internally consistent by using the terraform validate command.
Validate your configuration. The example configuration provided above is valid, so Terraform will return a success message.

Diff betn fmt & validate :

fmt command shows there is some error in the main.tf file. However, it is not providing much information about where the error coming. 
validate command provided exactly what is the error and what terraform are looking for. All information provided in the error logs.

Terraform fmt — to format the code correctly. 
Terraform validate — to verify the syntax

terraform apply command :
Apply the configuration now with the terraform apply command. .

terraform show command :
Inspect the current state using terraform show

terraform state list command :
Terraform has a built-in command called terraform state for advanced state management. Use the list subcommand to list of the resources in your project's state.

terraform destroy command :
The terraform destroy command terminates resources managed by your Terraform project. This command is the inverse of terraform apply in that it terminates all the resources specified in your Terraform state. It does not destroy resources running elsewhere that are not managed by the current Terraform project.
Just like with apply, Terraform determines the order to destroy your resources. In this case, Terraform identified a single instance with no other dependencies, so it destroyed the instance. In more complicated cases with multiple resources, Terraform will destroy them in a suitable order to respect dependencies.

terraform.tfstate file :
When you applied your configuration, Terraform wrote data into a file called terraform.tfstate. Terraform stores the IDs and properties of the resources it manages in this file, so that it can update or destroy those resources going forward.
The Terraform state file is the only way Terraform can track which resources it manages, and often contains sensitive information, so you must store your state file securely and restrict access to only trusted team members who need to manage your infrastructure. In production, we recommend storing your state remotely with Terraform Cloud or Terraform Enterprise. Terraform also supports several other remote backends you can use to store and manage your state.

.terraform directory :
Terraform uses the .terraform directory to store the project's providers and modules. Terraform will refer to these components when you run validate, plan, and apply,

