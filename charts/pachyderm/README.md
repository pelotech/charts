# pachyderm

### version: 0.3.0<!-- x-release-please-version -->

![AppVersion: 1.8.6](https://img.shields.io/badge/AppVersion-1.8.6-informational?style=flat-square)

Pachyderm is a large-scale container-based workflow engine that offers complete version control for data and reproducible data processing

**Homepage:** <https://pachyderm.io>

## Maintainers

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| amazon.bucketName | string | `""` |  |
| amazon.distribution | string | `""` |  |
| amazon.id | string | `""` |  |
| amazon.region | string | `""` |  |
| amazon.roleArn | string | `""` |  |
| amazon.secret | string | `""` |  |
| amazon.token | string | `""` |  |
| credentials | string | `"local"` |  |
| etcd.image.pullPolicy | string | `"IfNotPresent"` |  |
| etcd.image.repository | string | `"quay.io/coreos/etcd"` |  |
| etcd.image.tag | string | `"v3.3.5"` |  |
| etcd.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| etcd.persistence.enabled | bool | `false` |  |
| etcd.persistence.size | string | `"20G"` |  |
| etcd.resources.requests.cpu | string | `"250m"` |  |
| etcd.resources.requests.memory | string | `"256M"` |  |
| google.bucketName | string | `""` |  |
| google.credentials | string | `""` |  |
| microsoft.container | string | `""` |  |
| microsoft.id | string | `""` |  |
| microsoft.secret | string | `""` |  |
| pachd.exposeObjApi | bool | `false` |  |
| pachd.image.pullPolicy | string | `"Always"` |  |
| pachd.image.repository | string | `"pachyderm/pachd"` |  |
| pachd.image.tag | string | `"1.8.6"` |  |
| pachd.pfsCache | string | `"0G"` |  |
| pachd.replicaCount | int | `1` |  |
| pachd.resources.requests.cpu | string | `"250m"` |  |
| pachd.resources.requests.memory | string | `"512M"` |  |
| pachd.service.grpc.annotations | object | `{}` |  |
| pachd.service.grpc.port | int | `30650` |  |
| pachd.service.grpc.type | string | `"NodePort"` |  |
| pachd.worker.repository | string | `"pachyderm/worker"` |  |
| pachd.worker.tag | string | `"1.8.6"` |  |
| rbac.create | bool | `true` |  |
| s3.accessKey | string | `""` |  |
| s3.bucketName | string | `""` |  |
| s3.endpoint | string | `""` |  |
| s3.secretKey | string | `""` |  |
| s3.secure | string | `"0"` |  |
| s3.signature | string | `"1"` |  |

