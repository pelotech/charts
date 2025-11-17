# mutating-webhook

### version: 0.2.1<!-- x-release-please-version -->

![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for the webhook deployment. |
| fullnameOverride | string | `""` | Override for the generated full name for resources. |
| image | object | `{"pullPolicy":"Always","repository":"kavla/mwc"}` | Image settings for the webhook. |
| image.pullPolicy | string | `"Always"` | The pull policy to use when downloading the webhook image. |
| image.repository | string | `"kavla/mwc"` | The repository where the webhook image is located. |
| imagePullSecrets | list | `[]` | Pull secrets for retrieving the webhook image. |
| nameOverride | string | `""` | Override for the generated name for resources. |
| nodeSelector | object | `{}` | A node selector for the webhook deployment. |
| podSecurityContext | object | `{}` | The PodSecurityContext to apply to the webhook deployment. |
| replicaCount | int | `1` | The number of replicas to run in the webhook deployment. |
| resources | object | `{}` | Resources requests/limits for the webhook deployment. |
| securityContext | object | `{}` | The ContainerSecurityContext to apply to the container inside the webhook deployment. |
| service | object | `{"port":443,"type":"ClusterIP"}` | Service configurations. |
| service.port | int | `443` | The port for the service to accept connections on. |
| service.type | string | `"ClusterIP"` | The type of service to create. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `nil` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Tolerations for the webhook deployment. |

