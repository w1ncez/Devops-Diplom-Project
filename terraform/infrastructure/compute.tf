
# Kubernetes control plane
resource "yandex_compute_instance" "master" {
  name        = "${var.project_name}-master-1"
  hostname    = "master-1"
  zone        = "ru-central1-a"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8041m4h84kooeovknf"
      size     = 30
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.master.id
    ip_address         = "10.10.1.10"
    nat                = true
    security_group_ids = [yandex_vpc_security_group.kubernetes.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }
}

# Kubernetes worker 1
resource "yandex_compute_instance" "worker_1" {
  name        = "${var.project_name}-worker-1"
  hostname    = "worker-1"
  zone        = "ru-central1-d"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8041m4h84kooeovknf"
      size     = 20
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.worker_1.id
    ip_address         = "10.10.2.10"
    nat                = true
    security_group_ids = [yandex_vpc_security_group.kubernetes.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }
}

# Kubernetes worker 2
resource "yandex_compute_instance" "worker_2" {
  name        = "${var.project_name}-worker-2"
  hostname    = "worker-2"
  zone        = "ru-central1-e"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8041m4h84kooeovknf"
      size     = 20
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.worker_2.id
    ip_address         = "10.10.3.10"
    nat                = true
    security_group_ids = [yandex_vpc_security_group.kubernetes.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }
}
