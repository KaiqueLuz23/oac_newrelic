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
  api_key = "NRAK-####"
  account_id = "100###"
}