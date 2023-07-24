resource "kubernetes_persistent_volume_v1" "nginx-volume" {
  metadata {
    name = var.pv_name
  }
  spec {
    capacity = {
      storage = var.pv_capacity
    }
    access_modes = var.pv_access_modes
    storage_class_name = var.pv_storage_class_name
    persistent_volume_source {
    host_path {
      path = var.pv_host_path
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "nginx-volume" {
  metadata {
    name = var.pvc_name
    namespace = kubernetes_namespace.nginx_namespace.metadata[0].name
  }

  wait_until_bound = false
  spec {
    access_modes = var.pvc_access_modes
    storage_class_name = var.pvc_storage_class_name
    resources {
      requests = {
        storage = var.pvc_storage_request
      }
    }
  }
}

