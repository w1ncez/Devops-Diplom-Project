output "service_account_id" {
  description = "Terraform service account ID"
  value       = yandex_iam_service_account.terraform.id
}

output "state_bucket" {
  description = "Terraform state bucket name"
  value       = yandex_storage_bucket.terraform_state.bucket
}

output "access_key" {
  description = "S3 access key ID"
  value       = yandex_iam_service_account_static_access_key.terraform.access_key
}

output "secret_key" {
  description = "S3 secret access key"
  value       = yandex_iam_service_account_static_access_key.terraform.secret_key
  sensitive   = true
}