
# OaC - Terraform + NewRelic


## Oque nosso codigo faz ? 

Cria 

## Documentação dos arquivos ".tf"

### 1 - Config Terraforms em NewRelic:
main.tf = Usei para setar alguns parametros 
### 2 - Criar uma Condições de alerta e notificações via e-mail. 
provider.tf = Configurando o terraforms e setando o api_key" e "account_id" 
main.tf = Usei para setar alguns parametros 
newrelic_alert_policy.tf = Para criar a politica
newrelic_notification_channel.tf = Para criar o canal de notificação
newrelic_notification_destination.tf = Para criar a lista a qual vai receber as notificações 
### 3 - Criar um Dashboard. 
newrelic_dashboard.tf = Criando um dashboard


## Referência

 - [Terraform - New Relic Provider](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs)
 - [Observability as Code - NewRelic](https://docs.newrelic.com/docs/new-relic-solutions/observability-maturity/operational-efficiency/observability-as-code-guide/)


![Logo](./img/%40kaiqueluz23.png)


