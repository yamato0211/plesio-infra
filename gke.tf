module "gke" {
  source              = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id          = var.gcp_project_id
  name                = "${var.cluster_name}-${var.env_name}"
  regional            = true
  region              = var.gcp_region
  network             = module.vpc.network_name
  subnetwork          = module.vpc.subnets_names[0]
  ip_range_pods       = var.ip_range_pods_name
  ip_range_services   = var.ip_range_services_name
  deletion_protection = false
  node_pools = [
    {
      name           = "node-pool"
      machine_type   = "n2-standard-2"
      node_locations = "${var.gcp_region}-a" # 複数のゾーンを指定できる
      min_count      = 1
      max_count      = 2
      disk_size_gb   = 30
    },
  ]
}
