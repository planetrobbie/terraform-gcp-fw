resource "google_compute_firewall" "allow-external" {
  name    = "allow-external"
  network = "default"

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = ["${var.external_source_ranges}"]
}

resource "google_compute_firewall" "allow-inbound-ptfe-admin" {
  name    = "allow-inbound-ptfe-admin"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8800"]
  }
 
  target_tags = ["ptfe"]
}

