locals {
  manage_delegation_set = var.manage_delegation_set && var.delegation_set_id == ""
  delegation_set_id     = (var.delegation_set_id != "") ? var.delegation_set_id : (var.manage_delegation_set ? aws_route53_delegation_set.delegation_set[0].id : "")
}

resource "aws_route53_delegation_set" "delegation_set" {
  count = local.manage_delegation_set ? 1 : 0
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
  ttl             = var.a_ttl
  allow_overwrite = var.allow_overwrite
}

resource "aws_route53_record" "alias" {
  for_each        = local.alias_records_map
  zone_id         = aws_route53_zone.zone[each.value.zone].zone_id
  type            = "A"
  name            = each.value.name
  allow_overwrite = var.allow_overwrite

  alias {
    name          = each.value.target.dns_name
    zone_id       = each.value.target.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "mx" {
  for_each        = local.mx_records_map
  zone_id         = aws_route53_zone.zone[each.value.zone].zone_id
  type            = "MX"
  name            = each.value.name
  records         = each.value.targets
  ttl             = var.mx_ttl
  allow_overwrite = var.allow_overwrite
}

resource "aws_route53_record" "txt" {
  for_each        = local.txt_records_map
  zone_id         = aws_route53_zone.zone[each.value.zone].zone_id
  type            = "TXT"
  name            = each.value.name
  records         = each.value.targets
  ttl             = var.txt_ttl
  allow_overwrite = var.allow_overwrite
}

resource "aws_route53_record" "cname" {
  for_each        = local.cname_records_map
  zone_id         = aws_route53_zone.zone[each.value.zone].zone_id
  type            = "CNAME"
  name            = each.value.name
  records         = each.value.targets
  ttl             = var.cname_ttl
  allow_overwrite = var.allow_overwrite
}

resource "aws_route53_record" "ns" {
  for_each        = local.ns_records_map
  zone_id         = aws_route53_zone.zone[each.value.zone].zone_id
  type            = "NS"
  name            = each.value.name
  records         = each.value.targets
  ttl             = var.ns_ttl
  allow_overwrite = var.allow_overwrite
}
