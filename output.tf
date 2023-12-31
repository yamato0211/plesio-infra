output "cluster_name" {
  description = "cluster name"
  value       = module.gke.name
}

output "cloud_sql_private_ip" {
  description = "cloud sql private ip"
  value       = google_sql_database_instance.mysql.private_ip_address
}

output "bastion_public_ip" {
  description = "bastion public ip"
  value       = google_compute_instance.bastion.network_interface[0].access_config[0].nat_ip
}

output "name_servers" {
  description = "name servers"
  value       = google_dns_managed_zone.my_zone.name_servers
}

output "static_ip" {
  description = "static ip"
  value       = google_compute_global_address.static_ip.address
}

output "argo_static_ip" {
  description = "argo static ip"
  value       = google_compute_global_address.argo_static_ip.address
}

output "redis_host" {
  description = "redis endpoint"
  value       = google_redis_instance.redis_instance.host
}

output "redis_port" {
  description = "redis port"
  value       = google_redis_instance.redis_instance.port
}
