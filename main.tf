resource "kubernetes_namespace" "nginx_namespace" {
  metadata {
    name = var.namespace_name
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = var.deployment_name
    namespace = kubernetes_namespace.nginx_namespace.metadata[0].name
    labels = {
      app = var.app_label
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_label
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_label
        }
      }

      spec {
        volume {
          name = var.volume_name

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.nginx-volume.metadata[0].name
          }
        }

        container {
          image = var.container_image
          name  = var.container_name
          port {
            container_port = var.container_port
          }
          resources {
            limits = {
              cpu    = var.cpu_limit
              memory = var.memory_limit
            }
            requests = {
              cpu    = var.cpu_request
              memory = var.memory_request
            }
          }

          volume_mount {
            name       = var.volume_name  # Should be the same as the volume name defined above
            mount_path = var.logs_mount_path
          }
        }
      }
    }
  }
}

