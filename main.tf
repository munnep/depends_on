resource "null_resource" "resource" {
  provisioner "local-exec" {
    command = "sleep 30; echo local resource created"
  }
}

module "module_resource" {
  source     = "./module"
}
