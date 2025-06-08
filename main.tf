module "topics" {
    source = "github.com/mcolomerc/terraform-confluent-topics" 
    environment = var.environment
    cluster = var.cluster
    rbac_enabled = var.rbac_enabled 
    topics = var.topics
    cluster_credentials = {
        api_key=var.kafka_api_key
        api_secret=var.kafka_api_secret
    }
}
