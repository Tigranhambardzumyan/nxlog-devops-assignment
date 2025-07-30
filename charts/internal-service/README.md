# NXLog Internal Service Deployment

This repository contains a GitOps-friendly Helm chart for deploying a minimal internal web service designed to run on Kubernetes.

✅ **Supports ARM64 (Graviton)**  
✅ **Secure-by-default deployments**  
✅ **Easy configuration for different environments (dev/prod)**  
✅ **Built for GitOps workflows**

---

## 🌐 Web Application

The application is a Python Flask container that:

- Serves on **port 8080**
- Displays all environment variables in JSON format

Docker image:  
📦 [tigranham/nxlog-env-app:latest](https://hub.docker.com/r/tigranham/nxlog-env-app)

---

## 📦 Helm Chart: `internal-service`

This chart installs a secure, autoscaled deployment of the application with built-in support for:

- ARM64 architecture (Graviton)
- Horizontal Pod Autoscaling (via template)
- Pod anti-affinity
- Custom environment variables
- Secure `securityContext` defaults

### Chart Location

helm install internal-service-dev ./charts/internal-service \
  --set hub=tigranham,image=nxlog-env-app,tag=latest,prod=false
