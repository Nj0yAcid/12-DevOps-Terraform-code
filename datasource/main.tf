#Create an instance with the ami of the instance we createad manually

resource "aws_instance" "demo" {
  ami = data.aws_instance.ec21.ami
  instance_type = data.aws_instance.ec21.instance_type
  key_name = data.aws_instance.ec21.key_name

}

#Create an instance with the AMI that is stored in our data source

resource "aws_instance" "nmy-instance" {
  ami = data.aws_ami.latest-ami.id
  instance_type = data.aws_instance.ec21.instance_type
  key_name = data.aws_instance.ec21.key_name
}