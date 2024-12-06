variable "ou_list" {
  description = "The list of OU resource control policies"
}

variable "policies_dir" {
  description = "The directory containing the resource control policies."
  type        = string
  default     = "policies"
}

variable "config" {
  description = "The configuration for the resource control policies."
}