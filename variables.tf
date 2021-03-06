# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "name_suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.name_suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}

variable "vpc_network" {
  description = "A VPC network (self-link) that will be hosting this bastion host"
  type        = string
}

variable "vpc_subnet" {
  description = "A VPC subnet (self-link) that will be hosting this bastion host"
  type        = string
}

variable "disk_image" {
  description = "The boot disk image to be used by the Bastion Host."
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "instance_name" {
  description = "An arbitrary name to identify the bastion host VM instance."
  type        = string
  default     = "bastion-host"
}

variable "allowed_IPs" {
  description = "CIDR blocks of IP ranges that maybe allowed access to SSH into bastion host."
  type        = list(string)
  default     = []
}

variable "user_groups" {
  description = "List of usergroup emails that maybe allowed access to login to the bastion host. For example: SSH login via CLoudSHell."
  type        = list(string)
  default     = []
}

variable "sa_name" {
  description = "An arbitrary name to identify the ServiceAccount that will be generated & attached to the bastion host VM instance."
  type        = string
  default     = "bastion-host"
}

variable "sa_roles" {
  description = "The IAM roles that should be granted to the ServiceAccount which is attached to the bastion host. This will enable the bastion host to access other GCP resources as permitted (or disallowed) by the IAM roles."
  type        = list(string)
  default     = []
}

variable "ip_address_timeout" {
  description = "how long a Compute Address operation is allowed to take before being considered a failure."
  type        = string
  default     = "5m"
}

variable "module_depends_on" {
  description = "Create explicit dependency of this module on values from other modules(s) and/or resource(s)."
  type        = list(string)
  default     = []
}
