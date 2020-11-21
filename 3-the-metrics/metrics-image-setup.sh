#!/usr/bin/env bash

docker pull jimmidyson/configmap-reload:v0.4.0
kind load docker-image jimmidyson/configmap-reload:v0.4.0
docker pull prom/alertmanager:v0.21.0
kind load docker-image prom/alertmanager:v0.21.0
docker pull quay.io/coreos/kube-state-metrics:v1.9.7
kind load docker-image quay.io/coreos/kube-state-metrics:v1.9.7
docker pull prom/node-exporter:v1.0.1
kind load docker-image prom/node-exporter:v1.0.1
docker pull prom/pushgateway:v1.2.0
kind load docker-image prom/pushgateway:v1.2.0
docker pull prom/prometheus:v2.21.0
kind load docker-image prom/prometheus:v2.21.0
docker pull grafana/grafana:7.3.3
kind load docker-image grafana/grafana:7.3.3