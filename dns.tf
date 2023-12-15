resource "google_dns_managed_zone" "my_zone" {
  name     = "my-zone"
  dns_name = "${var.my_domain}."
}

resource "google_dns_record_set" "plesio" {
  name         = "${var.my_domain}."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.my_zone.name
  rrdatas      = [google_compute_global_address.static_ip.address]
}
