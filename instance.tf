resource "aws_instance" "wp-project-instance-2" {
  count = var.count_instance
  ami             = var.ami
  instance_type   = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  key_name = aws_key_pair.deployer.key_name
  security_groups = ["ssh_only"]
  provisioner "remote-exec" {
    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.user
      private_key = file(var.ssh_key_location)
      }
      inline = [
        "sudo yum install httpd -y",
        "sudo systemctl start httpd && sudo systemctl enable httpd",
        "sudo yum install mariadb mariadb-server -y",
        "sudo systemctl start mariadb && sudo systemctl enable mariadb",
        "sudo yum update -y",
        "sudo yum install epel-release -y",
        "sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y",
        ]
      } 
  lifecycle{
    prevent_destroy = false
  }
  tags = {
    Name = "wp-project"
  }
}

