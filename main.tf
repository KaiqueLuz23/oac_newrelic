resource "newrelic_alert_policy" "foo" {
  name = "foo"
}

resource "newrelic_alert_condition" "foo" {
  policy_id = newrelic_alert_policy.foo.id

  name        = "foo"
  type        = "apm_app_metric"
  entities     = [var.server_id]
  #entities    = ["${var.server_id}"]
  metric      = "apdex"

  condition_scope = "application"

  term {
    duration      = 5
    operator      = "below"
    priority      = "critical"
    threshold     = "0.75"
    time_function = "all"
  }
}


# entities     = ["${var.server_id}"]

variable "server_id" {
  type    = string
  default = "3613378"
  description = "The New Relic server ID"
}

