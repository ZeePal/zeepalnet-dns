locals {
  primary_ips = ["59.167.196.35"]

  dns_a_records = {
    ""  = local.primary_ips
    www = local.primary_ips

    webmail = local.primary_ips
    mail    = local.primary_ips
    smtp    = local.primary_ips
    pop3    = local.primary_ips
    imap    = local.primary_ips

    k9   = local.primary_ips
    doc  = local.primary_ips
    sql  = local.primary_ips
    ldap = local.primary_ips
  }
}


resource google_dns_record_set a_records {
  for_each = local.dns_a_records

  managed_zone = google_dns_managed_zone.zeepalnet.name
  type         = "A"
  ttl          = 3 * 24 * 60 * 60 # 3 Days to Seconds

  name    = "${each.key != "" ? "${each.key}." : ""}${google_dns_managed_zone.zeepalnet.dns_name}"
  rrdatas = each.value
}

resource google_dns_record_set mx_records {
  name         = google_dns_managed_zone.zeepalnet.dns_name
  managed_zone = google_dns_managed_zone.zeepalnet.name

  type = "MX"
  ttl  = 3 * 24 * 60 * 60 # 3 Days to Seconds

  rrdatas = [
    "5 mail.zeepal.net."
  ]
}
