# Criar ou Gerenciar canais de notificação 
resource "newrelic_notification_destination" "team_email_destination" {
  name = "email-example"
  type = "EMAIL"

  property {
    key = "email"
    value = "kaique.luz@123milhas.com.br"
  }
}