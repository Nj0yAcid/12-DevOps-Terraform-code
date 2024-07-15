/*

resource "aws_iam_user" "user1" {
  name = "Jack"
  depends_on = [ aws_iam_group.grp1 ]
}


resource "aws_iam_group" "grp1" {
  name = "Manager24"
  lifecycle {
    prevent_destroy = false
  }
}

*/

resource "aws_instance" "webserver1" {
  ami = "ami-01fccab91b456acc2"
  instance_type = "t3.small"
  key_name = "windows"
  lifecycle {
    create_before_destroy = true
  }
}
