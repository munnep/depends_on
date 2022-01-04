# Example: Depends_on

Information depends_on Meta-Argument [See documentation](https://www.terraform.io/language/meta-arguments/depends_on) 

This repository shows en example on the effect of the depends_on meta-argument. With depends_on you can make sure a resource only starts after another resource is created. 

In this example you will create 2 resources without a depends_on meta-argument to see what happens. After that you will do it again with the depends_on meta-argument and see the difference 

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
- Sample output. Notice that the ```module.kitchen``` is finished before the ```null_resource.house```
```
null_resource.house: Creating...
module.kitchen.null_resource.kitchen: Creating...
null_resource.house: Provisioning with 'local-exec'...
module.kitchen.null_resource.kitchen: Provisioning with 'local-exec'...
module.kitchen.null_resource.kitchen (local-exec): Executing: ["/bin/sh" "-c" "echo kitchen created"]
null_resource.house (local-exec): Executing: ["/bin/sh" "-c" "sleep 30; echo house created"]
module.kitchen.null_resource.kitchen (local-exec): kitchen created
module.kitchen.null_resource.kitchen: Creation complete after 0s [id=6646662656843082961]
null_resource.house: Still creating... [10s elapsed]
null_resource.house: Still creating... [20s elapsed]
null_resource.house: Still creating... [30s elapsed]
null_resource.house (local-exec): house created
null_resource.house: Creation complete after 30s [id=8862914283677352602]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
- destroy the resources
```
terraform destroy
```
- You want to create the house before creating the kitchen
- alter the file ```main.tf``` and change the ```module_kitchen``` to add a depends_on for the ```null_resource.house```
```
module "kitchen" {
  source     = "./module_kitchen"
  depends_on = [null_resource.house]
}
```
- With this change the ```module_kitchen``` should be created after the ```null_resource.house```
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