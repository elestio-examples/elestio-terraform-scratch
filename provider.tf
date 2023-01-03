terraform {
  required_providers {
    elestio = {
      source  = "elestio/elestio"
      version = "0.3.0" # check out the latest version available
    }
  }
}

provider "elestio" {
  email     = var.elestio_email
  api_token = var.elestio_api_token
}
