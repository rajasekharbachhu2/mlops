
module "pm_efs" {
  source                     = "../../modules/efs"
  name                       = "keystone_rbp_efs"
  vpc_id                     = "vpc-0aedf14e7c9f0c024"
  subnet_ids                 = ["subnet-0ca650aeb20cf92be"]
  root_access_point_path     = "/efs"
  performance_mode           = "generalPurpose"
  throughput_mode            = "elastic"
  provisioned_throughput_mibps = null
  allowed_security_group_ids = []
  allowed_cidr_blocks        = []
  allowed_principal_arns     = []
  transition_to_ia           = "AFTER_30_DAYS"
  enable_backup_policy       = true
  create_root_access_point   = true
  root_ap_uid                = 1000
  root_ap_gid                = 1000
  tags                       = local.tags
}
