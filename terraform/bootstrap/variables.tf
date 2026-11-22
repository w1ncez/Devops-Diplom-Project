variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "devops-diplom"
}

variable "state_bucket_name" {
  description = "Terraform state bucket name"
  type        = string
}

variable "service_account_key_file" {
  description = "Path to service account JSON key"
  type        = string
  sensitive   = true
}