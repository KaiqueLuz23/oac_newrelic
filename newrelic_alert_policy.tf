# Criar ou Gerenciar "políticas" de alerta 
resource "newrelic_alert_policy" "golden_signal_policy" {
  name = "Teste Kaique - ${data.newrelic_entity.app.name}"
}


