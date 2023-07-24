resource "aws_route53_delegation_set" "delegation_set" {
  count = var.use_delegation_set ? 1 : 0
}

locals {
  delegation_set_id = var.use_delegation_set ? aws_route53_delegation_set.delegation_set[0].id : ""
}

resource "aws_route53_zone" "zone" {
  for_each          = toset(var.zones)
  name              = each.key
  delegation_set_id = local.delegation_set_id
}

resource "aws_route53_record" "a" {
  for_each        = local.a_records_map
  zone_id         = aws_route53_zone.zone[each.value.zone].zone_id
  type            = "A"
  name            = each.value.name
  records         = each.value.targets
  ttl             = 300 # ttls correspond to defaults in AWS console
  allow_overwrite = var.allow_overwrite
}

resource "aws_route53_record" "mx" {
  for_each        = local.mx_records_map
  zone_id         = aws_route53_zone.zone[each.value.zone].zone_id
  type            = "MX"
  name            = each.value.name
  records         = each.value.targets
  ttl             = 86400
  allow_overwrite = var.allow_overwrite
}

resource "aws_route53_record" "txt" {
  for_each        = local.txt_records_map
  zone_id         = aws_route53_zone.zone[each.value.zone].zone_id
  type            = "TXT"
  name            = each.value.name
  records         = each.value.targets
  ttl             = 300
  allow_overwrite = var.allow_overwrite
}

resource "aws_route53_record" "cname" {
  for_each        = local.cname_records_map
  zone_id         = aws_route53_zone.zone[each.value.zone].zone_id
  type            = "CNAME"
  name            = each.value.name
  records         = each.value.targets
  ttl             = 300
  allow_overwrite = var.allow_overwrite
}
