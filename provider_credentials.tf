# aws configure list-profiles
# auth to aws cloud
provider "myawscloud" {
	region     = var.AWS_REGION
	profile    = "default"

}
