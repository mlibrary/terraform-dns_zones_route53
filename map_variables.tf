locals {
  a_records_map = { for i in flatten([
    for zone in var.zones : [
      for name, targets in var.a_records : {
        zone    = zone,
        name    = name,
        targets = flatten([targets])
      }
    ]
  ]) : "${i.zone}::${i.name}" => i }

  alias_records_map = { for i in flatten([
    for zone in var.zones : [
      for name, target in var.alias_records : {
        zone   = zone,
        name   = name,
        target = target,
      }
    ]
  ]) : "${i.zone}::${i.name}" => i }

  cname_records_map = { for i in flatten([
    for zone in var.zones : [
      for name, targets in var.cname_records : {
        zone    = zone,
        name    = name,
        targets = flatten([targets])
      }
    ]
  ]) : "${i.zone}::${i.name}" => i }

  mx_records_map = { for i in flatten([
    for zone in var.zones : [
      for name, targets in var.mx_records : {
        zone    = zone,
        name    = name,
        targets = flatten([targets])
      }
    ]
  ]) : "${i.zone}::${i.name}" => i }

  txt_records_map = { for i in flatten([
    for zone in var.zones : [
      for name, targets in var.txt_records : {
        zone    = zone,
        name    = name,
        targets = flatten([targets])
      }
    ]
  ]) : "${i.zone}::${i.name}" => i }

  ns_records_map = { for i in flatten([
    for zone in var.zones : [
      for name, targets in var.ns_records : {
        zone    = zone,
        name    = name,
        targets = flatten([targets])
      }
    ]
  ]) : "${i.zone}::${i.name}" => i }
}

output "debug" {
  value = {
    a_records_map     = local.a_records_map
    cname_records_map = local.cname_records_map
    mx_records_map    = local.mx_records_map
    txt_records_map   = local.txt_records_map
    ns_records_map    = local.ns_records_map
  }
}
