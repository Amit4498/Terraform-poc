# Learn Terraform dependencies

Learn how Terraform manages dependencies between resources.

Follow along [with this Hashicorp tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/dependencies).

In this POC, created the storages acs, app ser-linux, app ser plan

In this POC, you will learn about dependencies between resources and modules. 
Most of the time, Terraform infers dependencies between resources based on the configuration given, so that resources are created and destroyed in the correct order.

Occasionally, however, Terraform cannot infer dependencies between different parts of your infrastructure, and you will need to create an explicit dependency with the depends_on argument.

Manage explicit dependencies
Implicit dependencies are the primary way that Terraform understands the relationships between your resources. 
Sometimes there are dependencies between resources that are not visible to Terraform, however. 
The depends_on argument ::
is accepted by any resource or module block and accepts a list of resources to create explicit dependencies for.