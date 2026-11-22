
variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
}

variable "service_account_key_file" {
  description = "Path to service account IAM JSON key"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "devops-diplom"
}

variable "default_zone" {
  description = "Default availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Public IP address allowed to connect through SSH"
  type        = string
}

variable "app_allowed_cidr" {
  description = "IP address allowed to access the web application"
  type        = string
}