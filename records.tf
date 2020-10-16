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

  managed_zone = google_dns_managed_zone.zone.name
  type         = "A"
  ttl          = 3 * 24 * 60 * 60 # 3 Days to Seconds

  name    = "${each.key != "" ? "${each.key}." : ""}${google_dns_managed_zone.zone.dns_name}"
  rrdatas = each.value
}

# https://support.google.com/domains/answer/9428703
resource google_dns_record_set mx_records {
  name         = google_dns_managed_zone.zone.dns_name
  managed_zone = google_dns_managed_zone.zone.name

  type = "MX"
  ttl  = 60 * 60 # 1 Hour

  rrdatas = [
    "5 gmr-smtp-in.l.google.com.",
    "10 alt1.gmr-smtp-in.l.google.com.",
    "20 alt2.gmr-smtp-in.l.google.com.",
    "30 alt3.gmr-smtp-in.l.google.com.",
    "40 alt4.gmr-smtp-in.l.google.com."
  ]
}
