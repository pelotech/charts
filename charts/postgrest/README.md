# postgrest

### version: 0.5.2<!-- x-release-please-version -->

Helm chart for a PostgREST data api.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://cloudnative-pg.io/charts | cluster | 0.5.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| application.anon | string | `"anon"` |  |
| application.jwt.claim.selector | string | `".postgrest.role"` |  |
| application.schemas | string | `"public"` |  |
| cluster.cluster.instances | int | `3` |  |
| cluster.cluster.roles[0].ensure | string | `"present"` |  |
| cluster.cluster.roles[0].login | bool | `true` |  |
| cluster.cluster.roles[0].name | string | `"goose"` |  |
| cluster.cluster.roles[0].passwordSecret.name | string | `"migrations"` |  |
| cluster.cluster.roles[0].superuser | bool | `true` |  |
| cluster.cluster.roles[1].ensure | string | `"present"` |  |
| cluster.cluster.roles[1].login | bool | `false` |  |
| cluster.cluster.roles[1].name | string | `"anon"` |  |
| cluster.cluster.roles[2].ensure | string | `"present"` |  |
| cluster.cluster.roles[2].login | bool | `false` |  |
| cluster.cluster.roles[2].name | string | `"peek"` |  |
| cluster.cluster.roles[3].ensure | string | `"present"` |  |
| cluster.cluster.roles[3].login | bool | `false` |  |
| cluster.cluster.roles[3].name | string | `"view"` |  |
| cluster.cluster.roles[4].ensure | string | `"present"` |  |
| cluster.cluster.roles[4].login | bool | `false` |  |
| cluster.cluster.roles[4].name | string | `"edit"` |  |
| cluster.cluster.roles[5].ensure | string | `"present"` |  |
| cluster.cluster.roles[5].inRoles[0] | string | `"anon"` |  |
| cluster.cluster.roles[5].inRoles[1] | string | `"peek"` |  |
| cluster.cluster.roles[5].inRoles[2] | string | `"view"` |  |
| cluster.cluster.roles[5].inRoles[3] | string | `"edit"` |  |
| cluster.cluster.roles[5].login | bool | `true` |  |
| cluster.cluster.roles[5].name | string | `"postgrest"` |  |
| cluster.cluster.roles[5].passwordSecret.name | string | `"connection"` |  |
| cluster.cluster.roles[5].superuser | bool | `false` |  |
| cluster.cluster.storage.size | string | `"1Gi"` |  |
| cluster.databases[0].name | string | `"postgrest"` |  |
| cluster.databases[0].owner | string | `"goose"` |  |
| cluster.databases[0].schemas[0].ensure | string | `"present"` |  |
| cluster.databases[0].schemas[0].name | string | `"public"` |  |
| cluster.databases[0].schemas[0].owner | string | `"goose"` |  |
| cluster.enabled | bool | `true` |  |
| cluster.mode | string | `"standalone"` |  |
| cluster.type | string | `"postgresql"` |  |
| database.connection.database | string | `"postgrest"` |  |
| database.connection.hostname | string | `"postgrest-cluster-rw"` |  |
| database.connection.password | string | `"postgrest"` |  |
| database.connection.username | string | `"postgrest"` |  |
| database.migrations.database | string | `"postgrest"` |  |
| database.migrations.enabled | bool | `false` |  |
| database.migrations.hostname | string | `"postgrest-cluster-rw"` |  |
| database.migrations.image | string | `"ghcr.io/pelotech/images/goose"` |  |
| database.migrations.loadFromConfigMap | bool | `false` |  |
| database.migrations.password | string | `"goose"` |  |
| database.migrations.tag | string | `"latest"` |  |
| database.migrations.username | string | `"goose"` |  |
| imagePullSecrets | string | `nil` |  |
| ingress.enabled | bool | `false` |  |
| ingress.rules[0].host | string | `"auth.app.localhost"` |  |
| ingress.rules[0].http.paths[0].backend.service.name | string | `"postgrest"` |  |
| ingress.rules[0].http.paths[0].backend.service.port.name | string | `"keyserver"` |  |
| ingress.rules[0].http.paths[0].path | string | `"/"` |  |
| ingress.rules[0].http.paths[0].pathType | string | `"Prefix"` |  |
| ingress.rules[1].host | string | `"data.app.localhost"` |  |
| ingress.rules[1].http.paths[0].backend.service.name | string | `"postgrest"` |  |
| ingress.rules[1].http.paths[0].backend.service.port.name | string | `"postgrest"` |  |
| ingress.rules[1].http.paths[0].path | string | `"/"` |  |
| ingress.rules[1].http.paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls[0].hosts[0] | string | `"auth.app.localhost"` |  |
| ingress.tls[0].hosts[1] | string | `"data.app.localhost"` |  |
| ingress.tls[0].secretName | string | `"app.localhost-tls"` |  |
| keyserver.api.key | string | `"a-string-secret-at-least-256-bits-long"` |  |
| keyserver.image | string | `"ghcr.io/pelotech/images/keyserver"` |  |
| keyserver.jwt.alg | string | `"RS256"` |  |
| keyserver.jwt.aud | string | `"postgrest"` |  |
| keyserver.jwt.claims.postgrest.role | string | `"peek"` |  |
| keyserver.jwt.exp | string | `"5 minutes"` |  |
| keyserver.jwt.iss | string | `"https://auth.app.localhost"` |  |
| keyserver.jwt.jwks_uri | string | `"https://auth.app.localhost/jwks"` |  |
| keyserver.jwt.origin | string | `"https://jwt.io,https://app.localhost"` |  |
| keyserver.jwt.trust | string | `"https://sso.localhost/auth/realms/example/protocol/openid-connect/certs"` |  |
| keyserver.tag | string | `"latest"` |  |

