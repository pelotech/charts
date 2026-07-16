{{/*
Expand the name of the chart.
*/}}
{{- define "lrsql.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* vim: set filetype=mustache: */}}
{{/*
Return the proper lrsql image name.
Prefers image.digest; otherwise uses image.tag, defaulting to the chart appVersion.
*/}}
{{- define "lrsql.image" -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion -}}
{{- $ref := ternary (printf "@%s" .Values.image.digest) (printf ":%s" $tag) (not (empty .Values.image.digest)) -}}
{{- if .Values.image.registry -}}
{{- printf "%s/%s%s" .Values.image.registry .Values.image.repository $ref -}}
{{- else -}}
{{- printf "%s%s" .Values.image.repository $ref -}}
{{- end -}}
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
