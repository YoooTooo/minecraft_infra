resource "aws_instance" "minecraft" {
  count         = 1
  ami           = "ami-0ecb2a61303230c9d" #Amazon Linux2
  key_name               = aws_key_pair.key_pair.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = "${format("minecraft-%02d", count.index)}"
  }
}