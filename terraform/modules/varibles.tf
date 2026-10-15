variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string

  validation {
    condition     = length(var.table_name) > 3
    error_message = "table_name must be at least 4 characters long."
  }
}

variable "billing_mode" {
  description = "DynamoDB billing mode"
  type        = string
  default     = "PAY_PER_REQUEST"

  validation {
    condition     = contains(["PAY_PER_REQUEST", "PROVISIONED"], var.billing_mode)
    error_message = "billing_mode must be PAY_PER_REQUEST or PROVISIONED."
  }
}

variable "primary_key" {
  description = "Partition key attribute name"
  type        = string
}

variable "sort_key" {
  description = "Sort key attribute name (optional)"
  type        = string
  default     = null
}

variable "attributes" {
  description = "List of attribute definitions"
  type = list(object({
    name = string
    type = string
  }))
}

variable "read_capacity" {
  description = "Read capacity units (only for PROVISIONED)"
  type        = number
  default     = null
}

variable "write_capacity" {
  description = "Write capacity units (only for PROVISIONED)"
  type        = number
  default     = null
}

variable "kms_key_arn" {
  description = <<EOF
KMS key ARN used to encrypt the DynamoDB table.
- If null, AWS-managed key (aws/dynamodb) is used
- If provided, must be a customer-managed CMK ARN
EOF
  type        = string
  default     = null
}

variable "ttl_attribute_name" {
  description = "TTL attribute name (optional)"
  type        = string
  default     = null
}

variable "enable_pitr" {
  description = "Enable point-in-time recovery"
  type        = bool
  default     = false
}

variable "deletion_protection_enabled" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "table_class" {
  description = "DynamoDB table class"
  type        = string
  default     = "STANDARD"

  validation {
    condition = contains(
      ["STANDARD", "STANDARD_INFREQUENT_ACCESS"],
      var.table_class
    )
    error_message = "table_class must be STANDARD or STANDARD_INFREQUENT_ACCESS."
  }
}