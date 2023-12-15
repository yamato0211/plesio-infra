resource "google_compute_instance" "bastion" {
  project      = var.gcp_project_id
  name         = "bastion-${var.env_name}"
  machine_type = "e2-micro"
  zone         = "${var.gcp_region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = module.vpc.network_id
    subnetwork = "${var.subnetwork}-${var.env_name}"

    access_config {
      // External IP address configuration
    }
  }

  metadata = {
    ssh-keys = "${var.bastion_ssh_user}:${file("~/.ssh/plesio.pub")}"
  }

  tags = ["bastion-host"]
}

resource "google_compute_firewall" "bastion_ssh" {
  project = var.gcp_project_id
  name    = "bastion-ssh"
  network = module.vpc.network_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["bastion-host"]
}
