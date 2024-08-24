resource "yandex_compute_disk" "test" {
  name     = "test"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  image_id = "fd8ba9d5mfvlncknt2kd"

  labels = {
    environment = "test"
  }
}

resource "yandex_vpc_address" "addr" {
  name = "vm-adress"
  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}

resource "yandex_compute_instance" "vm-1" {
  name        = "terraform1"
  hostname    = "terraform1"
  zone        = "ru-central1-a"

  resources {
    core_fraction = 20
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.test.id
  }

  network_interface {
    subnet_id = "e9bkc41h7lmal6c9tr29"
    nat       = true
  }

  metadata = {
    user-data = "${file("./cloud-conf.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}