
resource "kubernetes_service" "nginx_service" {
  metadata {
    name      = var.service_name
    namespace = var.namespace_name
  }

  spec {
    selector = var.service_selector

    port {
      protocol    = "TCP"
      port        = var.service_port
      target_port = var.service_target_port
    }
  }
}

