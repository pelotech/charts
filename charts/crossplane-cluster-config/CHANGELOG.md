# Changelog

## [1.0.0](https://github.com/pelotech/charts/compare/crossplane-cluster-config/0.0.3...crossplane-cluster-config/1.0.0) (2026-11-25)

BREAKING CHANGE: Upgrading provider-keycloak from [v2 to v3](https://github.com/crossplane-contrib/provider-keycloak/releases?page=2#release-v3.0.0) adds a conversion webhook, served by the provider pod, that must be reachable from the Kubernetes API server. On clusters where the control plane cannot reach pod IPs (e.g. EKS with an overlay CNI such as Cilium), the provider needs to run with hostNetwork until existing resources are migrated. On clusters where the control plane can reach pod IPs, no action is required.

For clusters where the control plane cannot reach pod IPs (e.g. EKS with Cilium), the following steps are required:

Migration steps:
1. Check if your cluster has any resources that need converting:
```
kubectl get clients.openidclient.keycloak.crossplane.io,clients.openidclient.keycloak.m.crossplane.io,identityproviders.oidc.keycloak.crossplane.io,identityproviders.oidc.keycloak.m.crossplane.io -A
```
If any resources are returned, proceed and keep the list as your inventory. If nothing is returned, apply this chart version and skip the remaining steps.

2. Add a hostNetwork runtime config for your keycloak provider:
```yaml
---
apiVersion: pkg.crossplane.io/v1beta1
kind: DeploymentRuntimeConfig
metadata:
  name: provider-keycloak-hostnet
spec:
  deploymentTemplate:
    spec:
      selector: {}
      template:
        spec:
          hostNetwork: true
          dnsPolicy: ClusterFirstWithHostNet
          containers:
            - name: package-runtime
              args:
                - --enable-management-policies
```
And in this chart's values.yaml:
```yaml
providers:
  keycloak:
    runtimeConfigRef:
      name: provider-keycloak-hostnet
```

3. Apply this chart version (1.0.0) and verify the provider is healthy and the query from step 1 returns without conversion errors.
4. Update every manifest source for the inventoried resources to `apiVersion: .../v1alpha2` and sync. If `clientSecretWoVersion` is set, it must now be a string (`1` -> `"1"`).
5. Force a write on every inventoried resource so it is re-stored at v1alpha2. If using Argo CD, manually sync each affected app (without "apply out of sync only"). For any other resource: `kubectl annotate <resource> storage-migrated=v1alpha2`
6. Once every inventoried resource has been re-written, remove the hostNetwork config from step 2, as the conversion webhook is no longer needed. Verify the query from step 1 still returns without errors. If it fails, re-add the hostNetwork config and repeat step 5.

Note: without a reachable webhook, any later apply of these kinds at v1alpha1 will fail. Keep the hostNetwork config if anything still applies v1alpha1 manifests.


### Chores

* **deps:** update xpkg.upbound.io/crossplane-contrib/function-auto-ready docker tag to v0.7.4 ([#190](https://github.com/pelotech/charts/issues/190)) ([845833b](https://github.com/pelotech/charts/commit/845833bbecb9c7ee00dc08d669a1b61661545836))
* **deps:** update xpkg.upbound.io/crossplane-contrib/function-extra-resources docker tag to v0.4.1 ([#192](https://github.com/pelotech/charts/issues/192)) ([97a5b14](https://github.com/pelotech/charts/commit/97a5b14318750d82f2127da8914089489c197855))
* **deps:** update xpkg.upbound.io/crossplane-contrib/function-go-templating docker tag to v0.13.3 ([#191](https://github.com/pelotech/charts/issues/191)) ([86ff8e9](https://github.com/pelotech/charts/commit/86ff8e9a6c10fd7a58f79db05ada596cb99d64ca))
* **deps:** update xpkg.upbound.io/crossplane-contrib/function-patch-and-transform docker tag to v0.11.3 ([#193](https://github.com/pelotech/charts/issues/193)) ([a3c938d](https://github.com/pelotech/charts/commit/a3c938d9d5870409d7ca5ba5f738bbe7e133cfac))
* **deps:** update xpkg.upbound.io/crossplane-contrib/provider-keycloak docker tag to v3 ([#189](https://github.com/pelotech/charts/issues/189)) ([4e6cb69](https://github.com/pelotech/charts/commit/4e6cb69dd9bd61677dc778acbcd446047f949b63))

## [0.0.3](https://github.com/pelotech/charts/compare/crossplane-cluster-config/0.0.2...crossplane-cluster-config/0.0.3) (2026-10-29)


### Bug Fixes

* **crossplane-cluster-config:** bump keycloak provider to v2.24.1 and update functions ([#183](https://github.com/pelotech/charts/issues/183)) ([84a12f9](https://github.com/pelotech/charts/commit/84a12f93fb3e81fa6841ade44e4636dbce2580c6))

## [0.0.2](https://github.com/pelotech/charts/compare/crossplane-cluster-config/0.0.1...crossplane-cluster-config/0.0.2) (2025-10-22)


### Bug Fixes

* rename `cluster-crossplane-config`-&gt;`crossplane-cluster-config` ([#80](https://github.com/pelotech/charts/issues/80)) ([61c8f0b](https://github.com/pelotech/charts/commit/61c8f0bcd0af33ddf380a2ec8807f320cce8d582))
