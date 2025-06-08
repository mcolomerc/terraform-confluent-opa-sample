package terraform

import input as tfplan

resource_types := {"confluent_kafka_topic"}
max_partitions := 5 

deny[msg] {
  type := tfplan.resource_changes[r].type
  resource_types[type] 
  is_create_or_update(tfplan.resource_changes[r].change.actions)
  numPartitions := tfplan.resource_changes[r].change.after.partitions_count
  topicName := tfplan.resource_changes[r].change.after.topic_name
  numPartitions > max_partitions
  msg := sprintf("Topic: %v :: number of partitions %v must be less than %v", [topicName, numPartitions, max_partitions] )
}

is_create_or_update(actions) {
  actions[_] == "create"
}

is_create_or_update(actions) {
  actions[_] == "update"
}
