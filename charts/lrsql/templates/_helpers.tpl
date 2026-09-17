{{/*
Expand the name of the chart.
*/}}
{{- define "lrsql.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* vim: set filetype=mustache: */}}
{{/*
Return the proper lrsql image name.
The tag defaults to the chart appVersion, pinned to the digest in the chart annotations.
An overridden semver tag must not be older than appVersion.
*/}}
{{- define "lrsql.image" -}}
{{- $registry := default .Values.image.registry ((.Values.global).imageRegistry) -}}
{{- $tag := default .Chart.AppVersion .Values.image.tag | toString -}}
{{- $digest := .Values.image.digest -}}
{{- if not .Values.image.tag -}}
{{- $digest = default (index (.Chart.Annotations | default dict) "pelotech.io/image-digest") $digest -}}
{{- else if and (regexMatch "^v?[0-9]+\\.[0-9]+\\.[0-9]+" $tag) (not (semverCompare (printf ">=%s-0" .Chart.AppVersion) $tag)) -}}
{{- fail (printf "image.tag %s is older than the minimum supported lrsql version %s" $tag .Chart.AppVersion) -}}
{{- end -}}
{{- $image := printf "%s:%s" .Values.image.repository $tag -}}
{{- if $registry -}}
{{- $image = printf "%s/%s" $registry $image -}}
{{- end -}}
{{- if $digest -}}
{{- $image = printf "%s@%s" $image $digest -}}
{{- end -}}
{{- $image -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lrsql.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "lrsql.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lrsql.labels" -}}
helm.sh/chart: {{ include "lrsql.chart" . }}
{{ include "lrsql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.commonLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lrsql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lrsql.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "lrsql.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "lrsql.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
