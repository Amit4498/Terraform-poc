# Learn Terraform Expressions

Learn what Terraform expressions are and when to use them.

Follow along with the [Hashicorp tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/expressions).


1. creation of azure static app and acr
2. Make sure to take into account the fact that the declare block for local is “locals”, and the reference usage is “local”. I have seen this mistake happen many times, so this is something to be careful of.
3. understaning of conditional expression using locals variable creation, conditional boolean criteria

In this POC, created ACR, static app.

Conditional expressions select a value based on whether the expression evaluates to true or false.
In this configuration, you will use the locals block to create a resource name based on a conditional value and capture that name in a map of resource tags.

(var.name != "" ? var.name : random_id.id.hex) :

The syntax of a conditional expression first defines the condition, then the outcomes for true and false evaluations. In this example, if var.name is not empty (!= ""), var.name is set to the var.name value; otherwise, the name is the random_id.

Use a splat expression

The aws_instance resource could now have a count value of 3. 
To return the private IP addresses of all of the instances, you will use a splat * expression to create an output value.
The splat expression captures all objects in a list that share an attribute. The special * symbol iterates over all of the elements of a given list and returns information based on the shared attribute you define.
Without the splat expression, Terraform would not be able to output the entire array of your instances and would only return the first item in the array.
