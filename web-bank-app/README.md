# web-bank-app Helm chart

See the [repository README](../README.md) for the overall GitOps workflow.

## Key values

| Value | Default | Notes |
|---|---|---|
| `image.tag` | set by Jenkins | Overlays inherit it |
| `nodeEnv` | `production` | `development` in dev |
| `autoscaling.enabled` | `true` | When on, the HPA owns the replica count |
| `autoscaling.minReplicas` / `maxReplicas` | `2` / `10` | dev `1`/`3`, prod `3`/`10` |
| `replicaCount` | `2` | Only used when autoscaling is off |
| `service.type` | `ClusterIP` | Traffic enters via the ALB Ingress |
| `probes.path` | `/` | Readiness and liveness HTTP path |

## Render locally

```sh
helm template web-bank-app web-bank-app/helm -f web-bank-app/helm/overlays/dev/values-dev.yaml
```
