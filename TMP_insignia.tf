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
    "62800 8 2 0D4EE5E83F9509102012883658E3B9E8B5606FC77D6FCECC913DA79858F1C39F",
  ]
}
