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
