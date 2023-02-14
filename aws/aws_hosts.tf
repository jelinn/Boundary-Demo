# Configure the AWS VM hosts
variable "instances" {
  default = [
    "boundary-1-dev", 
    "boundary-2-dev", 
    "boundary-3-production", 
    "boundary-4-production",
    "boundary-5-production",
    "boundary-6-dev"
  ]
}

variable "vm_tags" {
  default = [
    {"Name":"boundary-1-dev","service-type":"database", "env":"dev"},
    {"Name":"boundary-2-dev","service-type":"database", "env":"dev"},
    {"Name":"boundary-3-production","service-type":"database", "env":"production"},
    {"Name":"boundary-4-production","service-type":"database", "env":"production"},
    {"Name":"boundary-5-production","service-type":"web-server", "env":"production"},
    {"Name":"boundary-6-dev","service-type":"web-server", "env":"dev"}
  ]
}

resource "aws_security_group" "boundary-ssh" {
  name        = "boundary_allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNVVMbU2AOe37He8wRYEpOr5C1NUlqCySpx65Bn23nNc2I3JTTPvdlOeHACbJjUM++WXXebU488EHuZBwBE6Qb7eRLzeIjNWGZr2Qdk3Jz8kYkH2wEhgo0sZaZhNxEHLlXqliyL1Jv7x2o/rI98Ld89DcIP0S3oeD2q0iSFVupgQ9ZENGbqSsgVtftRE6CvADaYtcIeFitl4O3jdMIHoLAIuZ0CuOabLLK5vJNfepXIHGLhkheEw9jJCGJOmE9ITu5TozbBQ2uwgWWxLYBiI/ziuB77YHNi8GVOX90X4ZTP9UWINF0bnJjml1qdG9xdAz1rSqfxwrkO12faEEpfIMHFM86DQdYqEcVZQzEQIODJPaxPXhBYCoGVpYmz8XHF+0pSs2LRSdE/40rHqW3R5prA5TM1zI3X410CaUQeL3t8/ycFA1w9LOAydJ+vB1bQG62yYY7JyUF6x44beXTuIoqtLEmlcZl8QJQ0dm7mfGJJ9xLkqBv13S8lrP2DlUoEVU= jelinn@jelinn-N7K92N33H0"
}

resource "aws_instance" "boundary-instance" {
  count                  = length(var.instances)
  ami                    = "ami-083602cee93914c0c"
  instance_type          = "t3.micro"
  availability_zone      = "us-east-1a"
  security_groups        = ["boundary_allow_ssh"]
  vpc_security_group_ids = ["${aws_security_group.boundary-ssh.id}"]
  tags                   = var.vm_tags[count.index]
  key_name               = aws_key_pair.deployer.key_name
}
