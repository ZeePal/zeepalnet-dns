resource "google_dns_record_set" "TMP_insignia" {
  managed_zone = google_dns_managed_zone.zone.name
  type         = "NS"
  ttl          = 60

  name = "gcp.insigniafinancial.sandbox.${google_dns_managed_zone.zone.dns_name}"
  rrdatas = [
    "ns-cloud-c1.googledomains.com.",
    "ns-cloud-c2.googledomains.com.",
    "ns-cloud-c3.googledomains.com.",
    "ns-cloud-c4.googledomains.com.",
  ]
}

resource "google_dns_record_set" "TMP_insignia_dnssec" {
  managed_zone = google_dns_managed_zone.zone.name
  type         = "DS"
  ttl          = 60

  name = "gcp.insigniafinancial.sandbox.${google_dns_managed_zone.zone.dns_name}"
  rrdatas = [
    "20417 8 2 C384D9CA0E96BBF5163DA512D34ABEBDF454CF4AED7E38A6FF00603B62B6EF50",
  ]
}
