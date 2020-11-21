#!/usr/bin/env bash

docker pull nginx:1.19.4
kind load docker-image nginx:1.19.4
docker pull jettech/kube-webhook-certgen:v1.3.0
kind load docker-image jettech/kube-webhook-certgen:v1.3.0
./3-the-metrics/metrics-image-setup.sh
./4-consul-service-mesh/consul-image-setup.sh
