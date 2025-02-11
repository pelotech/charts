# backstage

### version: 0.3.0<!-- x-release-please-version -->

![AppVersion: v0.1.1-alpha.23](https://img.shields.io/badge/AppVersion-v0.1.1--alpha.23-informational?style=flat-square)

A Helm chart for Backstage

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| appConfig | object | `{}` | Additional configurations to override the `app-config.yaml` in the backend.              These configurations will be written to `app-config.local.yaml` in the `backend.appDirectory`. |
| backend.appDirectory | string | `"/usr/src/app"` | The working directory where the backend is served. |
| backend.containerPort | int | `7000` | The port the backend is listening on insie the container. |
| backend.enabled | bool | `true` | Whether to enable the backend deployment. |
| backend.image | object | `{"pullPolicy":"IfNotPresent","repository":"martinaif/backstage-k8s-demo-backend","tag":"test1"}` | Image settings for the backend. |
| backend.image.pullPolicy | string | `"IfNotPresent"` | The ImagePullPolicy to apply to the backend deployment. |
| backend.image.repository | string | `"martinaif/backstage-k8s-demo-backend"` | The repository where the backend image is hosted. |
| backend.image.tag | string | `"test1"` | The tag to pull from the repository for the backend image. |
| backend.nodeEnv | string | `"development"` | The NODE_ENV to set inside the backend deployment. |
| backend.replicaCount | int | `1` | The number of backend replicas to run. |
| backend.resources | object | `{"limits":{"memory":"1024Mi"},"requests":{"memory":"512Mi"}}` | Resource requests/limits to apply to the backend deployment. |
| backend.secretMounts | list | `[]` | Additional secrets to mount as files inside the backend deployment. |
| envSecret | string | `""` | An optional secret containing values to be mounted in the pods as environment variables. |
| frontend.appDirectory | string | `"/usr/share/nginx/html/static"` | The directory where the frontend contents are being served. |
| frontend.containerPort | int | `80` | The port the frontend is listening on inside the container. |
| frontend.enabled | bool | `true` | Whether to enable the frontend deployment. |
| frontend.image | object | `{"pullPolicy":"IfNotPresent","repository":"martinaif/backstage-k8s-demo-frontend","tag":"test1"}` | Image settings for the frontend. |
| frontend.image.pullPolicy | string | `"IfNotPresent"` | The ImagePullPolicy to apply to the frontend deployment. |
| frontend.image.repository | string | `"martinaif/backstage-k8s-demo-frontend"` | The repository where the frontend image is hosted. |
| frontend.image.tag | string | `"test1"` | The tag to pull from the repository for the frontend image. |
| frontend.replicaCount | int | `1` | The number of replicas to run of the frontend. |
| frontend.resources | object | `{"limits":{"memory":"256Mi"},"requests":{"memory":"128Mi"}}` | Resource requests/limits to apply to the frontend deployment. |
| fullnameOverride | string | `""` | Override the default full name generated for resources. |
| global | object | `{"nodeSelector":{}}` | Global settings for the deployments. |
| global.nodeSelector | object | `{}` | The node selector to apply to deployments. |
| ingress.annotations | object | `{}` | Annotations to apply to the ingress. |
| ingress.host | string | `"example.com"` | The hostname to route to the backstage deployments. By default, `/api` is routed to the backend                 and all other requests to the frontend. |
| nameOverride | string | `""` | Override the default name generated for resources. |

