output name_servers {
  value = google_dns_managed_zone.zeepalnet.name_servers
}

output ds_record {
  value = data.google_dns_keys.keys.key_signing_keys[0].ds_record
}
