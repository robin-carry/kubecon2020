# KubeCon2020 

## Abstract
List of all the sessions/learning which were interesting. Idea of this page is to create some content to be read through every Friday based on need and ask. 

## Why?

Even though there is an existing documentation of all the steps for the [first three topics](https://github.com/ishustava/kubecon-2020-workshop), the reason why I am documenting is because I have realized with k8s and all the tech, no matter how much one experienced it by listening, watching and other people doing, unless one tries the stuff, there is hardly any understanding of this concepts when it comes to practical use. 

And here is so much which gets cleared like why LoadBalancer vs NodePort, why something in k8s is used vs somewhere something else.   

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

Go to [ingress-with-kind](./1-ingress-with-kind) for more details

## 2. Local ELK (Elastic, Logstash and Kibana) 

Go to [logging-with-efk](./2-logging-with-ekf) for more details

## 3. Local Metrics with Prometheus & Grafana

Go to [the-metrics](./3-the-metrics) for more details

## 4. Consul Service Mesh

Go to [consul-service-mesh](./4-consul-service-mesh) for more details

## 5. Walkthrough the Kubernetes UIs

TBD

## 6. The building blocks of DX: K8S Evolution from CLI to GitOps

TBD

## 7. A Flight over the cloud native landscape

TBD

## 8. Security Keynote

TBD

## 9. Other Miscellaneous Goodies

TBD

 