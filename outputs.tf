output "name_servers" {
  value = local.manage_delegation_set ? aws_route53_delegation_set.delegation_set[0].name_servers : ["Reusable delegation set disabled for this module. See module.name_of_module.zone or AWS console for NS records."]
}

output "zone" { value = aws_route53_zone.zone }
output "a" { value = aws_route53_record.a }
output "mx" { value = aws_route53_record.mx }
output "txt" { value = aws_route53_record.txt }
output "cname" { value = aws_route53_record.cname }
output "delegation_set_id" { value = local.delegation_set_id }
