
# Virtual Private Cloud
resource "yandex_vpc_network" "main" {
  name = "${var.project_name}-network"
}

# Subnet for Kubernetes Control Plane
resource "yandex_vpc_subnet" "master" {
  name           = "${var.project_name}-subnet-master"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.10.1.0/24"]
}

# Subnet for Kubernetes Worker 1
resource "yandex_vpc_subnet" "worker_1" {
  name           = "${var.project_name}-subnet-worker-1"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.10.2.0/24"]
}

# Subnet for Kubernetes Worker 2
resource "yandex_vpc_subnet" "worker_2" {
  name           = "${var.project_name}-subnet-worker-2"
  zone           = "ru-central1-e"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.10.3.0/24"]
}
