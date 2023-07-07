# Terraform Confluent & Open Policy Agent

Example of Terraform Confluent and Open Policy Agent integration.

**Install OPA**

[Open Policy Agent](https://www.openpolicyagent.org/)

```sh
brew install opa 
```

[Terraform & Opa](https://www.openpolicyagent.org/docs/latest/terraform/)

**Build Terraform Plan**

Generate Terragform plan in JSON:

```sh
terraform plan -var-file="sample-valid-topic.tfvars" --out planfile
```

```sh
terraform show -var-file="sample-valid-topic.tfvars" -json planfile > plan.json
```

**Policy** : `policy/terraform.rego`:

> Number of partitions for a Topic < 5.



## Evaluate Policy

**Valid Topic**:

tfvars (`sample-valid-topic.tfvars`):

```tfvars
topics = [
  {
    name       = "opa_testing"
    partitions = 3
    config = {
    "cleanup.policy"      = "delete"
    "compression.type"    = "producer"
    "delete.retention.ms" = "86400000"
    ...
    } 
  } 
]
```

```sh
opa eval data.terraform -d opa/policies/ -i plan.json -f pretty > opa.json
```

Output:

```json
{
  "result": [
    {
      "path": "plan.json",
      "result": []
    }
  ]
}
```

**Invalid Topic**:

tfvars (`sample-invalid-topic.tfvars`):

```tfvars
topics = [
  {
    name       = "opa_testing"
    partitions = 7
    config = {
    "cleanup.policy"      = "delete"
    "compression.type"    = "producer"
    "delete.retention.ms" = "86400000"
    ...
    } 
  } 
]
```

```sh
opa eval data.terraform -d opa/policies/ -i plan.json -f pretty > opa.json
```

Output:

```json
{
  "deny": [
    "Topic: opa_testing2 :: number of partitions 10 must be less than 5"
  ],
  "max_partitions": 5,
  "resource_types": [
    "confluent_kafka_topic"
  ]
}
```

## Running GitHub actions locally with Act

[Act](https://github.com/nektos/act)

```sh
brew install act
```

`act -s CCLOUD_API_KEY=<CLOUD_API_KEY>  -s CCLOUD_API_SECRET=<CLOUD_API_SECRET> pull_request`
 
