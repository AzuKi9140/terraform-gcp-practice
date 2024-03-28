data "archive_file" "function_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../../src"
  output_path = "${path.module}/../../files/functions.zip"
}

resource "google_cloudfunctions_function" "slack_notification" {
  name        = "SlackNotification"
  project     = var.project_id
  region      = "asia-northeast1"
  runtime     = "go121"
  entry_point = "SlackNotification"

  source_archive_bucket = google_storage_bucket.slack_functions_bucket.name
  source_archive_object = google_storage_bucket_object.functions_zip.name

  environment_variables = {
    SLACK_WEBHOOK_URL = var.webhook["url"]
  }

  event_trigger {
    event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
    resource   = google_pubsub_topic.slack_notify.name
  }
}