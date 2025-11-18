# Argo Helper
![Version: 0.1.9](https://img.shields.io/badge/Version-0.1.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.2.0](https://img.shields.io/badge/AppVersion-3.2.0-informational?style=flat-square)

Argo helper is a helm chart, thats helps a manage argo-cd resources: applications, repositories, application-sets, repository-credentials

**ArgoCD page**: <https://argoproj.github.io/cd/>

## Source Code

**Helm chart:**
* <https://github.com/acidsugarx/helm-open/tree/main/charts/argo-helper>

**ArgoCD itself:**
- <https://github.com/argoproj/argo-cd>

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+
- ArgoCD

## Install
Before install view example values:
- <>
And make your own values.

```bash
# add the repo
helm repo add acid-helm https://acidsugarx.github.io/helm-open

# install the chart
helm install argo-helper acid-helm/argo-helper -f my-values.yaml
```

## Contributing

We welcome contributions to this Helm chart. Please see the [GitHub repository](https://github.com/acidsugarx/helm-open) for more information.

---
*Part of the [Homelab Helm Charts](../../README.md) collection.*
