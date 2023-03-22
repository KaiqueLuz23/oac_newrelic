resource "newrelic_one_dashboard" "multi_page_dashboard" {
  name = "Meu Dashboard - OaC"

  # Ex: private, public_read_only ou public_read_write
  permissions = "public_read_only"

  page {
    name = "Minha CPU"

    widget_bar {
      title = "CPU"
      row    = 1
      column = 1
      # Configurando uma consulta NRQL
      nrql_query {
        query      = "SELECT average(cpuPercent) FROM SystemSample WHERE hostname = '${data.newrelic_entity.app.name}'"
      }

 
    }
  }

  page {
    name = "Minha Memoria"

    widget_bar {
      title = "RAM"
      row    = 1
      column = 1

      nrql_query {
        query      = "SELECT average(memoryUsedBytes/memoryTotalBytes*100) FROM SystemSample WHERE hostname = '${data.newrelic_entity.app.name}'"
      }

    }
  }
}
