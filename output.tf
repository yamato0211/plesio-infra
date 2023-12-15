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