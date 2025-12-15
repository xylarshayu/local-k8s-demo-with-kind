# Local K8s Ingress demo with Kind

## Intro

Practice repository to learn basic kubernetes with:
- Namespaces
- Services
- Ingress routing (Nginx controller)
- Helm charts to deploy to different environments with different namespaces

## What it does

1. Spin up a kubernetes cluster with kind (kubernetes in docker locally)
2. Creates a namespace based on the environment we want to deploy to
3. Make a simple http-echo server app that returns a simple message, in the namespace we made
4. Creates a service for the app with port mappings between ingress and the server we made
5. Configures an ingress controller (Nginx) to route traffic to the service we made

Allow the URL to be hit by editing /etc/hosts to point to 127.0.0.1

## Commands

```bash
make up
make deploy-all
make info ENV=dev
make info ENV=qa
make down
```

## Diagram

![Diagram](flow.excalidraw.svg)