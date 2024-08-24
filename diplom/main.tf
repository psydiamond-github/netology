terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

#variable "yandex_cloud_token" {
#  type = string
#  description = "Данная переменная потребует ввести секретный токен в консоли при запуске terraform plan/apply"
#}

provider "yandex" {
#  token     = var.yandex_cloud_token
  cloud_id  = "b1geh5m3vpg2dpc0qv06"
  folder_id = "b1g6epuafplhu831ge1h"
  zone      = "ru-central1-a"
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}