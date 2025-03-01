[web_instance]
%{ for instance in aws_instance.web_instance ~}
${instance.public_ip} ansible_user=${var.ansible_user} ansible_ssh_private_key_file=${var.ssh_private_key}
%{ endfor ~}

