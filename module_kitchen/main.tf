resource "null_resource" "kitchen" {
  provisioner "local-exec" {
    command = "echo kitchen created"
  }
}