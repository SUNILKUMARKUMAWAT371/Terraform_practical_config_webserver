# terraform init -upgrade

resource  "null_resource"  "volumeformatnull" {

	connection {
	    type     = "ssh"
	    user     = "ec2-user"
	    private_key = file("C:/Users/sunil/Downloads/key_terraform_training_key.pem")
	    host     = aws_instance.os1.public_ip
	  }



	provisioner "remote-exec" {
	    inline = [
	      "sudo mkfs.ext4 /dev/xvdh",
	      "sudo mount /dev/xvdh /var/www/html",
	      "sudo sh -c 'echo welcome to LW   >  /var/www/html/index.html'"
	
	    ]
	  }

# meta argument
	depends_on = [ 
			aws_volume_attachment.my_ebs_attach_ec2 , null_resource.sshnull1  
			]


}

