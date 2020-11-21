# Elastic, Kibana and Fluentd

## Prerequisite 

- Make sure the kind cluster is already up and running
- Your memory footprint configured is high (this is memory intensive activity)

## Docker limit issue / ImagePullBackOff

In case you don't see any POD starting (you can check with `kubectl describe <pod-name>`), you need to perform the following two operations (this applies to any where you see pod not starting)

1. Download the docker image manually - `docker pull <image-name>`
2. Upload to kind control pane - `kind load docker-image <image-name>`

This will avoid any challenges currently

## Create namespace

`kubectl create ns logging`

## Deploy Elastic Cloud for K8S

`kubectl apply -f https://download.elastic.co/downloads/eck/1.2.1/all-in-one.yaml`

## Deploy Elastic Operator

`kubectl apply -f elastic.yaml`

> There is memory related configuration change in `elastic.yaml`
> It would take some time for elastic cluster to show up healthy
> 
> Check the health using command `watch kubectl get elasticsearch -n logging` (PS: too some 3-4mins)

```
NAME      HEALTH   NODES   VERSION   PHASE   AGE
elastic   green    1       7.9.2     Ready   6m54s
```

## Deploy Kibana

`kubectl apply -f kibana.yaml`

It takes some time for `Kibana` to come up, so use the `watch kubectl get kibana -n logging` command to check till state is green

```
NAME     HEALTH   NODES   VERSION   AGE
kibana   green            7.9.2     118s
```

### Exposing kibana http service

`kubectl port-forward -n logging service/kibana-kb-http 5601`

### Fetching password for elastic user

`kubectl get secret -n logging elastic-es-elastic-user -o go-template='{{.data.elastic | base64decode}}'`

### Accessing Kibana

- Navigate to https://localhost:5601/ > **Note** As a custom certificate is used here, in browser you would have to accept to proceed
- Login using user `elastic` and password found using previous `kubectl get secret ...` command
- From the landing page click on the `hamburger icon` (top left > three parallel lines) & navigate to `Discover`
- **First launch** there wouldn't be any index created
- If you try to create index, it will say `Couldn't find any Elasticsearch data` because no `fluentd` or any other `log forwarder` is deployed yet. 

### Deploying fluentd

`kubectl apply -f fluentd.yaml`

..TBD -

... install fluentd 
... define index in kibana for elastic
... see system logs showing up
... deploy the sample-app from `ingress-with-kind` along 
... search log using `label` on pod (need to see if ingress controller is required or not) 