# drone-datadog
Drone IO plugin for Datadog metrics

### Usage in Drone

```
kind: pipeline
name: default

steps:
- name: datadog
  image: jimpou/drone-datadog
  settings:
    api_key: 
    type: gauge
    value: 1
    metric_name: drone.metric
    tags: [ tag1:value1, tag2:value2 ]
```

### Usage in Drone with secrets

```
kind: pipeline
name: default

steps:
- name: datadog
  image: jimpou/drone-datadog
  settings:
    api_key: 
      from_secret: datadog_api_key
    type: gauge
    value: 1
    metric_name: drone.metric
    tags: [ tag1:value1, tag2:value2 ]

---
kind: secret
name: datadog_api_key
get:
  path: shared/data/all/datadog/datadog-api-key
  name: datadog-api-key
```