resource "yandex_iam_service_account" "terraform" {
  name        = "terraform-deployer"
  description = "Service account for DevOps diplom infrastructure"
}

resource "yandex_resourcemanager_folder_iam_member" "compute_admin" {
  folder_id = var.folder_id
  role      = "compute.admin"
  member    = "serviceAccount:${yandex_iam_service_account.terraform.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "vpc_admin" {
  folder_id = var.folder_id
  role      = "vpc.admin"
  member    = "serviceAccount:${yandex_iam_service_account.terraform.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "sa_user" {
  folder_id = var.folder_id
  role      = "iam.serviceAccounts.user"
  member    = "serviceAccount:${yandex_iam_service_account.terraform.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "storage_admin" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.terraform.id}"
}

resource "yandex_iam_service_account_static_access_key" "terraform" {
  service_account_id = yandex_iam_service_account.terraform.id
  description        = "Terraform S3 backend access key"
}

resource "yandex_storage_bucket" "terraform_state" {
  bucket = var.state_bucket_name

  access_key = yandex_iam_service_account_static_access_key.terraform.access_key
  secret_key = yandex_iam_service_account_static_access_key.terraform.secret_key

  max_size = 1073741824

  versioning {
    enabled = true
  }

  force_destroy = false

  depends_on = [
    yandex_resourcemanager_folder_iam_member.storage_admin
  ]
}