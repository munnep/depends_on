resource "null_resource" "house" {
  provisioner "local-exec" {
    command = "sleep 30; echo house created"
  }
}

module "kitchen" {
  source     = "./module_kitchen"
}
