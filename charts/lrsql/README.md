# lrsql

### version: 0.2.1<!-- x-release-please-version -->

![AppVersion: v0.7.14](https://img.shields.io/badge/AppVersion-v0.7.14-informational?style=flat-square)

SQL LRS/lrsql helm chart

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | common | 2.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | list | `[]` |  |
| command[0] | string | `"/lrsql/bin/run_sqlite.sh"` |  |
| containerPorts.http | int | `8080` |  |
| extraEnvVarsCM | string | `""` |  |
| extraEnvVarsSecret | string | `""` |  |
| extraEnvVars[0].name | string | `"LRSQL_DB_NAME"` |  |
| extraEnvVars[0].value | string | `"db/lrsql.sqlite.db"` |  |
| extraEnvVars[1].name | string | `"LRSQL_ALLOW_ALL_ORIGINS"` |  |
| extraEnvVars[1].value | string | `"true"` |  |
| extraEnvVars[2].name | string | `"LRSQL_ADMIN_USER_DEFAULT"` |  |
| extraEnvVars[2].value | string | `"admin"` |  |
| extraEnvVars[3].name | string | `"LRSQL_ADMIN_PASS_DEFAULT"` |  |
| extraEnvVars[3].value | string | `"admin"` |  |
| extraEnvVars[4].name | string | `"LRSQL_API_KEY_DEFAULT"` |  |
| extraEnvVars[4].value | string | `"my_key"` |  |
| extraEnvVars[5].name | string | `"LRSQL_API_SECRET_DEFAULT"` |  |
| extraEnvVars[5].value | string | `"my_secret"` |  |
| fullnameOverride | string | `""` |  |
| image.debug | bool | `false` |  |
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"yetanalytics/lrsql"` |  |
| image.tag | string | `"v0.8.4"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.apiVersion | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.extraHosts | list | `[]` |  |
| ingress.extraPaths | list | `[]` |  |
| ingress.extraRules | list | `[]` |  |
| ingress.extraTls | list | `[]` |  |
| ingress.hostname | string | `"sample.com"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.secrets | list | `[]` |  |
| ingress.selfSigned | bool | `false` |  |
| ingress.tls | bool | `true` |  |
| ingress.tlsWwwPrefix | bool | `false` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.dataSource | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.labels | object | `{}` |  |
| persistence.mountPath | string | `"/lrsql/db"` |  |
| persistence.selector | object | `{}` |  |
| persistence.size | string | `"20Gi"` |  |
| persistence.storageClass | string | `""` |  |
| persistence.subPath | string | `""` |  |
| persistence.volumeName | string | `"data"` |  |
| podAnnotations | object | `{}` |  |
| podLabels."app.kubernetes.io/component" | string | `"lrs"` |  |
| podLabels."app.kubernetes.io/name" | string | `"lrsql"` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.ports.http | int | `80` |  |
| service.targetPort.http | string | `"http"` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

