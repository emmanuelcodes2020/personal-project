locals {
 name = "personal-application"
}



resource "aws_instance" "personal-app" {

  ami             = "ami-0500f74cc2b89fb6b"
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  //count           = 1
  security_groups = [aws_security_group.personal_application_sg.id]
  user_data       = file("${path.module}/custom-userdata.sh")
  iam_instance_profile = aws_iam_instance_profile.iam_profile.id

  root_block_device {
    volume_size           = 10
    volume_type           = "gp3"
    encrypted             = false
    delete_on_termination = true
    tags = {

      Name = "${local.name}-root-volume"
    }
  }

  ebs_block_device {
    device_name           = "/dev/sdb"
    volume_size           = var.volume_size
    volume_type           = "gp3"
    encrypted             = false
    delete_on_termination = true
    tags = {

      Name = "${local.name}-ebs-volume"
    }
  }


  tags = {

    //Name = "personal-application-${count.index + 1}.${var.env}"
    Name = "${local.name}-1.dev"

  }

}


