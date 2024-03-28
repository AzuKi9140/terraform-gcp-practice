resource "google_cloud_scheduler_job" "slack-notify-scheduler" {
  name        = "slack-notify-per-10-min"
  project     = var.project_id
  schedule    = "*/10 * * * *"
  description = "suggesting your morning/lunch/dinner"
  time_zone   = "Asia/Tokyo"

  pubsub_target {
    topic_name = google_pubsub_topic.slack_notify.id
    data       = base64encode("{\"mention\":\"channel\",\"channel\":\"random\"}")
  }
}