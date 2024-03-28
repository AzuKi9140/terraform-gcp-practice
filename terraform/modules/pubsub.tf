resource "google_pubsub_topic" "slack_notify" {
  name    = "slack-notify"
  project = var.project_id
}