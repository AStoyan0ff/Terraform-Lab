terraform {
  required_version = ">= 1.17.0, < 2.0.0"
  
  required_providers {
    docker = { source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"

}

resource "docker_image" "nginx" {
  name = "nginxdemos/hello"
}

resource "docker_container" "AStoyanoff" {
  name  = "nginx_hello"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8000 // 5000
  }
}

