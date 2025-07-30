# Internal Service – Helm-based Dev Deployment

This repository contains a secure, GitOps-friendly Helm chart for deploying an internal service that prints all environment variables as JSON on port `8080`.

> ✅ Focus: **Development environment only**  
> ❌ No production deployment logic included

---

## 📦 Features

- Helm chart with secure-by-default best practices
- Environment-specific variable injection (`PROD=false`)
- Horizontal Pod Autoscaler
- Pod Anti-Affinity rules
- Full GitOps flow using Helm + Kustomize
- Simple Dockerized web app

---

## 🚀 1. Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/)
- [Kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/)
- [kind](https://kind.sigs.k8s.io/) (for running Kubernetes locally)

---

## 🧪 2. Run Locally Using kind

```bash
# Create a local dev cluster
kind create cluster --name dev-cluster

# Set current context to kind
kubectl cluster-info --context kind-dev-cluster
```

---

## 🐳 3. Build and Push Docker Image

```bash
# Inside ./app/
docker build -t tigranham/nxlog-env-app:latest .

# Push to Docker Hub (must be public)
docker push tigranham/nxlog-env-app:latest
```

---

## 📁 4. Helm Chart Location

Chart path:
```
Charts/internal-service/
```

Default config file (dev-only):
```
Charts/internal-service/values.yaml
```

---

## 🛠️ 5. Render Helm Manifests for GitOps

```bash
helm template internal-service ./Charts/internal-service \
  --namespace internal-service \
  --values Charts/internal-service/values.yaml > gitops/base/rendered.yaml
```

---

## 🔁 6. Apply via Kustomize (Dev Only)

```bash
kubectl apply -k gitops/overlay/
```

You should see:

```
service/internal-service-internal-service created
deployment.apps/internal-service-internal-service created
horizontalpodautoscaler.autoscaling/internal-service-internal-service created
```

---

## 🌐 7. Verify the App

```bash
kubectl port-forward svc/internal-service-internal-service 8080:8080
```

Then open:
```
http://localhost:8080
```

You should see all environment variables printed as JSON.

---

## 🧱 Folder Structure (Dev-Only)

```
.
├── app/                     # Web app that prints envs
├── Charts/
│   └── internal-service/
│       ├── Chart.yaml
│       ├── values.yaml      # dev config only
│       └── templates/
├── gitops/
│   ├── base/
│   │   ├── kustomization.yaml
│   │   └── rendered.yaml    # output from helm template
│   └── overlay/
│       ├── kustomization.yaml
│       └── patch-env.yaml   # injects PROD=false
```

---

## ✅ Dev Only. No Production.

This project is designed to support the development environment exclusively.  
There are **no production overlays, configs, or logic**.

---
