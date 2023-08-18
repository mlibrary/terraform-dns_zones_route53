## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_delegation_set.delegation_set](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_delegation_set) | resource |
| [aws_route53_record.a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.cname](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.mx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.txt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Map of A records. Keys are the record names, values are String or String[] containing record data. | `any` | `{}` | no |
| <a name="input_allow_overwrite"></a> [allow\_overwrite](#input\_allow\_overwrite) | Enable 'allow\_overwrite' on all dns records under this module. | `bool` | `false` | no |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Map of CNAME records. Keys are the record names, values are String or String[] containing record data. | `any` | `{}` | no |
| <a name="input_delegation_set_id"></a> [delegation\_set\_id](#input\_delegation\_set\_id) | Use this delegation set. Useful if you are using multiple copies of this module and they need to share a delegation set. Causes manage\_delegation\_set to be ignored. | `string` | `""` | no |
| <a name="input_manage_delegation_set"></a> [manage\_delegation\_set](#input\_manage\_delegation\_set) | Set to false to create/maintain a zone using randomized DNS servers. Mainly useful if you are importing an existing route53 zone, and you don't want it re-created with new primary DNS hosts. Ignored if delegation\_set\_id is set. | `bool` | `true` | no |
| <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records) | Map of MX records. Keys are the record names, values are String or String[] containing record data. See AWS documentation for record format. | `any` | `{}` | no |
| <a name="input_ns_records"></a> [ns\_records](#input\_ns\_records) | Map of NS records. Keys are the record names, values are String or String[] containing record data. | `any` | `{}` | no |
| <a name="input_txt_records"></a> [txt\_records](#input\_txt\_records) | Map of TXT records. Keys are the record names, values are String or String[] containing record data. | `any` | `{}` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | a list of dns zones to create | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a"></a> [a](#output\_a) | n/a |
| <a name="output_cname"></a> [cname](#output\_cname) | n/a |
| <a name="output_debug"></a> [debug](#output\_debug) | n/a |
| <a name="output_delegation_set_id"></a> [delegation\_set\_id](#output\_delegation\_set\_id) | n/a |
| <a name="output_mx"></a> [mx](#output\_mx) | n/a |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | n/a |
| <a name="output_txt"></a> [txt](#output\_txt) | n/a |
| <a name="output_zone"></a> [zone](#output\_zone) | n/a |
