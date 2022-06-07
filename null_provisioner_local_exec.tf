resource "null_resource" "localinventorynull" {

	triggers = {
		mytest = timestamp()
	}


	provisioner "local-exec" {
	    command = "echo ${aws_instance.os1.public_ip} > inventory"
	  }

	depends_on = [ 
			aws_instance.os1 
			]

}

resource "null_resource" "launchwebsitewithchrome" {

	triggers = {
		mytest = timestamp()
	}


	provisioner "local-exec" {

            on_failure = continue
	    command = "chrome http://13.233.252.172/index.html"
	  }

	depends_on = [ 
			null_resource.volumeformatnull 
			]
}

resource "null_resource" "destroynull" {

	
	provisioner "local-exec" {
	    when = destroy
	    command = "echo destroying.... > destroy.txt"
	  }

}













