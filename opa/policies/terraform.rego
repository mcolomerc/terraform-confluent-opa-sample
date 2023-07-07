package terraform

import input as tfplan

########################
# Parameters for Policy
########################
 
# Consider exactly these resource types in calculations
resource_types := {"confluent_kafka_topic"}

max_partitions := 5 

#########
# Policy
#########
  
deny[msg] {
	type := input.resource_changes[r].type
	resource_types[type] 
	is_create_or_update(input.resource_changes[r].change.actions)
    numPartitions := input.resource_changes[r].change.after.partitions_count
    topicName := input.resource_changes[r].change.after.topic_name
	numPartitions > max_partitions
    msg := sprintf("Topic: %v :: number of partitions %v must be less than %v", [topicName, numPartitions, max_partitions] )
}

is_create_or_update(actions) {
	actions[_] == "create"
}

is_create_or_update(actions) {
	actions[_] == "update"
}

 
 
 