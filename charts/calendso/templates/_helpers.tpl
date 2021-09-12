{{/*
Expand the name of the chart.
*/}}
{{- define "calendso.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "calendso.fullname" -}}
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
{{- define "calendso.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "calendso.labels" -}}
helm.sh/chart: {{ include "calendso.chart" . }}
{{ include "calendso.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "calendso.selectorLabels" -}}
app.kubernetes.io/name: {{ include "calendso.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Database URL
*/}}
{{- define "calendso.databaseURL" -}}
{{- if eq .Values.config.databaseURL "" -}}
postgresql://{{ .Values.global.postgresql.postgresqlUsername }}:{{ .Values.global.postgresql.postgresqlPassword }}@{{ .Values.postgresql.fullnameOverride }}:5432/{{ .Values.global.postgresql.postgresqlDatabase }}
{{- else -}}
{{ .Values.config.databaseURL }}
{{- end -}}
{{- end }}

{{/*
Telemetry Key
*/}}
{{- define "calendso.telemetryKey" -}}
{{- if .Values.config.collectAnonymousUsage -}}
js.2pvs2bbpqq1zxna97wcml.oi2jzirnbj1ev4tc57c5r
{{- end -}}
{{- end }}

{{/*
Environment variable sources
*/}}
{{- define "calendso.envSources" -}}
{{- if .Values.externalConfigSecret -}}
- secretRef:
    name: {{ .Values.externalConfigSecret }}
{{- else -}}
- secretRef:
    name: {{ include "calendso.fullname" . }}-base-env
{{- $secrets := compact (list .Values.config.googleCredentialsSecret .Values.config.msCredentialsSecret .Values.config.zoomCredentialsSecret .Values.config.encryptionKeySecret .Values.config.email.smtpCredentialsSecret | uniq) -}}
{{- range $idx, $secret := $secrets }}
- secretRef:
    name: {{ $secret }}
{{- end }}
{{- end }}
{{- end }}