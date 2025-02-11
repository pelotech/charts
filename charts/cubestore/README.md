# cubestore

### version: 0.3.0<!-- x-release-please-version -->

![AppVersion: 0.31.6](https://img.shields.io/badge/AppVersion-0.31.6-informational?style=flat-square)

A Helm chart for Cubestore

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cloudStorage.aws.accessKeyId | string | `nil` |  |
| cloudStorage.aws.bucket | string | `nil` |  |
| cloudStorage.aws.region | string | `nil` |  |
| cloudStorage.aws.secretAccessKeyFromSecret.key | string | `nil` |  |
| cloudStorage.aws.secretAccessKeyFromSecret.name | string | `nil` |  |
| cloudStorage.aws.subPath | string | `nil` |  |
| cloudStorage.gcp.bucket | string | `nil` |  |
| cloudStorage.gcp.credentials | string | `nil` |  |
| cloudStorage.gcp.subPath | string | `nil` |  |
| cloudStorage.minio.accessKeyID | string | `nil` |  |
| cloudStorage.minio.bucket | string | `nil` |  |
| cloudStorage.minio.endpoint | string | `nil` |  |
| cloudStorage.minio.region | string | `nil` |  |
| cloudStorage.minio.secretKey | string | `nil` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| config.jobRunners | string | `nil` |  |
| config.logLevel | string | `"error"` |  |
| config.noUpload | string | `nil` |  |
| config.queryTimeout | string | `nil` |  |
| config.selectWorkers | string | `nil` |  |
| config.walSplitThreshold | string | `nil` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| image.repository | string | `"cubejs/cubestore"` |  |
| image.tag | string | `nil` |  |
| nameOverride | string | `""` |  |
| remoteDir.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| remoteDir.persistence.annotations | object | `{}` |  |
| remoteDir.persistence.resourcePolicy | string | `"keep"` |  |
| remoteDir.persistence.size | string | `"10Gi"` |  |
| remoteDir.persistence.storageClass | string | `nil` |  |
| router.affinity | object | `{}` |  |
| router.customLivenessProbe | object | `{}` |  |
| router.customReadinessProbe | object | `{}` |  |
| router.httpPort | int | `3030` |  |
| router.livenessProbe.enabled | bool | `true` |  |
| router.livenessProbe.failureThreshold | int | `3` |  |
| router.livenessProbe.initialDelaySeconds | int | `10` |  |
| router.livenessProbe.periodSeconds | int | `30` |  |
| router.livenessProbe.successThreshold | int | `1` |  |
| router.livenessProbe.timeoutSeconds | int | `3` |  |
| router.metaPort | int | `9999` |  |
| router.mysqlPort | int | `3306` |  |
| router.nodeSelector | object | `{}` |  |
| router.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| router.persistence.annotations | object | `{}` |  |
| router.persistence.enabled | bool | `false` |  |
| router.persistence.size | string | `"10Gi"` |  |
| router.readinessProbe.enabled | bool | `true` |  |
| router.readinessProbe.failureThreshold | int | `3` |  |
| router.readinessProbe.initialDelaySeconds | int | `10` |  |
| router.readinessProbe.periodSeconds | int | `30` |  |
| router.readinessProbe.successThreshold | int | `1` |  |
| router.readinessProbe.timeoutSeconds | int | `3` |  |
| router.resources | object | `{}` |  |
| router.serviceAccount.annotations | object | `{}` |  |
| router.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| router.serviceAccount.create | bool | `false` |  |
| router.serviceAccount.name | string | `""` |  |
| router.spreadConstraints | list | `[]` |  |
| router.statusPort | int | `3031` |  |
| router.tolerations | object | `{}` |  |
| workers.affinity | object | `{}` |  |
| workers.nodeSelector | object | `{}` |  |
| workers.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| workers.persistence.annotations | object | `{}` |  |
| workers.persistence.enabled | bool | `false` |  |
| workers.persistence.size | string | `"10Gi"` |  |
| workers.port | int | `9001` |  |
| workers.resources | object | `{}` |  |
| workers.serviceAccount.annotations | object | `{}` |  |
| workers.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| workers.serviceAccount.create | bool | `false` |  |
| workers.serviceAccount.name | string | `""` |  |
| workers.spreadConstraints | list | `[]` |  |
| workers.tolerations | object | `{}` |  |
| workers.workersCount | int | `1` |  |

