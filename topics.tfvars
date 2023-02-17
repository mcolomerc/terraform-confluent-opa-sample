# export TF_VAR_confluent_cloud_api_key="<CCLOUD_API_KEY>" 
# export TF_VAR_confluent_cloud_api_secret="<CCLOUD_API_SECRET>"

confluent_cloud_api_key="<CCLOUD_API_KEY>" 
confluent_cloud_api_secret="<CCLOUD_API_SECRET>"
 
environment = "<ENVIRONMENT_ID>"

cluster = "<CLUSTER_ID"

rbac_enabled = false 

serv_account = {
      name = "<SERVICE_ACCOUNT>"
      role = "CloudClusterAdmin"
}


topics = [
  {
   name       = "opa_testing"
   partitions = 3  
   config = {
     "cleanup.policy"                          = "delete"
     "compression.type"                        = "producer"
     "delete.retention.ms"                     = "86400000" 
   }
  } 
]# end topics
