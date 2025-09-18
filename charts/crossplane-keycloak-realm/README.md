# crossplane-keycloak-realm

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

Define a Keycloak Realm via Crossplane

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| builtinObjects.spec.builtinAuthenticationFlows | list | `[]` |  |
| builtinObjects.spec.builtinClients | list | `[]` |  |
| builtinObjects.spec.builtinRealmRoles | list | `[]` |  |
| providerConfig.name | string | `"test-provider"` |  |
| providerConfig.secretName | string | `"{{ }}"` |  |
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
| userFederation.ldap.forProvider.realmIdRef.name | string | `"{{ tpl .Values.realm.name $ }}--realm"` |  |
| userFederation.ldap.forProvider.startTls | bool | `false` |  |
| userFederation.ldap.forProvider.syncRegistrations | bool | `true` |  |
| userFederation.ldap.forProvider.trustEmail | bool | `false` |  |
| userFederation.ldap.forProvider.usePasswordModifyExtendedOp | bool | `false` |  |
| userFederation.ldap.forProvider.useTruststoreSpi | string | `"ONLY_FOR_LDAPS"` |  |
| userFederation.ldap.forProvider.validatePasswordPolicy | bool | `false` |  |
| userFederation.ldap.mappers.hardcodedAttributeMappers | list | `[]` |  |
| userFederation.ldap.mappers.userAttributeMappers | list | `[]` |  |
| users | list | `[]` |  |

