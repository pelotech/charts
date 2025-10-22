# crossplane-cluster-config

### version: 0.0.2<!-- x-release-please-version -->

![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| functions.auto-ready.package.name | string | `"xpkg.upbound.io/crossplane-contrib/function-auto-ready"` |  |
| functions.auto-ready.package.tag | string | `"v0.4.0"` |  |
| functions.extra-resources.package.name | string | `"xpkg.upbound.io/crossplane-contrib/function-extra-resources"` |  |
| functions.extra-resources.package.tag | string | `"v0.1.0"` |  |
| functions.go-templating.package.name | string | `"xpkg.upbound.io/crossplane-contrib/function-go-templating"` |  |
| functions.go-templating.package.tag | string | `"v0.9.0"` |  |
| functions.keycloak-builtin-objects.package.name | string | `"registry.gitlab.com/corewire/images/crossplane/function-keycloak-builtin-objects"` |  |
| functions.keycloak-builtin-objects.package.tag | string | `"v3.0.0"` |  |
| functions.patch-and-transform.package.name | string | `"xpkg.upbound.io/crossplane-contrib/function-patch-and-transform"` |  |
| functions.patch-and-transform.package.tag | string | `"v0.8.0"` |  |
| providers.keycloak.package.name | string | `"xpkg.upbound.io/crossplane-contrib/provider-keycloak"` |  |
| providers.keycloak.package.tag | string | `"v2.9.0"` |  |
| providers.keycloak.runtimeConfigRef.name | string | `"enable-management-policies"` |  |

