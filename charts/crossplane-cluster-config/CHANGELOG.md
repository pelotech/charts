# Changelog

## [1.0.1](https://github.com/pelotech/charts/compare/crossplane-cluster-config/1.0.0...crossplane-cluster-config/1.0.1) (2026-11-25)


### Bug Fixes

* **provider-keycloak:** add hostnetwork option for v1 ([#196](https://github.com/pelotech/charts/issues/196)) ([fbbf738](https://github.com/pelotech/charts/commit/fbbf7383bde9d66901ba53ad2b9a879f9589e65b))

## [1.0.0](https://github.com/pelotech/charts/compare/crossplane-cluster-config/0.0.3...crossplane-cluster-config/1.0.0) (2026-11-25)

BREAKING CHANGE: Upgrading provider-keycloak from [v2 to v3](https://github.com/crossplane-contrib/provider-keycloak/releases?page=2#release-v3.0.0) adds a conversion webhook, as well as an additional webhook in [v3.3.0](https://github.com/crossplane-contrib/provider-keycloak/releases/tag/v3.3.0),
served by the provider pod, that must be reachable from the Kubernetes API server. On clusters where the control plane cannot reach pod IPs (e.g. EKS with an overlay CNI such as Cilium), the provider needs to run with hostNetwork until existing resources are migrated. On clusters where the control plane can reach pod IPs, no action is required.

If you are running a cluste where the control plane can reach pod IPs, upgrade to this chart version and enable `hostNetwork` for the provider in this chart's values.yaml

```yaml
hostNetworkEnabled: true
```

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
