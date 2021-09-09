# https://support.google.com/domains/answer/9428703
resource "google_dns_record_set" "mx_records" {
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

resource "google_dns_record_set" "a_records" {
  managed_zone = google_dns_managed_zone.zone.name
  type         = "CNAME"
  ttl          = 3 * 24 * 60 * 60 # 3 Days to Seconds

  name    = "games.${google_dns_managed_zone.zone.dns_name}"
  rrdatas = ["zeepal.freeddns.org."]
}
