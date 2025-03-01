provider "aws" {
  region = var.region
}

resource "aws_security_group" "web_sg" {
    name_prefix = "web-sg-"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]    
    }
    
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8081
        to_port = 8081
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8082
        to_port = 8082
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8083
        to_port = 8083
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "web_instance" {
    count = var.instance_count
    ami = "ami-04b4f1a9cf54c11d0"
    instance_type = "t2.micro"

    key_name = "divinekey"

    security_groups = [aws_security_group.web_sg.name]

    tags = {
        Name = "WebServer-${count.index + 1}"
    }

    provisioner "local-exec" {
        command = <<EOT
          echo "[web_instance]" > ../ansible/inventory.ini
          echo "${self.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/divinekey.pem" >> ../ansible/inventory.ini
        EOT
    }
}


