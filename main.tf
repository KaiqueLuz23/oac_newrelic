# Use esta "newrelic_entity" para obter informações sobre uma entidade específica :D 

data "newrelic_entity" "app" {
  name = "pop-os" # Deve corresponder exatamente ao nome do seu aplicativo no New Relic
  domain = "INFRA" # Ex: BROWSER, APM, MOBILE, SYNTH e etc
  type = "HOST" # "APPLICATION" e etc
}



# Criar ou Gerenciar "condições" de alerta de infraestrutura (Alto uso da CPU).
resource "newrelic_infra_alert_condition" "high_cpu" {
  policy_id   = newrelic_alert_policy.golden_signal_policy.id
  name        = "Alto uso da CPU"
  type        = "infra_metric"            # O tipo de alerta de infraestrutura.
  event       = "SystemSample"            # O evento métrico | Ou StorageSample
  select      = "cpuPercent"              # O atributo para identificar a métrica 
  comparison  = "above"                   # O operador usado para avaliar o valor limite
  where       = "(hostname LIKE '%pop%')" # identifica quaisquer filtros de host de infraestrutura

  # Criticidade
  critical {
    duration      = 1         # minutos
    value         = 5         # operador
    time_function = "any"     # all ou any
  }
}



#####################################################################################################

# Criar e Gerenciar os  "fluxos de trabalho" 

resource "newrelic_workflow" "foo" {
  name = "workflow-example"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"
  issues_filter {
    name = "filter-name"
    type = "FILTER"
    # É um condição que um evento de problema deve satisfazer para ser processado pelo fluxo de trabalho
    predicate {
      attribute = "labels.policyIds" # Eu falo que é uma lista de IDs de políticas de alerta
      operator = "EXACTLY_MATCHES"   # verifica se o array contém um dos itens fornecidos
      values = [ newrelic_alert_policy.golden_signal_policy.id ] # é o atributo
    }

  }
  # Definindo o provedor de notificação
  destination {
    channel_id = newrelic_notification_channel.team_email_channel.id
  }
}