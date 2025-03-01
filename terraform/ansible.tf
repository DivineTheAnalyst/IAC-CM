resource "null_resource" "ansible_provision" {
  depends_on = [aws_instance.web_instance]

  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/inventory.ini ../ansible/playbook.yml"
  }
}
