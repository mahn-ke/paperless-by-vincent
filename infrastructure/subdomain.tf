resource "random_password" "ddns_password" {
  length  = 30
  special = false
}

locals {
  subdomain_label = replace(replace(basename(dirname(path.cwd)), "-by-vincent", ""), "-", ".")
}

resource "allinkl_dns" "subdomain" {
  zone_host   = "mahn.ke"
  record_type = "A"
  record_name = format("%s.", local.subdomain_label)
  record_data = "88.99.215.101"
}