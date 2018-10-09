resource "google_compute_firewall" "allow-external" {
  name    = "allow-external"
  network = "default"

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = "${var.external_source_ranges}"
}

resource "google_compute_firewall" "allow-inbound-vault" {
  name    = "allow-inbound-vault"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8200", "443"]
  }
 
  target_tags = ["vault"]
  source_ranges = "${var.external_source_ranges}"
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

resource "google_compute_firewall" "allow-inbound-xldeploy" {
  name    = "allow-inbound-xldeploy"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["4516"]
  }
 
  target_tags = ["xldeploy"]
}

resource "google_compute_firewall" "allow-inbound-consul-dns" {
  name    = "allow-inbound-consul-dns"
  description = "allow DNS traffic to Consul nodes"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8600"]
  }

  allow {
    protocol = "udp"
    ports = ["8600"]
  }

  target_tags = ["consul"]
}