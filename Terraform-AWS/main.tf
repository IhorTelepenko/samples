provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

## MasterNode
resource "aws_instance" "swarm-master" {
  depends_on             = ["aws_security_group.ITsw_sg"]
  ami                    = "ami-08d658f84a6d84a80"
  instance_type          = "${var.aws_instance_size}"
  key_name               = "${var.aws_key_name}"
  vpc_security_group_ids = ["${aws_security_group.ITsw_sg.id}"]
connection {
   user = "ubuntu"
   port = "22"
   private_key = "${file("${var.aws_key_name}.pem")}"
 }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common",
      "sudo export DEBIAN_FRONTEND=noninteractive",
      "sudo apt update",
      "sudo apt-get upgrade -y -q",
      "sudo apt install -y -q docker.io",
      "sudo apt update",
      "sudo docker swarm init",
      "sudo docker swarm join-token --quiet worker > /home/ubuntu/token"
    ]
  }
  tags {
    Name = "IhorT-swarm-master"
  }
}

##WorkersNodes
resource "aws_instance" "swarm-workers" {
  depends_on             = ["aws_security_group.ITsw_sg"]
  ami                    = "ami-08d658f84a6d84a80"
  instance_type          = "${var.aws_instance_size}"
  key_name               = "${var.aws_key_name}"
  count                  = "${var.aws_worker_count}"
  vpc_security_group_ids = ["${aws_security_group.ITsw_sg.id}"]
connection {
  user = "ubuntu"
  port ="22"
  private_key = "${file("${var.aws_key_name}.pem")}"
}

provisioner "remote-exec" {
inline = [
  "sudo apt update",
  "sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common",
  "sudo export DEBIAN_FRONTEND=noninteractive",
  "sudo apt update",
  "sudo apt upgrade -y -q",
  "sudo apt install -y -q docker.io",
  "sudo apt update",
  #next two strings dosn`t work propertly :-(
  "sudo scp -o StrictHostKeyChecking=no -o NoHostAuthenticationForLocalhost=yes -o UserKnownHostsFile=/dev/null -i IhorTkey.pem ubuntu@${aws_instance.swarm-master.private_ip}:/home/ubuntu/token .",
  "sudo docker swarm join --token $(cat /home/ubuntu/token) ${aws_instance.swarm-master.private_ip}:2377"
  ]
}
tags {
  Name = "IhorT-swarm-worker-${count.index}"
  }
}
