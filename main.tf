module "topics" {
    source = "github.com/mcolomerc/terraform-confluent-topics"
    confluent_cloud_api_key = var.confluent_cloud_api_key
    confluent_cloud_api_secret = var.confluent_cloud_api_secret
    environment = var.environment
    cluster = var.cluster
    rbac_enabled = var.rbac_enabled
    serv_account = var.serv_account
    topics = var.topics
    cluster_credentials = {
        api_key=var.kafka_api_key
        api_secret=var.kafka_api_secret
    }
}
