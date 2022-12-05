# Configure the Confluent Cloud Provider
terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.14.0"
    }
  }
  experiments = [module_variable_optional_attrs]
} 

 
