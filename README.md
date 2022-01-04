# Example: Depends_on

Information depends_on Meta-Argument [See documentation](https://www.terraform.io/language/meta-arguments/depends_on) 

This repository shows en example on the effect of the depends_on Meta-Argument. With depends_on you can make sure a resource/module only starts after another resource/module is created. 

In this example you will create 2 resources without a depends_on meta-argument to see that happens. After that you will do it again with the depends_on meta-argument and see the difference 

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
- Sample output. Notice that the ```module.module_resource``` is finished before the ```null_resource.resource```
```
module.module_resource.null_resource.module_resource: Creating...
null_resource.resource: Creating...
null_resource.resource: Provisioning with 'local-exec'...
module.module_resource.null_resource.module_resource: Provisioning with 'local-exec'...
null_resource.resource (local-exec): Executing: ["/bin/sh" "-c" "sleep 30; echo local resource created"]
module.module_resource.null_resource.module_resource (local-exec): Executing: ["/bin/sh" "-c" "echo module resource created"]
module.module_resource.null_resource.module_resource (local-exec): module resource created
module.module_resource.null_resource.module_resource: Creation complete after 0s [id=1234333813305783273]
null_resource.resource: Still creating... [10s elapsed]
null_resource.resource: Still creating... [20s elapsed]
null_resource.resource: Still creating... [30s elapsed]
null_resource.resource (local-exec): local resource created
null_resource.resource: Creation complete after 30s [id=8198074707940764220]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
- destroy the resources
```
terraform destroy
```
- alter the file ```main.tf``` and change the module resource to add a depends_on for the first resource.
```
module "module_resource" {
  source     = "./module"
  depends_on = [null_resource.resource]
}
```
- With this change the ```module_resource``` should be created after the house
```

```