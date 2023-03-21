provider "newrelic" {
  api_key = "SUA_API_KEY_AQUI"
}

resource "newrelic_alert_condition" "cpu_alert" {
  name = "CPU High"
  type = "apm_app_metric"
  policy_id = "${newrelic_alert_policy.default.id}"
  entities = ["${var.server_id}"]
  metric = "cpu_percentage"
  condition_scope = "application"
  comparison_operator = "above"
  threshold = 90
  enabled = true
}

resource "newrelic_alert_policy" "default" {
  name = "Default policy"
  incident_preference = "PER_CONDITION"
}

variable "server_id" {
  description = "The New Relic server ID"
}

