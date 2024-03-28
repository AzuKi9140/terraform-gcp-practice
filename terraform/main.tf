provider "google" {
  credentials = file(var.credential)
  project     = var.project_id
  region      = "asia-northeast1"
}

module "slack_notify" {
  source = "./modules"
  project_id = var.project_id
  credential = var.credential
  webhook = var.webhook
}

