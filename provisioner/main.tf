resource "aws_instance" "wb1" {
  ami = "ami-01fccab91b456acc2"
  instance_type = "t2.micro"
  key_name = aws_key_pair.keylamp.key_name
  depends_on = [ local_file.key ]
  tags = {
    name = "webserver"
  }
}

resource "null_resource" "n1" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.wb1.public_ip} > ip.txt"
  }

  connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file(local_file.key.filename)
      host = aws_instance.wb1.public_ip
    }

  provisioner "remote-exec" {
    inline = [ 
        "sudo useradd kevin && sudo groupadd developer"]
    }

   provisioner "file" {
    source = "/Users/emmanuelvitateka/desktop/terraform-utrains/week12-class/12-DevOps-Terraform-code/provisioner/${local_file.key.filename}"
    destination = "/tmp/keywb.pem" 
  }

  depends_on = [ aws_instance.wb1 ]

}
  