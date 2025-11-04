![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: network-helper](https://img.shields.io/badge/Type-network--helper-informational?style=flat-square)
# External Services 🌐

A Helm chart for easily deploying external services with ingress and TLS termination in private Kubernetes networks.

This chart is designed for environments where all external traffic routes through a single Ingress endpoint, enabling you to expose internal network services and virtual machines directly through Kubernetes without provisioning separate load balancer instances.

## Features

- 🔐 **TLS Ready**: Automatic certificate generation or bring your own
- ⚙️ **Configurable**: Flexible ingress and service settings
- 🚀 **Simple**: Minimal configuration for quick deployments
- 🔁 **Protocol Support**: HTTPS backend protocols and custom annotations

## Quick Start

To quickly install with minimal configuration:

```bash
# Add repo to the Helm.
helm repo add homelab-charts https://acidsugarx.github.io/helm-open

# Set values with cli
helm install --namespace service --create-namespace my-external-service homelab-charts/external-services \
  --set externalServices.minimal-example.enabled=true \
  --set externalServices.minimal-example.externalName=example.com \
  --set externalServices.minimal-example.domain="example.local"
```

Or create a minimal values file:

```yaml
externalServices:
  minimal-example:
    enabled: true
    externalName: example.com
    domain: "example.local"
```

Then install:

```bash
helm upgrade --namespace service --create-namespace my-external-service homelab-charts/external-services -f values.yaml 
```

## Configuration

### Global Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `namespace` | Default namespace for services | `service` |
| `defaultSettings.ingress.annotations` | Global ingress annotations | `{cert-manager.io/cluster-issuer: "letsencrypt"}` |
| `defaultSettings.ingress.ingressClassName` | Global ingress class name | `nginx` |
| `defaultSettings.ingress.tlsEnabled` | Enable TLS globally | `true` |
| `defaultSettings.ingress.useExistingCert` | Use existing certificate globally | `false` |
| `defaultSettings.ports` | Default port configuration | `[{port: 443, targetPort: 80, protocol: TCP, name: https}]` |
| `defaultSettings.annotations` | Default annotations for services | `{}` |
| `defaultSettings.backendProtocol` | Default backend protocol | `""` |

### Service Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `externalServices.[name].enabled` | Enable the service | `true` |
| `externalServices.[name].namespace` | Namespace for the service | `service` |
| `externalServices.[name].externalName` | External name for the service | `""` |
| `externalServices.[name].domain` | Domain for the ingress rule | `""` |
| `externalServices.[name].annotations` | Service annotations | `{}` |
| `externalServices.[name].ports` | Port configuration | `[{port: 443, targetPort: 80, name: https}]` |
| `externalServices.[name].ingress.enabled` | Enable ingress for this service | `true` |
| `externalServices.[name].ingress.annotations` | Ingress annotations | Global default |
| `externalServices.[name].ingress.ingressClassName` | Ingress class name | Global default |
| `externalServices.[name].ingress.tlsEnabled` | Enable TLS for this service | Global default |
| `externalServices.[name].ingress.useExistingCert` | Use existing certificate | Global default |
| `externalServices.[name].ingress.backendProtocol` | Backend protocol for ingress | Global default |
| `externalServices.[name].ingress.rules` | Custom ingress rules | Auto-generated from domain |

### Service Definition

```yaml
externalServices:
  my-service:
    enabled: true
    namespace: service
    externalName: service.example.com
    domain: "service.example.com"
    ingress:
      tlsEnabled: true
      useExistingCert: false  # Set to secret name for existing cert
```

## Use Cases

- **Private Network Traffic**: Route external services through Kubernetes
- **TLS Termination**: Secure internal traffic with certificates
- **Service Abstraction**: Hide complex external service details

## Examples

### Simple Service
```yaml
externalServices:
  simple-service:
    enabled: true
    externalName: internal.service.com
    domain: "simple.example.com"
```

### With Custom TLS
```yaml
externalServices:
  secure-service:
    enabled: true
    externalName: secure.internal.com
    domain: "secure.example.com"
    ingress:
      tlsEnabled: true
      useExistingCert: "my-cert-secret"
```

---
*Part of the [Homelab Helm Charts](../../README.md) collection.*
