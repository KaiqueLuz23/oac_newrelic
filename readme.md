ara criar um alerta para controle de CPU e enviar e-mails via Terraform no New Relic, você pode seguir estes passos:

Crie uma política de alerta no New Relic usando a API do New Relic. Você pode usar o seguinte código Terraform para criar uma política de alerta:
python
Copy code
resource "newrelic_alert_policy" "cpu_policy" {
  name          = "CPU Alert Policy"
  incident_preference = "PER_POLICY"
  policy_type   = "condition"
}
Isso criará uma nova política de alerta com o nome "CPU Alert Policy" e tipo de política "condition". A opção incident_preference define como os incidentes são agrupados, enquanto PER_POLICY agrupa incidentes por política.

Adicione uma condição de alerta à política criada no passo 1, para que a política de alerta possa detectar e alertar quando a CPU atingir um limite específico. Você pode usar o seguinte código Terraform para adicionar uma condição à política de alerta:
python
Copy code
resource "newrelic_alert_condition_cpu" "cpu_condition" {
  policy_id     = newrelic_alert_policy.cpu_policy.id
  name          = "CPU Alert Condition"
  time_function = "all"
  comparison    = "above"
  threshold     = 80
}
Este código adiciona uma nova condição de alerta à política de alerta criada no passo 1. A condição verifica a utilização da CPU em todos os servidores em um dado grupo de servidores e alerta quando a utilização da CPU fica acima de 80%.

Adicione uma ação de notificação para a política de alerta para que o New Relic possa enviar um e-mail sempre que a condição de alerta for acionada. Você pode usar o seguinte código Terraform para adicionar uma ação de notificação à política de alerta:
python
Copy code
resource "newrelic_alert_policy_channel" "email_channel" {
  policy_id       = newrelic_alert_policy.cpu_policy.id
  name            = "Email Alert Channel"
  type            = "email"
  configuration   = {
    recipients = "seu-email@seu-dominio.com"
  }
}
Este código adiciona um novo canal de notificação à política de alerta criada no passo 1. O canal de notificação é um e-mail e envia uma notificação para "seu-email@seu-dominio.com" sempre que a condição de alerta é acionada.

Associe a condição de alerta criada no passo 2 ao canal de notificação criado no passo 3, para que as notificações por e-mail sejam enviadas sempre que a condição de alerta for acionada. Você pode usar o seguinte código Terraform para associar a condição de alerta e o canal de notificação:
java
Copy code
resource "newrelic_alert_policy_channel_condition" "email_channel_condition" {
  policy_id             = newrelic_alert_policy.cpu_policy.id
  channel_id            = newrelic_alert_policy_channel.email_channel.id
  alert_condition_id    = newrelic_alert_condition_cpu.cpu_condition.id
  runbook_url           = "https://www.example.com/runbook"
  enabled               = true
}
Este código associa a condição de alerta criada no passo 2 e o canal de notificação criado no passo 3 à política de alerta criada no passo 1.