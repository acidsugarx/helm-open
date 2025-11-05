# docmost

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.23.2](https://img.shields.io/badge/AppVersion-0.23.2-informational?style=flat-square)

Docmost is an open-source collaborative wiki and documentation software. It is an open-source alternative to Confluence and Notion.

**Homepage:** <https://docmost.com/>

## Source Code

**Helm chart:**
* <https://github.com/acidsugarx/helm-open/tree/main/charts/docmost>

**Docmost itself:**
* <https://github.com/docmost/docmost>

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+

## Install

To install the chart with the release name `docmost`:

```bash
# Add the repo
helm repo add docmost https://acidsugarx.github.io/helm-open

# Install the chart
helm install docmost docmost/docmost
```

## Configuration

The following table lists the configurable parameters of the docmost chart and their default values.

### Docmost Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of docmost replicas |
| image.repository | string | `"docmost/docmost"` | Docmost image repository |
| image.pullPolicy | string | `"IfNotPresent"` | Docmost image pull policy |
| image.tag | string | `""` | Docmost image tag (defaults to chart appVersion) |
| imagePullSecrets | list | `[]` | Image pull secrets |
| nameOverride | string | `""` | String to partially override docmost.fullname template |
| fullnameOverride | string | `""` | String to fully override docmost.fullname template |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.name | string | `""` | The name of the service account to use |
| podAnnotations | object | `{}` | Annotations for docmost pods |
| podLabels | object | `{}` | Labels for docmost pods |
| podSecurityContext | object | `{}` | Pod security context |
| securityContext | object | `{}` | Container security context |
| service.type | string | `"ClusterIP"` | Service type |
| service.port | int | `3000` | Service port |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.className | string | `""` | Ingress class name |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | Ingress hosts configuration |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| resources | object | `{}` | Resource limits and requests |
| livenessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | Liveness probe configuration |
| readinessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | Readiness probe configuration |
| nodeSelector | object | `{}` | Node selector configuration |
| tolerations | list | `[]` | Tolerations configuration |
| affinity | object | `{}` | Affinity configuration |
| persistence.enabled | bool | `false` | Enable persistence |
| persistence.existingClaim | string | `""` | Use existing persistent volume claim |
| persistence.storageClassName | string | `""` | Storage class name |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access modes |
| persistence.resources | object | `{"requests":{"storage":"5Gi"}}` | Resource requests |
| volumes | list | `[]` | Additional volumes |
| volumeMounts | list | `[]` | Additional volume mounts |
| docmost.appUrl | string | `""` | docmost externally accessible URL |
| docmost.drawIO.url | string | `""` | Custom draw.io server url |
| docmost.smtp.enabled | bool | `false` | Should SMTP be enabled? |
| docmost.smtp.host | string | `""` | The SMTP server to use for sending emails |
| docmost.smtp.port | int | `587` | The port to use for the SMTP server |
| docmost.smtp.secure | bool | `false` | Use TLS when connecting to the server, typically for port 465 |
| docmost.smtp.mailFrom.address | string | `""` | The email address from which emails will be sent |
| docmost.smtp.mailFrom.name | string | `"Docmost"` | The name associated with the email address from which emails will be sent |
| docmost.smtp.auth.username | string | `""` | The username for the SMTP server |
| docmost.smtp.auth.password | string | `""` | The password for the SMTP server |
| docmost.smtp.auth.existingSecret | string | `""` | An existing secret containing the SMTP server username and password |

### PostgreSQL Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgresql.image.repository | string | `"postgres"` | PostgreSQL image repository |
| postgresql.image.tag | string | `"18.0-alpine"` | PostgreSQL image tag |
| postgresql.image.pullPolicy | string | `"IfNotPresent"` | PostgreSQL image pull policy |
| postgresql.imagePullSecrets | list | `[]` | PostgreSQL image pull secrets |
| postgresql.auth.database | string | `"docmost"` | PostgreSQL database name |
| postgresql.auth.username | string | `"docmost"` | PostgreSQL database username |
| postgresql.auth.password | string | `"docmost2025!"` | PostgreSQL database password |
| postgresql.resources | object | `{}` | PostgreSQL resource limits and requests |
| postgresql.persistence.enabled | bool | `true` | Enable PostgreSQL persistence |
| postgresql.persistence.existingClaim | string | `""` | Use existing persistent volume claim |
| postgresql.persistence.storageClassName | string | `""` | PostgreSQL storage class name |
| postgresql.persistence.accessModes | list | `["ReadWriteOnce"]` | PostgreSQL access modes |
| postgresql.persistence.resources | object | `{"requests":{"storage":"8Gi"}}` | PostgreSQL resource requests |

### Redis Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| redis.image.repository | string | `"redis"` | Redis image repository |
| redis.image.tag | string | `"8.2.3-alpine"` | Redis image tag |
| redis.image.pullPolicy | string | `"IfNotPresent"` | Redis image pull policy |
| redis.imagePullSecrets | list | `[]` | Redis image pull secrets |
| redis.resources | object | `{}` | Redis resource limits and requests |
| redis.persistence.enabled | bool | `false` | Enable Redis persistence |
| redis.persistence.existingClaim | string | `""` | Use existing persistent volume claim |
| redis.persistence.storageClassName | string | `""` | Redis storage class name |
| redis.persistence.accessModes | list | `["ReadWriteOnce"]` | Redis access modes |
| redis.persistence.resources | object | `{"requests":{"storage":"2Gi"}}` | Redis resource requests |

## Usage

### Basic Installation

```bash
# Basic installation with default settings
helm repo add homelab-charts https://acidsugarx.github.io/helm-open

# Quick installation
helm install --namespace docmost --create-namespace docmost homelab-charts/docmost --set docmost.appUrl=app.example.com

# Installation with custom values
helm show values homelab-charts/docmost > values.yaml
# Edit and apply installation
helm install --namespace docmost --create-namespace docmost homelab-charts/docmost -f values.yaml
```

### PostgreSQL Configuration

This chart includes a PostgreSQL deployment for the docmost database. The PostgreSQL deployment includes:
- A PostgreSQL container using the official PostgreSQL image
- Persistent storage for data persistence
- Configurable database credentials
- Resource limits and requests

By default, PostgreSQL is configured with:
- Database name: `docmost`
- Username: `docmost`
- Password: `docmost2025!` (recommended to change in production)

### Redis Configuration

This chart includes a Redis deployment for caching and session storage. The Redis deployment includes:
- A Redis container using the official Redis image
- Persistent storage for data persistence
- Configurable resources
- Resource limits and requests

### Persistence

Persistence is enabled by default for both docmost application data and the database. Make sure you have a storage class available in your Kubernetes cluster.

### Ingress Configuration

The chart supports ingress configuration. To enable ingress:

```yaml
ingress:
  enabled: true
  className: "nginx"
  hosts:
    - host: docmost.example.com
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls:
   - secretName: docmost-tls
     hosts:
       - docmost.example.com
```

### SMTP Configuration

To enable SMTP for email notifications:

```yaml
docmost:
  smtp:
    enabled: true
    host: "smtp.example.com"
    port: 587
    secure: false
    mailFrom:
      address: "noreply@example.com"
      name: "Docmost"
    auth:
      username: "your-smtp-username"
      password: "your-smtp-password"
```

## Uninstall

To uninstall the chart:

```bash
helm uninstall --namespace docmost docmost
```

## Contributing

We welcome contributions to this Helm chart. Please see the [GitHub repository](https://github.com/acidsugarx/helm-open) for more information.

---
*Part of the [Homelab Helm Charts](../../README.md) collection.*
