# terraform apply -var-file="app.tfvars" -var="createdBy=e2esa"

locals {
  tags = {
    Project     = var.project
    CreatedBy   = var.createdBy
    CreatedOn   = timestamp()
    Environment = terraform.workspace
  }
}

module "ec2-instance_example_complete" {
  source  = "terraform-aws-modules/ec2-instance/aws//examples/complete"
  version = "5.2.1"
}

#module "ec2" {
  #source            = "../../modules/e2esa-module-aws-ec2"
#  source             = "git::https://github.com/e2eSolutionArchitect/terraform.git//providers/aws/modules/e2esa-module-aws-ec2?ref=main"
  #for_each          = toset(var.ec2_names) # toset(["ec21","ec22"])
#  ami               = var.ami
#  availability_zone = var.availability_zone
#  tags              = local.tags
#}
