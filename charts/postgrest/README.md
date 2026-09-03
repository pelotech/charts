# postgrest

### version: 0.7.0<!-- x-release-please-version -->

![AppVersion: v14.16](https://img.shields.io/badge/AppVersion-v14.16-informational?style=flat-square)

Helm chart for a PostgREST data api.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| application.anon | string | `"anon"` |  |
| application.jwt.claim.selector | string | `".postgrest"` |  |
| application.preRequest | string | `""` |  |
| application.schemas | string | `"public"` |  |
| containerPorts.admin | int | `3001` |  |
| containerPorts.http | int | `3000` |  |
| database.connection.database | string | `"postgrest"` |  |
| database.connection.hostname | string | `"postgrest-cluster-rw"` |  |
| database.connection.password | string | `"postgrest"` |  |
| database.connection.username | string | `"postgrest"` |  |
| image.digest | string | `"sha256:bea1c76a856fa39d1e542d25911cf95d02fe2bf971992d033044ff209f1504b8"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"postgrest/postgrest"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.enabled | bool | `false` |  |
| ingress.rules[0].host | string | `"data.app.localhost"` |  |
| ingress.rules[0].http.paths[0].backend.service.name | string | `"postgrest"` |  |
| ingress.rules[0].http.paths[0].backend.service.port.name | string | `"postgrest"` |  |
| ingress.rules[0].http.paths[0].path | string | `"/"` |  |
| ingress.rules[0].http.paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls[0].hosts[0] | string | `"data.app.localhost"` |  |
| ingress.tls[0].secretName | string | `"app.localhost-tls"` |  |
| jwks.enabled | bool | `true` |  |
| jwks.filename | string | `"jwks.json"` |  |
| jwks.image.digest | string | `"sha256:e318141552c5e6923abff064bd2b8d338c2722bda46cf48d84404b9957bcd814"` |  |
| jwks.image.pullPolicy | string | `"IfNotPresent"` |  |
| jwks.image.registry | string | `"reg.mini.dev"` |  |
| jwks.image.repository | string | `"curl-fips"` |  |
| jwks.image.tag | string | `"8.21.0"` |  |
| jwks.maxAttempts | int | `40` |  |
| jwks.mountPath | string | `"/etc/opt/postgrest/certificates"` |  |
| jwks.refresh.enabled | bool | `false` |  |
| jwks.refresh.interval | int | `300` |  |
| jwks.refresh.reload.enabled | bool | `true` |  |
| jwks.refresh.reload.processName | string | `"postgrest"` |  |
| jwks.refresh.reload.signal | string | `"USR2"` |  |
| jwks.require.kid | string | `""` |  |
| jwks.require.kty | string | `""` |  |
| jwks.require.use | string | `""` |  |
| jwks.resources | object | `{}` |  |
| jwks.retryInterval | int | `3` |  |
| jwks.securityContext.runAsUser | int | `1000` |  |
| jwks.sizeLimit | string | `"1Mi"` |  |
| jwks.timeout | int | `10` |  |
| jwks.url | string | `"https://sso.localhost/auth/realms/example/protocol/openid-connect/certs"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.failureThreshold | int | `3` |  |
| probes.liveness.periodSeconds | int | `10` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.failureThreshold | int | `60` |  |
| probes.startup.periodSeconds | int | `2` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `3000` |  |
| service.type | string | `"ClusterIP"` |  |

