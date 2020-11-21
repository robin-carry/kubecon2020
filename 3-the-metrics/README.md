# Working with Metrics

This document explains how we go about collecting metrics using popular tools like Prometheus and Grafana. 

Understand that Prometheus is used for capturing events & generate alerts by recording real-time metrics. It is important to understand its architecture before using it

![Prometheus Architecture](https://prometheus.io/assets/architecture.png)

Do read the [overview](https://prometheus.io/docs/introduction/overview/) before going forward

## Prerequisite

### Install HELM

 Necessary to download & install the configuration. Helm is a package manager where using helm charts all details of k8s objects are package together.
 
 Simple way of installing on mac `brew install helm`; for all other options see [website](https://helm.sh/docs/helm/helm_install/)

### Docker limitation / Download images

 Provided a simple script `metrics-image-setup.sh` to run/execute necessary steps to download the images. **Note** - Make sure the `kind cluster` is up and running, otherwise loading of images wouldn't go through 
 
## Create namespace

`k create ns metrics`

## Deploy Prometheus 

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install prometheus prometheus-community/prometheus -n metrics --create-namespace
```

## Deploying Grafana

```
helm repo add grafana https://grafana.github.io/helm-charts
helm install grafana grafana/grafana -n metrics
```

Open another shell terminal and port-forward grafana `kubectl port-forward -n metrics svc/grafana 3000:80`

**To Logon**
- Execute the command to get password `kubectl get secret --namespace metrics grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`
- User the password from previous step and username `admin` to logon

**Connect Data Source**
- Once logged on, click on the `gear icon` in left menu and select `Data Source`
- `Prometheus` would be the first option under `Time series databases`. Select it and give the http endpoint as `http://prometheus-server` - click at `Test & save`

## PENDING

Understanding how the metrics work. Currently this expects applications to publish information in certain format. Running just the Prometheus app isn't sufficient. 

Tutorial 1 : [Understanding Grafana](https://grafana.com/tutorials/grafana-fundamentals/?#1)
