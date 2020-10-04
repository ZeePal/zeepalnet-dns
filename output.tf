output name_servers {
  value = google_dns_managed_zone.zone.name_servers
}

data google_dns_keys keys {
  managed_zone = google_dns_managed_zone.zone.id
}
output ds_record {
  value = data.google_dns_keys.keys.key_signing_keys[0].ds_record
}
