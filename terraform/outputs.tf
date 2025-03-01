output "instance_ids" {
    value = aws_instance.web_instance.*.id 
}

output "security_group_id" {
    value = aws_security_group.web_sg.id
}

output "instance_ips"{
    description = "Public IP address of the instances created"
    value = aws_instance.web_instance.*.public_ip 
}