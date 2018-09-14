resource "google_compute_firewall" "allow-external" {
  name    = "allow-external"
  network = "default"

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = "${var.external_source_range}"
}

