# Setting up Ingress Controller & Ingress locally

This simple demo will help you setup ingress controller and ingress locally in a kind cluster. The insipration of this demo was from the KubeCon2020 session - Migrating VM to K8S. 

Do check-out the last section talking about `why a custom ingress controller`

## Prerequisite

- Having basic understanding of what a container image is. 
- Having basic knowledge of K8S and it is objects like pod, service (node-port, load-balancer etc), ingress

## Deploying Ingress-Controller 

_**Issue with Docker Rate Limiting**: Due to the new changes since Nov'2, 2020, deploying of ingress can lead to failure of pods as the image couldn't be pull. Follow these steps to avoid such failure._ 

- Download the image by running `docker pull jettech/kube-webhook-certgen:v1.3.0`
- Upload the image to kind control plane by running `kind load docker-image jettech/kube-webhook-certgen:v1.3.0`

> Run the command to deploy ingress-controller `kubectl apply -f ./1-Ingress-Controller/nginx-ingress.yaml`

**Check if the pods are running correctly**

Run the command `kubectl get po -n ingress-nginx -w` -> the `-w` is to watch. `Ctrl+C` to break.

```
NAME                                        READY   STATUS              RESTARTS   AGE
ingress-nginx-admission-create-wj794        0/1     Completed           0          33s
ingress-nginx-admission-patch-mm82g         0/1     Completed           1          33s
ingress-nginx-controller-7f46bd7d86-c5ptf   0/1     ContainerCreating   0          33s
ingress-nginx-controller-7f46bd7d86-c5ptf   0/1     Running             0          39s
```

## Deploying Sample App

The App has a simple nginx docker image which expose an html page at port 80 (nothing fancy)

_**Issue with Docker Rate Limiting**: Same issue as above, so we need to upload the nginx image

- Download the image by running `docker pull nginx:1.19.4`
- Upload the image to kind control plane by running `kind load docker-image nginx:1.19.4`

Run the command `kubectl apply -f 2-Sample-App/.` to see the result as below

```
% kubectl get all
NAME                             READY   STATUS    RESTARTS   AGE
pod/ng-sample-68cc66d675-dtnwr   1/1     Running   0          2m32s

NAME                     TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/sample-service   ClusterIP   10.98.106.178   <none>        8080/TCP   82s

NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/ng-sample   1/1     1            1           2m32s

NAME                                   DESIRED   CURRENT   READY   AGE
replicaset.apps/ng-sample-68cc66d675   1         1         1       2m32s
```

## Deploying Ingress 

Run the simple command `kubectl apply 3-Ingress/ingress.yaml`

## Test the service is accessible

`curl http://localhost`

**Expected Output**

```
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

# Why a custom ingress controller

The reason why we have a custom ingress controller is because the actual ingress-nginx when installed from the github directly on mac would install it as Load Balancer, which didn't work on `kind`. For `minikube` you would require to install `addons` for ingress. 

Note this is all of a learning process of when what works locally and what not. There is no right/wrong option. Because the whole k8s world is a jungle of tech, it is better to keep trying new things even if the old things work perfectly. Eg: For me docker-desktop has been fine so far, but still learning to have `minikube` or `kind` as other options of cluster is good to know. 

## How to install actual ingress-nginx controller

- Use the [website](https://kubernetes.github.io/ingress-nginx/deploy/) to install it

**Note**: The `docker` limit issue would again come, at the time of writing this article, the installation command for ingress-nginx was using `jettech/kube-webhook-certgen:v1.5.0` of docker image. The best way to find out the right version:
- Run the command  given on the website `kubectl apply -f <raw-github-link>`
- `k get po -n ingress-nginx` > see the pods in failed state (create pod)
- `k describe pod -n ingress-nginx <pod-name>` > see the Events at the bottom with the right image name
- `docker pull <image-name>` > download the image to your local docker cache
- `kind load docker-image <image-name-from-events>` > load the image manually 

