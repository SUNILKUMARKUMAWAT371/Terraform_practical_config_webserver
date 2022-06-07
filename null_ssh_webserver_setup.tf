# terraform init -upgrade

resource  "null_resource"  "sshnull1" {

# forces replacement : everytime 
	triggers = {
		mytest = timestamp()
	}


	connection {
	    type     = "ssh"
	    user     = "ec2-user"
	    private_key = file("C:/Users/sunil/Downloads/key_terraform_training_key.pem")
	    host     = aws_instance.os1.public_ip
	  }



	provisioner "remote-exec" {
	    inline = [
	      "sudo yum install httpd -y",
      	"sudo systemctl enable httpd --now",
	    ]
	  }

# meta argument
	depends_on = [ 
			aws_instance.os1
			]


}

