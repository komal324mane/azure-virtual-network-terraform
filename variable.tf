variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Name of Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "Name of Subnet"
  type        = string
}

variable "address_space" {
  description = "VNet Address Space"
  type        = list(string)
}

variable "subnet_address_prefixes" {
  description = "Subnet Address Prefix"
  type        = list(string)
}

variable "admin_source_cidr" {
  description = "Trusted IPv4 CIDR allowed to connect to the subnet over SSH"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.admin_source_cidr)) && var.admin_source_cidr != "0.0.0.0/0"
    error_message = "admin_source_cidr must be a valid IPv4 CIDR and cannot allow SSH from the entire internet."
  }
}
