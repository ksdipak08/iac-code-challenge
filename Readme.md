# Nginx Kubernetes Deployment

This repository contains the necessary files to deploy an Nginx web server using Kubernetes.

## Docker Image

The deployment uses the official `nginx:latest` Docker image as the base image.

## Configuration

The Nginx configuration file `nginx.conf` is copied to the container's `/etc/nginx/nginx.conf` path.

## Kubernetes Resources

The deployment consists of the following Kubernetes resources:

### Namespace

- `kubernetes_namespace` "nginx_namespace"

Creates a namespace with the name specified in the variable `var.namespace_name`.

### Deployment

- `kubernetes_deployment` "nginx"

- It creates PV and PVC along with Service as well

Deploys the Nginx container with the configuration specified in the variables.

- Variables used:
  - `var.deployment_name`: Name of the deployment.
  - `var.app_label`: App label used for selector and labels.
  - `var.replicas`: Number of replicas for the deployment.
  - `var.container_image`: Docker image used for the Nginx container.
  - `var.container_name`: Name of the Nginx container.
  - `var.container_port`: Port on which the Nginx container listens.
  - `var.cpu_limit`: CPU limit for the Nginx container.
  - `var.memory_limit`: Memory limit for the Nginx container.
  - `var.cpu_request`: CPU request for the Nginx container.
  - `var.memory_request`: Memory request for the Nginx container.
  - `var.volume_name`: Name of the persistent volume for the Nginx logs.
  - `var.logs_mount_path`: Mount path for Nginx logs.

### Persistent Volume Claim (PVC)

- `kubernetes_persistent_volume_claim` "nginx-volume"

Creates a persistent volume claim for the Nginx logs.

- Variables used:
  - `var.pvc_claim_name`: Name of the PVC.
  - `var.pvc_storage_request`: Storage size requested for the PVC.

## How to Use

To deploy the Nginx web server using this configuration, make sure you have Terraform installed and configured to access your Kubernetes cluster.

1. Clone this repository to your local machine.

2. Set the required variables in a `variables.tf` file, like this:

```hcl
namespace_name     = "my-nginx-namespace"
deployment_name    = "nginx-deployment"
app_label          = "nginx-app"
replicas           = 2
container_image    = "nginx:latest"
container_name     = "nginx-container"
container_port     = 80
cpu_limit          = "0.5"
memory_limit       = "512Mi"
cpu_request        = "250m"
memory_request     = "50Mi"
volume_name        = "nginx-volume"
logs_mount_path    = "/var/log/nginx"
pvc_claim_name     = "nginx-pvc"
pvc_storage_request = "2Gi"
```

3. Run the following commands:

```bash
terraform fmt . 
terraform init
terraform plan
terraform apply
```

This will create the Nginx deployment in the specified namespace with the provided configurations.

4. To clean up and delete the resources, run:

```bash
terraform destroy
```

Please note that Terraform will delete all the resources defined in the configuration, including the namespace, deployment, and persistent volume claim.

That's it! You now have a Kubernetes deployment running Nginx with logs stored in a persistent volume.
