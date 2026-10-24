# pelostage

### version: 0.2.0<!-- x-release-please-version -->

![AppVersion: v0.2.0](https://img.shields.io/badge/AppVersion-v0.2.0-informational?style=flat-square)

Pelostage, a Backstage developer portal, for pelotech and client deployments

**Homepage:** <https://github.com/pelotech/pelostage>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://cloudnative-pg.io/charts | cnpgCluster(cluster) | 0.9.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity. |
| appConfig | object | `{}` | Extra Backstage config, merged last (overrides everything above). |
| cnpgCluster | object | `{"cluster":{"instances":1,"storage":{"size":"5Gi"}},"enabled":false,"nameOverride":"cnpg"}` | CloudNativePG cluster (https://github.com/cloudnative-pg/charts) created with pelostage. Needs the CNPG operator installed in the cluster. |
| commonLabels | object | `{}` | Labels added to every resource and pod, e.g. `backstage.io/kubernetes-id` so the portal's own catalog entity shows its workloads. Not added to selectors. |
| database.external.database | string | `"pelostage"` | Database name. |
| database.external.existingSecret | string | `""` | Secret holding the Postgres credentials. |
| database.external.host | string | `""` | Postgres host. Setting it switches pelostage to this database. |
| database.external.passwordKey | string | `"password"` | Key in the secret holding the password. |
| database.external.port | int | `5432` | Postgres port. |
| database.external.userKey | string | `"username"` | Key in the secret holding the user name. |
| extraEnv | list | `[]` | Extra environment variables for the backend container. |
| fullnameOverride | string | `""` | Override the full resource name. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| image.repository | string | `"ghcr.io/pelotech/pelostage"` | Pelostage image repository. |
| image.tag | string | `""` | Image tag. Defaults to the chart appVersion. |
| imagePullSecrets | list | `[]` | Image pull secrets for private registries. |
| ingress.annotations | object | `{}` | Ingress annotations (e.g. a cert-manager cluster issuer). |
| ingress.className | string | `"nginx"` | Ingress class. |
| ingress.enabled | bool | `true` | Create an ingress. |
| ingress.host | string | `""` | Host name. Defaults to the host of `portal.baseUrl`. |
| ingress.tlsSecretName | string | `""` | TLS secret name. Empty disables TLS on the ingress. |
| kubernetes.clusterName | string | `"in-cluster"` | Cluster name shown in the Kubernetes tab. |
| kubernetes.customResources | list | `[]` | Custom resources to show alongside standard workloads, e.g. Argo CD applications (`group: argoproj.io`, `apiVersion: v1alpha1`, `plural: applications`). |
| kubernetes.enabled | bool | `true` | Show workloads from the cluster pelostage runs in on catalog entities. |
| livenessProbe | object | `{"httpGet":{"path":"/.backstage/health/v1/liveness","port":"http"}}` | Liveness probe. |
| nameOverride | string | `""` | Override the chart name used in resource names. |
| nodeSelector | object | `{}` | Node selector. |
| podAnnotations | object | `{}` | Annotations added to the pod. |
| podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Pod security context (the image runs as the `node` user, uid 1000). |
| portal.baseUrl | string | `"https://backstage.example.com"` | Public URL of the portal (frontend and backend are served from it). |
| portal.branding.logoFullUrl | string | `""` | Logo URL shown when the sidebar is open. Empty uses the built-in logo. |
| portal.branding.logoIconUrl | string | `""` | Logo URL shown when the sidebar is collapsed. Empty uses the built-in logo. |
| portal.githubOrg | string | `""` | GitHub organization whose repos, users and teams are imported. |
| portal.home.layout | list | `[{"column":0,"component":"HomePageSearchBar","deletable":false,"height":2,"row":0,"width":12},{"column":0,"component":"GettingStarted","height":8,"row":2,"width":4},{"column":4,"component":"HomePageStarredEntities","height":4,"row":2,"width":4},{"column":8,"component":"HomePageToolkit","height":4,"row":2,"width":4},{"column":4,"component":"HomePageRecentlyVisited","height":4,"row":6,"width":4},{"column":8,"component":"HomePageMostVisited","height":4,"row":6,"width":4}]` | Default home page layout users start from (widget component names and grid positions). |
| portal.home.toolkit | list | `[{"icon":"github","label":"pelostage repo","url":"https://github.com/pelotech/pelostage"},{"icon":"docs","label":"Backstage docs","url":"https://backstage.io/docs"}]` | Links in the home page toolkit widget (`url`, `label`, `icon`). |
| portal.title | string | `"Backstage"` | Portal title and organization name shown in the app. |
| readinessProbe | object | `{"httpGet":{"path":"/.backstage/health/v1/readiness","port":"http"}}` | Readiness probe. |
| replicaCount | int | `1` | Number of replicas. Keep 1 with SQLite; use Postgres for more. |
| resources | object | `{"limits":{"memory":"2Gi"},"requests":{"cpu":"250m","memory":"512Mi"}}` | Memory headroom for TechDocs builds; no CPU limit to avoid throttling. |
| secrets.existingSecret | string | `""` | Existing Secret with keys APP_ID, CLIENT_ID, CLIENT_SECRET, WEBHOOK_SECRET and PRIVATE_KEY. When empty, a Secret is created from the values below (encrypt them, e.g. with helm-secrets). |
| secrets.githubApp.appId | string | `""` | GitHub App id. |
| secrets.githubApp.clientId | string | `""` | GitHub App OAuth client id (also used for GitHub sign-in). |
| secrets.githubApp.clientSecret | string | `""` | GitHub App OAuth client secret. |
| secrets.githubApp.privateKey | string | `""` | GitHub App private key (PEM). |
| secrets.githubApp.webhookSecret | string | `""` | GitHub App webhook secret. |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}}` | Container security context. |
| service.port | int | `80` | Service port. |
| service.type | string | `"ClusterIP"` | Service type. |
| serviceAccount.annotations | object | `{}` | Service account annotations. |
| serviceAccount.create | bool | `true` | Create a service account (needed for the Kubernetes plugin). |
| serviceAccount.name | string | `""` | Service account name. Defaults to the full name. |
| startupProbe | object | `{"failureThreshold":30,"httpGet":{"path":"/.backstage/health/v1/liveness","port":"http"},"periodSeconds":10}` | Startup probe; allows up to 5 minutes for plugins to initialize. |
| tolerations | list | `[]` | Tolerations. |
| utilityImage.repository | string | `"busybox"` | Utility image repository. |
| utilityImage.tag | string | `"1.37.0"` | Utility image tag. |

