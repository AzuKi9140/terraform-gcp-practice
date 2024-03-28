variable "credential" {
  description = "The path to the service account key file"
  type        = string
}

variable "project_id" {
  description = "The project ID for the current workspace"
  type        = string
}

variable "webhook" {
  description = "Webhook URL for Slack notifications"
  type        = map(string)
}