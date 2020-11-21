#!/usr/bin/env bash

docker pull hashicorp/consul-k8s:0.20.0
kind load docker-image hashicorp/consul-k8s:0.20.0
docker pull consul:1.8.5
kind load docker-image consul:1.8.5
docker pull envoyproxy/envoy-alpine:v1.14.4
kind load docker-image envoyproxy/envoy-alpine:v1.14.4