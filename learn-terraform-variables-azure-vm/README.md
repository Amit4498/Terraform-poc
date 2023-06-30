# Learn Terraform variables

You can use input variables to customize your Terraform configuration with
values that can be assigned by end users of your configuration. Input variables
allow users to re-use and customize configuration by providing a consistent
interface to change how a given configuration behaves.

Follow along with this [Learn Terraform variables](https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables) tutorial.


-----
1. Creation of azure vm
2. understanding of variables, variables type like map, list
3. understaning of Validatation of variables ; appling the condition to variables
4. Interpolate variables in strings in main.tf file
5. creation of tls_private_key for vm creation


Parameterize your configuration
Variable declarations can appear anywhere in your configuration files. However, we recommend putting them into a separate file called variables.tf to make it easier for users to understand how they can customize the configuration.
To parameterize an argument with an input variable, you must first define the variable, then replace the hardcoded value with a reference to that variable in your configuration.

Variable blocks have three optional arguments.

Description: A short description to document the purpose of the variable.
Type: The type of data contained in the variable.
Default: The default value.

We recommend setting a description and type for all variables, and setting a default value when practical.
If you do not set a default value for a variable, you must assign a value before Terraform can apply the configuration. Terraform does not support unassigned variables. You will review some of the ways to assign values to variables later in this tutorial.
Variable values must be literal values, and cannot use computed values like resource attributes, expressions, or other variables. You can refer to variables in your configuration with var.<variable_name>

List public and private subnets:
The variables you have used so far have all been single values. Terraform calls these types of variables simple. Terraform also supports collection variable types that contain more than one value. Terraform supports several collection variable types.
List: A sequence of values of the same type.
Map: A lookup table, matching keys to values, all of the same type.
Set: An unordered collection of unique values, all of the same type.

map() variable type :
Setting the type to map(string) tells Terraform to expect strings for the values in the map. Map keys are always strings. Like dictionaries or maps from programming languages, you can retrieve values from a map with the corresponding key

tuple and object type :
The lists and maps you used are collection types. Terraform also supports two structural types. Structural types have a fixed number of values that can be of different types.
Tuple: A fixed-length sequence of values of specified types.
Object: A lookup table, matching a fixed set of keys to values of specified types.

slice() function :
Use the slice() function to get a subset of these lists.

Interpolate variables in strings : 
Terraform configuration supports string interpolation — inserting the output of an expression into a string. This allows you to use variables, local values, and the output of functions to create strings in your configuration.

terraform console command :
Open a console with the terraform console command.

terraform apply -var vaiable_name_and_value command :
Apply this configuration now, using the -var command line flag to set the variable value
