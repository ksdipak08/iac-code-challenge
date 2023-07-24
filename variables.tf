# variables.tf

variable "kube_config_path" {
  default = "~/.kube/config"  # Path to your Kubernetes config file
}

variable "namespace_name" {
  default = "nginx-namespace-0"
}

variable "deployment_name" {
  default = "nginx-deployment"
}

variable "app_label" {
  default = "nginx"
}

variable "replicas" {
  default = 2
}

variable "container_image" {
  default = "nginx:latest"
}

variable "container_name" {
  default = "nginx"
}

variable "container_port" {
  default = 80
}

variable "cpu_limit" {
  default = "0.5"
}

variable "memory_limit" {
  default = "512Mi"
}

variable "cpu_request" {
  default = "250m"
}

variable "memory_request" {
  default = "50Mi"
}

variable "logs_mount_path" {
  default = "/var/log/nginx"
}

variable "volume_name" {
  default = "nginx-logs"
}

variable "pvc_claim_name" {
  default = "nginx-volume"
}


variable "pv_name" {
  default = "nginx-volume"
}

variable "pv_capacity" {
  default = "2Gi"
}

variable "pv_access_modes" {
  default = ["ReadWriteMany"]
}

variable "pv_storage_class_name" {
  default = "local-path"
}

variable "pv_host_path" {
  default = "/mnt/data"
}

variable "pvc_name" {
  default = "nginx-volume"
}

variable "pvc_namespace" {
  default = "kubernetes_namespace.nginx_namespace.metadata[0].name"
}

variable "pvc_access_modes" {
  default = ["ReadWriteOnce"]
}

variable "pvc_storage_class_name" {
  default = "local-path"
}

variable "pvc_storage_request" {
  default = "1Gi"
}


variable "service_name" {
  default = "nginx-service"
}


variable "service_selector" {
  default = {
    app = "nginx"
  }
}

variable "service_port" {
  default = 8080
}

variable "service_target_port" {
  default = 80
}

