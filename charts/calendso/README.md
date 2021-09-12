# calendso

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Calendso

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.9.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for the calendso deployment. |
| config.baseURL | string | `"http://localhost:3000"` | The base URL of the calendso server. It is important to configure this for callbacks to work correctly. |
| config.collectAnonymousUsage | bool | `true` | Whether to allow calendso to collect anonymous usage statistics. |
| config.databaseURL | string | `""` | The full URI for the database connection. If left blank, it will be generated from the postgresql chart values. |
| config.email.from | string | `"notifications@example.com"` | Configure the From: header whilst sending emails. |
| config.email.smtpCredentialsSecret | string | `""` | The name of a secret with the keys `EMAIL_SERVER_USER` and `EMAIL_SERVER_PASSWORD` containing the credentials for the SMTP server. |
| config.email.smtpHost | string | `""` | The host of the SMTP server. |
| config.email.smtpPort | string | `"587"` | The port of the SMTP server. |
| config.encryptionKeySecret | string | `""` | The name of a secret with a key `CALENDSO_ENCRYPTION_KEY` that will be used to encrypt CalDAV credentials. Choose a random string, for example with `dd if: /dev/urandom bs: 1K count: 1 | md5sum`. |
| config.googleCredentialsSecret | string | `""` | The name of a secret with a key `GOOGLE_API_CREDENTIALS` containing the full contents of a Google JSON credentials file. For more information on obtaining the credentials, see the [documentation](https://github.com/calendso/calendso#obtaining-the-google-api-credentials). |
| config.msCredentialsSecret | string | `""` | The name of a secret with the keys `MS_GRAPH_CLIENT_ID` and `MS_GRAPH_CLIENT_SECRET` containing credentials for connecting with the Microsoft Graph Client. For more information on obtainining the credentials, see the [documentation](https://github.com/calendso/calendso#obtaining-microsoft-graph-client-id-and-secret). |
| config.nextAuthURL | string | `"http://localhost:3000"` | The NextAuth URL for the server. |
| config.zoomCredentialsSecret | string | `""` | The name of a secret with the keys `ZOOM_CLIENT_ID` and `ZOOM_CLIENT_SECRET` containing credentials for connecting to Zoom. For more information on obtaining the credentials, see the [documentation](https://github.com/calendso/calendso#obtaining-zoom-client-id-and-secret). |
| externalConfigSecret | string | `""` | Provide the name of a pre-populated secret for calendso configurations. All values in the `config` block will be ignored. |
| fullnameOverride | string | `""` | Override the full name of resources. |
| global.postgresql.postgresqlDatabase | string | `"calendso"` | The name for the postgresql database. |
| global.postgresql.postgresqlPassword | string | `"changeme"` | The password for calendso to authenticate to the database. |
| global.postgresql.postgresqlUsername | string | `"calendso"` | The username for calendso to authenticate to the database. |
| image.pullPolicy | string | `"IfNotPresent"` | The image pull policy. |
| image.repository | string | `"ghcr.io/pelotech/calendso"` | The repository to pull the image from. |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| ingress.annotations | object | `{}` | Extra annotations to apply to the ingress object. |
| ingress.className | string | `""` | The name of the ingress class. |
| ingress.enabled | bool | `false` | Enable ingress to the calendso service. |
| ingress.hosts | list | `[{"host":"calendso.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | Host and path configurations for the ingress. |
| ingress.tls | list | `[]` | TLS configurations for the ingress. |
| nameOverride | string | `""` | Override the name in resource name templates. |
| nodeSelector | object | `{}` | A node selector for the calendso deployment. |
| podAnnotations | object | `{}` | Additional annotations to apply to the calendso pods. |
| podSecurityContext.fsGroup | int | `1000` | Pod fs group. |
| postgresql.enabled | bool | `true` | Use the bitnami chart to lay down a postgresql server. |
| postgresql.fullnameOverride | string | `"calendso-db"` | Overrides the names generated in the dependant chart. |
| resources | object | `{}` | Resource requests and limits for the calendso deployment. |
| securityContext.capabilities | object | `{"drop":["ALL"]}` | Container capabilities. |
| securityContext.readOnlyRootFilesystem | bool | `true` | Container read-only root filesystem. |
| securityContext.runAsNonRoot | bool | `true` | Container run as non-root. |
| securityContext.runAsUser | int | `1000` | Container run-as user. |
| service.port | int | `80` | The port the service should listen on. |
| service.type | string | `"ClusterIP"` | The type of service to create in front of the calendso deployment. |
| tolerations | list | `[]` | Tolertations for for the calendso deployment. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
