# Example: Depends_on

Information depends_on Meta-Argument [See documentation](https://www.terraform.io/language/meta-arguments/depends_on) 

This repository shows en example on the effect of the depends_on meta-argument. With depends_on you can make sure a resource only starts after another resource is created. 

In this example you will create 2 resources with a depends_on meta-argument to see what happens.

# Prerequisites

## Install terraform  
See the following documentation [How to install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

# How to

- Clone the repository to your local machine
```
git clone https://github.com/munnep/depends_on.git
```
- Change your directory
```
cd depends_on
```
- Terraform initialize
```
terraform init
```
- Terraform plan
```
terraform plan
```
- Terraform apply
```
terraform apply
```
- Sample output. Notice that the ```null_resource.house``` is finished before the creation of ```module.kitchen```
```
null_resource.house: Creating...
null_resource.house: Provisioning with 'local-exec'...
null_resource.house (local-exec): Executing: ["/bin/sh" "-c" "sleep 30; echo house created"]
null_resource.house: Still creating... [10s elapsed]
null_resource.house: Still creating... [20s elapsed]
null_resource.house: Still creating... [30s elapsed]
null_resource.house (local-exec): house created
null_resource.house: Creation complete after 30s [id=115363329527945069]
module.kitchen.null_resource.kitchen: Creating...
module.kitchen.null_resource.kitchen: Provisioning with 'local-exec'...
module.kitchen.null_resource.kitchen (local-exec): Executing: ["/bin/sh" "-c" "echo kitchen created"]
module.kitchen.null_resource.kitchen (local-exec): kitchen created
module.kitchen.null_resource.kitchen: Creation complete after 0s [id=7354424909908622816]
```
- destroy the resources
```
terraform destroy
```