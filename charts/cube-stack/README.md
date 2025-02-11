# cube-stack

### version: 0.3.0<!-- x-release-please-version -->

![AppVersion: 0.31.6](https://img.shields.io/badge/AppVersion-0.31.6-informational?style=flat-square)

Cube Stack is an Umbrella Chart that contains everything needed to run Cube in production.

## Maintainers

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 17.1.* |
| oci://ghcr.io/pelotech/charts | cubejs | 0.2.0 |
| oci://ghcr.io/pelotech/charts | cubestore | 0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cubejs.enabled | bool | `true` |  |
| global.cubestore.enabled | bool | `true` |  |
| global.redis.enabled | bool | `true` |  |

