#Criar ou Gerenciar canais de notificação 
resource "newrelic_notification_channel" "team_email_channel" {
  name = "email-example"
  type = "EMAIL"
  # O destino a ser enviado
  destination_id = newrelic_notification_destination.team_email_destination.id
  product = "IINT" #fluxos de trabalho

  property {
    key = "subject"
    value = "Titulo do alerta  - Teste OaC "
  }
  property {
    key = "customDetailsEmail"
    value = "Olá isso é uma descrição feita em OaC"
  }
  
}


