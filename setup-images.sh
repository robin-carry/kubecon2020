#!/usr/bin/env bash

docker pull nginx:1.19.4
kind load docker-image nginx:1.19.4
./3-the-metrics/metrics-image-setup.sh
./4-consule-service-mesh/consule-image-setup.sh
