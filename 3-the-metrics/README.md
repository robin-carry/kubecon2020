# Working with Metrics

This document explains how we go about collecting metrics using popular tools like Prometheus and Grafana. 

Understand that Prometheus is used for capturing events & generate alerts by recording real-time metrics. It is important to understand its architecture before using it

![Prometheus Architecture](https://prometheus.io/assets/architecture.png)

Do read the [overview](https://prometheus.io/docs/introduction/overview/) before going forward

## Prerequisite

Install `HELM` which is necessary to download & install the configuration. Helm is a package manager where using helm charts all details of k8s objects are package together.
 
 Simple way of installing on mac `brew install helm`; for all other options see [website](https://helm.sh/docs/helm/helm_install/)
 
## Create namespace

`k create ns metrics`

## Deploy Prometheus 

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install prometheus prometheus-community/prometheus -n metrics --create-namespace
```
