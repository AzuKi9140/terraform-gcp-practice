resource "google_storage_bucket" "slack_functions_bucket" {
  name          = "${var.project_id}-scheduler-bucket"
  project       = var.project_id
  location      = "asia"
  force_destroy = true
}

resource "google_storage_bucket_object" "functions_zip" {
  name   = "functions.zip"
  bucket = google_storage_bucket.slack_functions_bucket.name
  source = "${path.module}/../../files/functions.zip"
}