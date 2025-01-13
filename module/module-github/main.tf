module "instance_provisioning" {
  source      = "git::https://github.com/arumugam0911/terraform/tree/master/module"
  module_security_group      = var.module_security_group
  cidr        = var.cidr
  amiid       = var.amiid
  instance_type = var.instance_type
  keypair     = var.keypair
  instance_name =var.instance_name
  env =var.env
}