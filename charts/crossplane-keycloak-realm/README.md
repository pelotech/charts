# crossplane-keycloak-realm

### version: 0.2.0<!-- x-release-please-version -->

![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

Define a Keycloak Realm via Crossplane

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adminUser.email | string | `"realm-admin@pelo.tech"` |  |
| adminUser.enabled | bool | `true` |  |
| adminUser.username | string | `"realm-admin"` |  |
| builtinObjects | string | `nil` |  |
| clients.oidc | list | `[]` |  |
| providerConfig.kind | string | `"ProviderConfig"` |  |
| providerConfig.name | string | `"test-provider"` |  |
| providerConfig.secretName | string | `"test-provider-credentials"` |  |
| realm.forProvider.defaultSignatureAlgorithm | string | `"RS256"` |  |
| realm.forProvider.loginWithEmailAllowed | bool | `true` |  |
| realm.forProvider.resetPasswordAllowed | bool | `true` |  |
| realm.name | string | `"test-realm"` |  |
| roles | list | `[]` |  |
| userFederation.ldap.enabled | bool | `false` |  |
| userFederation.ldap.forProvider.deleteDefaultMappers | bool | `true` |  |
| userFederation.ldap.forProvider.editMode | string | `"WRITABLE"` |  |
| userFederation.ldap.forProvider.importEnabled | bool | `true` |  |
| userFederation.ldap.forProvider.name | string | `"ldap"` |  |
| userFederation.ldap.forProvider.startTls | bool | `false` |  |
| userFederation.ldap.forProvider.syncRegistrations | bool | `true` |  |
| userFederation.ldap.forProvider.trustEmail | bool | `false` |  |
| userFederation.ldap.forProvider.usePasswordModifyExtendedOp | bool | `false` |  |
| userFederation.ldap.forProvider.useTruststoreSpi | string | `"ONLY_FOR_LDAPS"` |  |
| userFederation.ldap.forProvider.validatePasswordPolicy | bool | `false` |  |
| userFederation.ldap.mappers.hardcodedAttributeMappers | list | `[]` |  |
| userFederation.ldap.mappers.userAttributeMappers | list | `[]` |  |
| userFederation.ldap.name | string | `"ldap-user-federation"` |  |
| userFederation.ldap.suffix | string | `"$$ldap.suffix"` |  |
| users | list | `[]` |  |

