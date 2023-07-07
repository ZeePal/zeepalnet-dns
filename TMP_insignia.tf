resource "google_dns_record_set" "TMP_insignia" {
  managed_zone = google_dns_managed_zone.zone.name
  type         = "NS"
  ttl          = 60

  name = "gcp.insigniafinancial.sandbox.${google_dns_managed_zone.zone.dns_name}"
  rrdatas = [
    "ns-cloud-b1.googledomains.com.",
    "ns-cloud-b2.googledomains.com.",
    "ns-cloud-b3.googledomains.com.",
    "ns-cloud-b4.googledomains.com.",
  ]
}

resource "google_dns_record_set" "TMP_insignia_dnssec" {
  managed_zone = google_dns_managed_zone.zone.name
  type         = "DS"
  ttl          = 60

  name = "gcp.insigniafinancial.sandbox.${google_dns_managed_zone.zone.dns_name}"
  rrdatas = [
    "1042 8 2 0392D3F3E31CF6A2A2E26668C5BFB68261E2ECE17EA9BCDC8A1976EE51ECDD62",
  ]
}
