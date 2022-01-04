resource "null_resource" "module_resource" {
  provisioner "local-exec" {
    command = "echo module resource created"
  }
}