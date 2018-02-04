Tweeter
====

[![build status](https://gitlab.com/aisrael/tweeter/badges/develop/build.svg)](https://gitlab.com/aisrael/tweeter/commits/develop)

[![coverage report](https://gitlab.com/aisrael/tweeter/badges/develop/coverage.svg)](https://gitlab.com/aisrael/tweeter/commits/develop)

Rails demo app for Kubernetes.

## Prerequisites

The easiest way to get and play with Kubernetes on your developer workstation is using [minikube](https://github.com/kubernetes/minikube).

Alternatively, sign up for and used Google Cloud Platform and spin up a [Google Container Engine](https://cloud.google.com/container-engine) cluster.

### Install Helm

```bash
helm init
```

## Deployment

Create the `tweeter` namespace

```
kubectl create namespace tweeter
kubectl config set-context $(kubectl config current-context) --namespace tweeter
```

### Services

#### Deploy MongoDB

Using Helm

```bash
helm install --namespace tweeter --name tweeter-mongodb stable/mongodb
```

#### Deploy Redis

Using Helm

```bash
helm install --namespace tweeter --name tweeter-redis \
--set redisPassword=secretpassword stable/redis
```

Verify that the services are running

```
kubectl get services -w
```

## Tweeter

#### Create Tweeter secrets

```bash
kubectl create -f tweeter-secrets.yaml
```

#### Deploy Tweeter front-end

```bash
kubectl create -f tweeter.yaml
```

Wait for the pods to be `Running`

```bash
kubectl get pods -w
```

##### Connect to the Tweeter front end

```bash
kubectl get services
```

Take note of the `tweeter` port, then visit `$(minikube ip)`:port.
