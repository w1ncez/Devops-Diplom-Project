
output "master_public_ip" {
  description = "Public IP address of Kubernetes master"
  value       = yandex_compute_instance.master.network_interface[0].nat_ip_address
}

output "worker_1_public_ip" {
  description = "Public IP address of Kubernetes worker 1"
  value       = yandex_compute_instance.worker_1.network_interface[0].nat_ip_address
}

output "worker_2_public_ip" {
  description = "Public IP address of Kubernetes worker 2"
  value       = yandex_compute_instance.worker_2.network_interface[0].nat_ip_address
}

output "master_internal_ip" {
  value = yandex_compute_instance.master.network_interface[0].ip_address
}

output "worker_1_internal_ip" {
  value = yandex_compute_instance.worker_1.network_interface[0].ip_address
}

output "worker_2_internal_ip" {
  value = yandex_compute_instance.worker_2.network_interface[0].ip_address
}
