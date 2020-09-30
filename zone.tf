resource google_dns_managed_zone zeepalnet {
  name     = "zeepalnet"
  dns_name = "zeepal.net."

  dnssec_config {
    state = "on"
  }
}

data google_dns_keys keys {
  managed_zone = google_dns_managed_zone.zeepalnet.id
}
