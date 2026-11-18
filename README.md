# gitops-web-bank--app

GitOps repository for the **Web Bank App**. It contains the Helm chart and ArgoCD
Applications used to deploy the app to Amazon EKS. Application source code and the
Jenkins pipeline live elsewhere.

## Structure

```
argocd/
  web-bank-app-application.yaml        # dev  -> namespace web-bank-app-dev  (auto-sync)
  web-bank-app-prod-application.yaml   # prod -> namespace web-bank-app-prod (manual sync)
web-bank-app/helm/
  Chart.yaml
  values.yaml                          # base values; Jenkins updates image.tag here
  overlays/dev/values-dev.yaml         # dev overrides
  overlays/prod/values-prod.yaml       # prod overrides
  templates/                           # Deployment, Service, Ingress (ALB), HPA, PDB,
                                       # ConfigMap, ServiceAccount (IRSA), SecretProviderClass
git-command.sh                         # helper: ./git-command.sh "commit message"
```

## Workflow

1. Jenkins builds the image and pushes it to ECR.
2. Jenkins updates `image.tag` in `web-bank-app/helm/values.yaml` and commits.
3. ArgoCD detects the commit and auto-syncs **dev**.
4. **Prod** is synced manually once dev looks good (`argocd app sync web-bank-app-prod`).

## Cluster prerequisites

- AWS Load Balancer Controller (provides the `alb` IngressClass)
- Secrets Store CSI driver + AWS provider, installed with `syncSecret.enabled=true`
- IAM role `web-bank-app-irsa` trusting the `web-bank-app-sa` ServiceAccount in each namespace
- Secret `web-bank-app-db-password` in AWS Secrets Manager (us-east-1)

## Bootstrapping

The ArgoCD Applications are applied once by hand:

```sh
kubectl apply -f argocd/
```
