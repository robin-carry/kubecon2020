# KubeCon2020 

## Abstract
List of all the sessions/learning which were interesting. Idea of this page is to create some content to be read through every Friday based on need and ask. 

## Prerequisite 

### Installing Kind

- Refer to [original documentation](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- Easy step for Mac users `brew install kind`

### Starting Kind

Clone this repo and run the command `./0-Prerequisite/start-kind.sh`. This is different from the regular approach of `kind create cluster`. The reason is we are adding two things:
- Annotation `ingress-ready=true`
- Exposing extra port like 80 and 443 for ingress-controller to allow connection. 

In the end, Ingress Controller locally will work as a NodePort to allow connections via the Ingress definition.

## 1. Local ingress-nginx with kind

Go to [ingress-with-kind](./ingress-with-kind) for more details

## 2. Local ELK (Elastic, Logstash and Kibana) 

TBD

## 3. Local Metrics with Kibana & Grafana

TBD

## 4. Walkthrough the Kubernetes UIs

TBD

## 5. The building blocks of DX: K8S Evolution from CLI to GitOps

TBD

## 6. A Flight over the cloud native landscape

TBD

## 7. Security Keynote

TBD

## 8. Other Miscellaneous Goodies

TBD

 