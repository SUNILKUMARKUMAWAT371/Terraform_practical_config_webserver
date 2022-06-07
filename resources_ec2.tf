/*
# terraform.exe workspace list
# terraform.exe workspace  new dev
# terraform.exe workspace  new test
# terraform.exe workspace  new prod
# terraform.exe workspace   select dev
*/

resource "aws_instance" "os1" {	
	ami = var.amiId 
	key_name = "key_terraform_training_key"
      vpc_security_group_ids = [ "sg-0d0943482a36e7189" ]
	instance_type  =  lookup(var.instance_type ,  terraform.workspace)
	tags  =  {  
			Name = var.osName
	}
}

resource "aws_instance" "newos" {	
	ami = var.amiId 
	key_name = "key_terraform_training_key"
      vpc_security_group_ids = [ "sg-0d0943482a36e7189" ]
	instance_type  =  "t2.micro"
	tags  =  {  
			Name = var.osName
	}
}


# create EBS Volume
resource "aws_ebs_volume" "myvol" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 1

  tags = {
    Name = "mywebvol"
  }
}

#Attach EBS Volume
resource "aws_volume_attachment" "my_ebs_attach_ec2" {
  force_detach = true
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myvol.id
  instance_id = aws_instance.os1.id
}

