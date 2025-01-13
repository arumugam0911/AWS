module "instance_provisioning" {
  source      = "../module"
  module_security_group      = var.module_security_group
  cidr        = var.cidr
  amiid       = var.amiid
  instance_type = var.instance_type
  keypair     = var.keypair
  instance_name =var.instance_name
  env =var.env
}