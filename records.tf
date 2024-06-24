# https://support.google.com/domains/answer/9428703
resource "google_dns_record_set" "mx_records" {
  name         = google_dns_managed_zone.zone.dns_name
  managed_zone = google_dns_managed_zone.zone.name

  type = "MX"
  ttl  = 60 * 60 # 1 Hour

  rrdatas = [
    "10 mxa.mailgun.org.",
    "10 mxb.mailgun.org.",
  ]
}

resource "google_dns_record_set" "spf" {
  name         = google_dns_managed_zone.zone.dns_name
  managed_zone = google_dns_managed_zone.zone.name

  type = "TXT"
  ttl  = 60 * 60 # 1 Hour

  rrdatas = [
    "\"v=spf1 include:mailgun.org ~all\""
  ]
}

resource "google_dns_record_set" "dkim" {
  name         = "mailo._domainkey.${google_dns_managed_zone.zone.dns_name}"
  managed_zone = google_dns_managed_zone.zone.name

  type = "TXT"
  ttl  = 60 * 60 # 1 Hour

  rrdatas = [
    "\"k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC5yo3zsSpFlVF4keMbFUa+e6W6TLEDrtJKn7hIQbTP4+1NWEsgdOraI8nAKmw/6XncS5rIZanRylmmGWBUZkTadYqVB+P8SUVscgDriBfaCJslR0KtopRCFl5lyDDl5j7BH/u5AHQCSS378NROxnRhgZW6yErNIqC5+Et5Ytk2zQIDAQAB\""
  ]
}

resource "google_dns_record_set" "a_records" {
  managed_zone = google_dns_managed_zone.zone.name
  type         = "CNAME"
  ttl          = 3 * 24 * 60 * 60 # 3 Days to Seconds

  name    = "games.${google_dns_managed_zone.zone.dns_name}"
  rrdatas = ["zeepal.freeddns.org."]
}
