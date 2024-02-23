# cube-stack

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.31.6](https://img.shields.io/badge/AppVersion-0.31.6-informational?style=flat-square)

Cube Stack is an Umbrella Chart that contains everything needed to run Cube in production.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Luc Vauvillier | <luc.vauvillier@gmail.com> |  |
| Adnan Rahic | <adnan@cube.dev> |  |
| Emmanuel Gomez | <emmanuel@pelo.tech> |  |

## Source Code

* <https://github.com/cube-js/cube.js>

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

