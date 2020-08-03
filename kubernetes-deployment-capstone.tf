resource "kubernetes_deployment" "si-deployment" {
  metadata {
    name = "capstone-deployment"
    labels = {
      App = "capstone"
    }
    namespace = kubernetes_namespace.n.metadata[0].name
  }

  spec {
    replicas                  = 4
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "capstone"
      }
    }
    template {
      metadata {
        labels = {
          App = "capstone"
        }
      }
      spec {
        container {
          image = "hsurti1605/capstone-repo:latest"
          name  = "capstone"

          port {
            container_port = 80
          }

          resources {
            limits {
              cpu    = "0.2"
              memory = "2562Mi"
            }
            requests {
              cpu    = "0.1"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
