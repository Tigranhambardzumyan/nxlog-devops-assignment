# NXLog Internal Service Deployment

This repository contains a Helm-based GitOps-friendly solution for deploying an internal service application. The project is designed to help development teams easily deploy containerized apps without deep Kubernetes expertise.

> ✅ **Optimized for ARM64 (Graviton)**  
> The Docker image is built for both `arm64` (Graviton) and `amd64` platforms to support cost-efficient, high-performance deployment on AWS.

---

## 📦 Project Structure

- **app/** – Minimal web service that prints environment variables on port `8080`
- **Dockerfile** – Builds the app image
- **charts/internal-service/** – Helm chart for deploying the app
- **gitops/** – Kustomize-based GitOps overlays (optional bonus)

---

## 🌐 Web Application

The application is a simple Python Flask app that:

- Serves on **port 8080**
- Displays all **environment variables** in JSON format

### Run Locally with Docker

```bash
docker buildx build --platform linux/arm64  -t nxlog-app:latest ./app
