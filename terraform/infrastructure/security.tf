
resource "yandex_vpc_security_group" "kubernetes" {
  name        = "${var.project_name}-k8s-sg"
  description = "Security group for Kubernetes cluster"
  network_id  = yandex_vpc_network.main.id

  # SSH access from administrator IP
  ingress {
    protocol       = "TCP"
    description    = "SSH access"
    port           = 22
    v4_cidr_blocks = [var.ssh_allowed_cidr]
  }

  # Kubernetes API access
  ingress {
    protocol    = "TCP"
    description = "Kubernetes API"
    port        = 6443
    v4_cidr_blocks = [
      var.ssh_allowed_cidr,
      "10.10.0.0/16"
    ]
  }

  # etcd communication
  ingress {
    protocol       = "TCP"
    description    = "etcd client and peer communication"
    from_port      = 2379
    to_port        = 2380
    v4_cidr_blocks = ["10.10.1.0/24"]
  }

  # Kubelet API
  ingress {
    protocol       = "TCP"
    description    = "Kubelet API"
    port           = 10250
    v4_cidr_blocks = ["10.10.0.0/16"]
  }

  # Calico VXLAN
  ingress {
    protocol       = "UDP"
    description    = "Calico VXLAN"
    port           = 4789
    v4_cidr_blocks = ["10.10.0.0/16"]
  }

  # Internal cluster communication
  ingress {
    protocol       = "ANY"
    description    = "Internal cluster traffic"
    v4_cidr_blocks = ["10.10.0.0/16"]
  }

  # Outgoing traffic
  egress {
    protocol       = "ANY"
    description    = "Allow outgoing traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  # Web application access via Kubernetes NodePort
  ingress {
    protocol       = "TCP"
    description    = "Web application access"
    port           = 30080
    v4_cidr_blocks = [var.app_allowed_cidr]
  }
}
