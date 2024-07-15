resource "aws_instance" "web" {
  ami                         = "ami-01fccab91b456acc2"
  associate_public_ip_address = true
  availability_zone           = "us-east-1c"
  instance_type               = "t2.micro"
  ipv6_address_count          = 0
  key_name                    = "EC2-key-pair"
  monitoring                  = false
  security_groups             = ["launch-wizard-6"]
  subnet_id                   = "subnet-075b0f606737d3c69"
  tags = {
    Name = "created by terraform"
  }
}
