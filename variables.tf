variable "zones" {
  description = "a list of dns zones to create"
  type        = list(string)
}

variable "txt_records" {
  description = "Map of TXT records. Keys are the record names, values are String or String[] containing record data."
  type        = any
  default     = {}
}

variable "mx_records" {
  description = "Map of MX records. Keys are the record names, values are String or String[] containing record data. See AWS documentation for record format."
  type        = any
  default     = {}
}

variable "a_records" {
  description = "Map of A records. Keys are the record names, values are String or String[] containing record data."
  type        = any
  default     = {}
}

variable "cname_records" {
  description = "Map of CNAME records. Keys are the record names, values are String or String[] containing record data."
  type        = any
  default     = {}
}

variable "ns_records" {
  description = "Map of NS records. Keys are the record names, values are String or String[] containing record data."
  type        = any
  default     = {}
}

variable "manage_delegation_set" {
  description = "Set to false to create/maintain a zone using randomized DNS servers. Mainly useful if you are importing an existing route53 zone, and you don't want it re-created with new primary DNS hosts. Ignored if delegation_set_id is set."
  type        = bool
  default     = true
}

variable "delegation_set_id" {
  description = "Use this delegation set. Useful if you are using multiple copies of this module and they need to share a delegation set. Causes manage_delegation_set to be ignored."
  type        = string
  default     = ""
}

variable "allow_overwrite" {
  description = "Enable 'allow_overwrite' on all dns records under this module."
  type        = bool
  default     = false
}
