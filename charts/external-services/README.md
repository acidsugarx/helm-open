# External Services and Ingress Manage via Helm Chart

This Helm chart provides a flexible way to manage external services and ingress rules in Kubernetes. It allows you to easily add new services with minimal configuration.

## Features

- Define external services with minimal configuration
- Support for TLS with automatic certificate generation
- Configurable ingress settings (ingressClassName, annotations, etc.)
- Support for custom backend protocols (e.g., HTTPS)
- Default settings applied globally, with ability to override per service
- Option to use existing certificates

## Parameters

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

## Usage

### Adding a New Service

To add a new service, simply add it to your values file:

```yaml
externalServices:
  my-new-service:
    enabled: true
    namespace: service
    externalName: my-service.example.com
    domain: "my-service.example.com"
    annotations: {}
    ports:
    - port: 443
      targetPort: 80
      name: https
    ingress:
      enabled: true
      tlsEnabled: true
      useExistingCert: false  # Set to existing secret name to use existing cert
```

### Using Default Settings

You can take advantage of default settings to minimize configuration:

```yaml
# Only specify values that differ from defaults
externalServices:
  simplified-service:
    enabled: true
    namespace: service
    externalName: simple.example.com
    domain: "simple.example.com"
    # ingress configuration will use default settings
```

### Disabling TLS

To disable TLS for a specific service:

```yaml
externalServices:
  no-tls-service:
    enabled: true
    namespace: service
    externalName: no-tls.example.com
    domain: "no-tls.example.com"
    ingress:
      enabled: true
      tlsEnabled: false
```

### Using Existing Certificate

To use an existing certificate:

```yaml
externalServices:
  existing-cert-service:
    enabled: true
    namespace: service
    externalName: existing-cert.example.com
    domain: "existing-cert.example.com"
    ingress:
      enabled: true
      tlsEnabled: true
      useExistingCert: "my-existing-cert-secret"
```

## Installing the Chart

```bash
helm install my-external-services ./external-services-chart -f custom-values.yaml
```

## Upgrading the Chart

```bash
helm upgrade my-external-services ./external-services-chart -f custom-values.yaml
```
