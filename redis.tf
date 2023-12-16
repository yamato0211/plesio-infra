resource "google_redis_instance" "redis_instance" {
  name               = "plesio-redis-${var.env_name}"
  tier               = "BASIC"
  memory_size_gb     = 1
  region             = var.gcp_region
  authorized_network = module.vpc.network_id
}