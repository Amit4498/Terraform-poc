Install terraform into windows : https://developer.hashicorp.com/terraform/downloads

	1. Extract that file in c/program file/terraform
	2. Setup above path in user env variable
	3. Run the command in cmd to check terraform installation : terraform version
	4. Download Git bash : https://git-scm.com/download/win  : Standalone installer  => 64-bit Git for Windows Setup


Basic info : https://developer.hashicorp.com/terraform/tutorials/certification-associate-tutorials-003/init


Customize Terraform Configuration with Variables
:: https://developer.hashicorp.com/terraform/tutorials/certification-associate-tutorials-003/variables#assign-values-to-variables


1. Terraform Locals: What Are They, How to Use Them :: https://spacelift.io/blog/terraform-locals
2. lookup Function :: https://developer.hashicorp.com/terraform/language/functions/lookup
3. file Function :: https://developer.hashicorp.com/terraform/language/functions/file
4. Local Values :: https://developer.hashicorp.com/terraform/language/values/locals
5. Modules Overview :: https://developer.hashicorp.com/terraform/tutorials/certification-associate-tutorials-003/module
6. Destroy particular Resources from Terraform :: https://spacelift.io/blog/how-to-destroy-terraform-resources


Issues faced while doing terraform POC's

1. While creating VM : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

2. admin_ssh_key block have public key that needs to be created for creating vm
sol : https://stackoverflow.com/questions/63413564/terraform-azure-vm-ssh-key#:~:text=For%20the%20public%20key%2C%20you,should%20be%20different%20from%20yours

a. Add provider then add tls resource block in main.tf

3. Storages are not having any free tier so need to mention standard_lrs in accoun_type

4. Got issue in source_image_reference : wrong name has been put in offer & Also in version need to put in correct format
sol : https://stackoverflow.com/questions/71253468/creating-an-azure-linux-vm-with-ubuntu-20-04-with-terraform

5. terraform plan returns the Error: Unsupported argument
:: https://stackoverflow.com/questions/62361263/terraform-plan-returns-the-error-unsupported-argument

6. Terraform error argument named is not expected here for azurerm_lb
:: https://stackoverflow.com/questions/72174302/terraform-error-argument-named-is-not-expected-here-for-azurerm-lb

7. Terraform keep saying variable not defined though its defined. Please help
:: https://discuss.hashicorp.com/t/terraform-keep-saying-variable-not-defined-though-its-defined-please-help/41555

8. Creating Windows/Linux Web App terraform: (Site Name “” / Resource Group “”): web.AppsClient#CreateOrUpdate:
Failure sending request: StatusCode=0 — Original Error: autorest/azure: Service returned an error. Status=
:: https://blog.geralexgr.com/terraform/creating-windows-linux-web-app-terraform-site-name-resource-group-web-appsclientcreateorupdate-failure-sending-request-statuscode0-original-error-autorest-azure-service-return

9. How to Import an Existing Azure Resource in Terraform
https://gmusumeci.medium.com/how-to-import-an-existing-azure-resource-in-terraform-6d585f93ea02

10. azure cli $Path error running in terraform cloud :
https://stackoverflow.com/questions/72681536/azure-cli-path-error-running-in-terraform-cloud