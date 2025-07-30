# NXLog Internal Service Deployment

This repository contains a GitOps-friendly Helm chart for deploying a minimal internal web service designed to run on Kubernetes.

✅ **Supports ARM64 (Graviton)**  
✅ **Secure-by-default deployments**  
✅ **Easy configuration for different environments (dev/prod)**  
✅ **Built-in HPA, anti-affinity, and best practices**  
✅ **GitOps-ready and Kustomize-compatible**

---

## 🌐 Web Application

The application is a Python Flask container that:

- Serves on **port 8080**
- Displays all environment variables in JSON format

Docker image:  
📦 [tigranham/nxlog-env-app:latest](https://hub.docker.com/r/tigranham/nxlog-env-app)

---

## 📦 Helm Chart: `internal-service`

This chart installs a secure, autoscaled, multi-pod deployment of the application with built-in support for:

- ARM64/Graviton compatibility
- 3 replicas by default
- Horizontal Pod Autoscaling (HPA)
- Pod anti-affinity
- Custom environment variables
- SecurityContext hardening

### Chart Location


---

## ⚙️ Configurable Values

These can be passed via `--set` or `values.yaml`.

| Key                          | Description                               | Example                                 |
|-----------------------------|-------------------------------------------|-----------------------------------------|
| `hub`                       | Docker registry user/org                  | `tigranham`                             |
| `image`                     | Docker image name                         | `nxlog-env-app`                         |
| `tag`                       | Docker image tag                          | `latest`                                |
| `prod`                      | Boolean for environment type              | `true` or `false`                       |
| `env`                       | Additional env vars (key-value map)       | `env.ENV=dev`                           |
| `resources`                 | CPU/memory requests and limits            | See below                               |
| `replicaCount`              | Number of pods in Deployment              | `3`                                     |
| `autoscaling.enabled`       | Enable HPA                                | `true`                                  |
| `autoscaling.minReplicas`   | Minimum pod replicas                      | `3`                                     |
| `autoscaling.maxReplicas`   | Maximum pod replicas                      | `10`                                    |
| `autoscaling.targetCPUUtilizationPercentage` | CPU target % for autoscaling | `70`                            |
| `affinity.podAntiAffinity.enabled` | Spread pods across nodes       | `true`                                  |
| `securityContext.*`         | Pod security settings                     | Best-practice defaults                  |


helm install internal-service-dev ./charts/internal-service \
  --set hub=tigranham,image=nxlog-env-app,tag=latest,prod=false
