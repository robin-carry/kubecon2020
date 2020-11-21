#!/usr/bin/env bash

docker pull jimmidyson/configmap-reload:v0.4.0
kind load docker-image jimmidyson/configmap-reload:v0.4.0
docker pull prom/alertmanager:v0.21.0
kind load docker-image prom/alertmanager:v0.21.0
docker pull quay.io/coreos/kube-state-metrics:v1.9.7
kind load docker-image quay.io/coreos/kube-state-metrics:v1.9.7