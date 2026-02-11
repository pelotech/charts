# openldap

### version: 1.3.0<!-- x-release-please-version -->

![AppVersion: 2.4.48](https://img.shields.io/badge/AppVersion-2.4.48-informational?style=flat-square)

This chart was forked from the now-deprecated Helm Charts repository.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| env.LDAP_BACKEND | string | `"hdb"` |  |
| env.LDAP_DOMAIN | string | `"example.org"` |  |
| env.LDAP_ORGANISATION | string | `"Example Inc."` |  |
| env.LDAP_REMOVE_CONFIG_AFTER_SETUP | string | `"true"` |  |
| env.LDAP_TLS | string | `"true"` |  |
| env.LDAP_TLS_ENFORCE | string | `"false"` |  |
| existingSecret | string | `""` |  |
| extraLabels | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"osixia/openldap"` |  |
| image.tag | string | `"1.2.4"` |  |
| initResources | object | `{}` |  |
| logLevel | string | `"info"` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.size | string | `"8Gi"` |  |
| podAnnotations | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.externalIPs | list | `[]` |  |
| service.ldapPort | int | `389` |  |
| service.loadBalancerIP | string | `""` |  |
| service.loadBalancerSourceRanges | list | `[]` |  |
| service.sslLdapPort | int | `636` |  |
| service.type | string | `"ClusterIP"` |  |
| strategy | object | `{}` |  |
| test.enabled | bool | `false` |  |
| test.image.repository | string | `"dduportal/bats"` |  |
| test.image.tag | string | `"0.4.0"` |  |
| tls.CA.enabled | bool | `false` |  |
| tls.CA.secret | string | `""` |  |
| tls.enabled | bool | `false` |  |
| tls.secret | string | `""` |  |
| tolerations | list | `[]` |  |

