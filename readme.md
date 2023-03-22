
# OaC - Terraform + NewRelic


## Oque nosso código faz ? 

O código é utilizado para criar recursos de observabilidade no New Relic, como *alertas*, *notificações* e um *dashboard personalizado*. Para isso, são utilizados arquivos de configuração no formato .tf, que contêm as definições dos recursos a serem criados.

O primeiro recurso criado é um alerta, que é configurado com base em determinadas condições, como o uso de recursos (CPU). Em seguida, é criado um canal de notificação, que pode ser usado para enviar as notificações de alerta por e-mail ou outros meios. Por fim, é criado um dashboard personalizado, que permite visualizar os dados e recursos da aplicação em tempo real como o uso da *CPU* e *RAM*.

Todas essas etapas são realizadas de forma automatizada pelo Terraform, o que permite uma fácil reprodução do ambiente de observabilidade em diferentes ambientes e configurações.


## Documentação dos arquivos ".tf"
### 1. Configuração do Terraform para o New Relic:
*main.tf*: Este arquivo é utilizado para configurar os parâmetros iniciais do Terraform para a criação dos recursos no New Relic.

### 2. Criação de condições de alerta e notificações via e-mail:
*provider.tf*: Este arquivo é utilizado para configurar a conexão do Terraform com a API do New Relic, através do fornecimento da chave de API e ID da conta.

*main.tf*: Este arquivo é utilizado para definir as condições de alerta e as configurações dos recursos do New Relic.

*newrelic_alert_policy.t*f: Este arquivo é utilizado para criar a política de alerta com as condições definidas.

*newrelic_notification_channel.tf*: Este arquivo é utilizado para criar o canal de notificação, que é usado para enviar as notificações por e-mail.

*newrelic_notification_destination.tf*: Este arquivo é utilizado para criar a lista de destinatários que receberão as notificações.

### 3. Criação de um dashboard
*newrelic_dashboard.tf*: Este arquivo é utilizado para criar um dashboard personalizado no New Relic. O dashboard é usado para visualizar e monitorar os dados e recursos da aplicação em tempo real.

## Referência

 - [Terraform - New Relic Provider](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs)
 - [Observability as Code - NewRelic](https://docs.newrelic.com/docs/new-relic-solutions/observability-maturity/operational-efficiency/observability-as-code-guide/)


![Logo](./img/%40kaiqueluz23.png)


