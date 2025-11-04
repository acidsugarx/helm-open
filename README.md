![Latest Release](https://img.shields.io/github/v/release/acidsugarx/helm-open?logo=github)

# Homelab Helm Charts 🚀

My handy little collection of Helm charts for homelab and private Kubernetes deployments.

## Charts

- **[external-services](./charts/external-services/)** - Deploy external services with ingress and TLS termination for easy traffic routing in private networks.

- **[docmost](./charts/docmost/)** - Deploy a [Docmost](https://github.com/Docmost/docmost) with Helm, and ready to go PostgreSQL + Redis.
> Docmost an open-source collaborative wiki and documentation software. It is an open-source alternative to Confluence and Notion.

## Features

- 🧩 **Modular Design**: Each chart is self-contained and independently deployable
- 🔐 **TLS Ready**: Automatic certificate management with configurable options
- 🌐 **Network Simplified**: Streamlined external service configuration with ingress rules
- ⚡ **Quick Deploy**: Minimal configuration for rapid service provisioning

## Quick Start

```bash
# Add this repository
helm repo add homelab-charts https://acidsugarx.github.io/helm-open
```

## Contributing

Feel free to submit issues or pull requests. Contributions are welcome!

---

*Designed for homelab enthusiasts and private Kubernetes deployments.*

