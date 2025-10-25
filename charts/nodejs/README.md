# nodejs

### version: 0.3.1<!-- x-release-please-version -->

![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A Helm chart for Deploying NoodeJS applications to Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configurations for the deployment. |
| applicationDirectory | string | `"/usr/src/app"` | The directory from where the application is being served in the container. |
| configuration | object | `{}` | Additional configurations to apply to the containers. |
| envFrom | list | `[]` | Environment variables from ConfigMaps/Secrets to import into the containers. |
| environment | list | `[]` | Environment variables to set inside the containers. |
| extraVolumeMounts | list | `[]` | Extra volume mounts to add to the deployment. |
| extraVolumes | list | `[]` | Extra volumes to add to the deployment. |
| healthCheckUrl | string | `"/health-check"` | The health check endpoint for the application. |
| image.pullPolicy | string | `"IfNotPresent"` | The pull policy to use when launching pods for the deployment. |
| image.registry | string | `"docker.io"` | The registry where the image is hosted. |
| image.repository | string | `"node"` | The repository to pull images from. |
| image.tag | string | `"latest"` | The tag of the image to pull from the repository. |
| ingress.annotations | object | `{}` | Annotations to apply to the ingress. |
| ingress.enabled | bool | `false` | Whether to enable ingress to the application. |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":["/"]}]` | Host and path configurations to route to the service |
| ingress.hosts[0].host | string | `"chart-example.local"` | An example hostname. |
| ingress.hosts[0].paths | list | `["/"]` | Example paths at the configured hostname. |
| ingress.ingressClassName | string | `"nginx"` | Which ingressClass to assign this ingress to. |
| ingress.pathType | string | `"Prefix"` | https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types |
| ingress.tls | list | `[]` | TLS configurations for the ingress. |
| nodeSelector | object | `{}` | A node selector for the deployment. |
| podAnnotations | object | `{}` | Additional annotations to apply to the pods inside the deployment. |
| replicaCount | int | `1` | The number of replicas to run in the application deployment. |
| resources | object | `{}` | Resource requests/limits for the deployment. |
| service | object | `{"annotations":{},"port":81,"type":"ClusterIP"}` | Service configurations. |
| service.annotations | object | `{}` | Annotations to apply to the service. |
| service.port | int | `81` | The port to expose on the service for the deployment. |
| service.type | string | `"ClusterIP"` | The type of service to create for the deployment. |
| tls | object | `{"enabled":false}` | tls configurations |
| tls.enabled | bool | `false` | Whether to enable TLS for incoming connections to the service. |
| tolerations | list | `[]` | Tolerations for the deployment. |

