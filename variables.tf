# Confluent Cloud Credentials  
variable "confluent_cloud_api_key" {
  type = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type = string
   description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

variable "kafka_api_key" {
  type = string
  description = "Kafka API KEY. export TF_VAR_"
}

variable "kafka_api_secret" {
  type = string
   description = "Kafka API SECRET. export TF_VAR_"
}

# Confluent cloud environment id  
variable "environment" {
  type = string
   description = "Confluent Cloud Environment ID"
}

# Confluent cloud cluster id  
variable "cluster" {
  type = string
  description = "Confluent Cloud Cluster ID"
}

# RBAC enabled */
variable "rbac_enabled" {
  description = "Enable RBAC. If true producer/consumer will be used to configure Role Bindings for the Topic"
  type = bool
  default = false
}

# Topic definition list 
variable "topics" {
  type = list(object({
    name = string
    partitions = number
    config =  map(string)
    consumer = optional(string)
    producer = optional(string)
  }))
  description = "List of Topics. If RBAC enabled producer service account will be configured as DeveloperWrite and consumer will be configured as DeveloperRead."
}

# Confluent Cloud Service Account  
variable "serv_account" {
  description = "Service Account and Role for cluster management."
  type = object({
      name = string
      role = string
    }) 
}

