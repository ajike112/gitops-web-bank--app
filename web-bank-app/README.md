# GitOps Repository — web-bank-app

This repository contains Kubernetes manifests and Helm charts for deploying the **Web Bank App** to EKS via ArgoCD.

## Structure
- `argocd/` — ArgoCD Application manifest
- `helm/` — Helm chart and templates
- `overlays/` — Environment-specific overrides

## Workflow
1. Jenkins builds and pushes image to ECR.
2. Jenkins updates `values.yaml` with the new image tag.
3. ArgoCD detects the commit and syncs automatically.
4. EKS runs the new version of the app.
