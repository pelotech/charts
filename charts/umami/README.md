# umami

### version: 0.1.0<!-- x-release-please-version -->

![AppVersion: 3.2.0](https://img.shields.io/badge/AppVersion-3.2.0-informational?style=flat-square)

A Helm chart for deploying Umami analytics to Kubernetes

**Homepage:** <https://umami.is/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | common | 2.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| containerPorts.http | int | `3000` |  |
| envFrom | list | `[]` |  |
| extraEnvVars | list | `[]` |  |
| extraEnvVarsCM | string | `""` |  |
| extraEnvVarsSecret | string | `""` |  |
| fullnameOverride | string | `""` |  |
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"umami-software/umami"` |  |
| image.tag | string | `"3.2.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.extraHosts | list | `[]` |  |
| ingress.extraPaths | list | `[]` |  |
| ingress.extraRules | list | `[]` |  |
| ingress.extraTls | list | `[]` |  |
| ingress.hostname | string | `"umami.local"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"Prefix"` |  |
| ingress.secrets | list | `[]` |  |
| ingress.tls | bool | `false` |  |
| livenessProbe.httpGet.path | string | `"/api/heartbeat"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/api/heartbeat"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.nodePorts.http | string | `""` |  |
| service.nodePorts.sso | string | `""` |  |
| service.ports.http | int | `80` |  |
| service.ports.sso | int | `8000` |  |
| service.targetPort.http | string | `"http"` |  |
| service.targetPort.sso | string | `"sso-http"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| sso.containerPorts.http | int | `8000` |  |
| sso.enabled | bool | `false` |  |
| sso.envFrom | list | `[]` |  |
| sso.extraEnvVars | list | `[]` |  |
| sso.extraEnvVarsCM | string | `""` |  |
| sso.extraEnvVarsSecret | string | `""` |  |
| sso.image.digest | string | `""` |  |
| sso.image.pullPolicy | string | `"IfNotPresent"` |  |
| sso.image.registry | string | `"codeberg.org"` |  |
| sso.image.repository | string | `"vanutp/umami-sso"` |  |
| sso.image.tag | string | `"latest"` | Umami SSO image tag. WARNING: production users should set a fixed tag or digest before enabling SSO for rollback/reproducibility. |
| sso.ingress.pathType | string | `"Prefix"` |  |
| sso.livenessProbe.tcpSocket.port | string | `"sso-http"` |  |
| sso.readinessProbe.tcpSocket.port | string | `"sso-http"` |  |
| sso.resources | object | `{}` |  |
| sso.securityContext | object | `{}` |  |
| sso.startupProbe.failureThreshold | int | `30` |  |
| sso.startupProbe.periodSeconds | int | `10` |  |
| sso.startupProbe.tcpSocket.port | string | `"sso-http"` |  |
| ssoVolumeMounts | list | `[]` |  |
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.httpGet.path | string | `"/api/heartbeat"` |  |
| startupProbe.httpGet.port | string | `"http"` |  |
| startupProbe.periodSeconds | int | `10` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

