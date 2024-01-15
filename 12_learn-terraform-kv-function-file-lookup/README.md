# Learn Terraform Functions

Learn what Terraform functions are and how to use them.

Follow along with the [Hashicorp tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/functions).

In this POC, created KV.

The Terraform configuration language allows you to write declarative expressions to create infrastructure. While the configuration language is not a programming language, you can use several built-in functions to perform operations dynamically.

In this tutorial, you will:

use the templatefile function to dynamically create an EC2 instance user data script.
use the lookup function to reference values from a map.
use the file function to read the contents of a file.

The lookup function
IT retrieves the value of a single element from a map, given its key.
The lookup function arguments are a map, the key to access in the map, and an optional default value in case the key does not exist.*

The file function
It does not interpolate values into file contents; you should only use it with files that do not need modification.