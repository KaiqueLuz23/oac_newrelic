# terraform config 

terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.17.1"
    }
  }
}

provider "newrelic" {
  #region = "US"   
  api_key = "SUA-API-KEY"
  account_id = "SUA-ACCOUNT-ID"
}
