{{- define "pelostage.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "pelostage.fullname" -}}
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

{{- define "pelostage.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
{{ include "pelostage.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.commonLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{- define "pelostage.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pelostage.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "pelostage.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pelostage.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Secret holding the GitHub App credentials */}}
{{- define "pelostage.secretName" -}}
{{- default (include "pelostage.fullname" .) .Values.secrets.existingSecret }}
{{- end }}

{{/* CloudNativePG cluster name; mirrors cluster.fullname in the cnpgCluster subchart */}}
{{- define "pelostage.cnpgClusterName" -}}
{{- $cnpg := .Values.cnpgCluster }}
{{- if $cnpg.fullnameOverride }}
{{- $cnpg.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "cnpgCluster" $cnpg.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/* "true" when pelostage uses Postgres (CNPG or external); empty for in-memory SQLite */}}
{{- define "pelostage.usePostgres" -}}
{{- if or .Values.cnpgCluster.enabled .Values.database.external.host }}true{{- end }}
{{- end }}

{{/* Ingress host: ingress.host, or the host of portal.baseUrl */}}
{{- define "pelostage.ingressHost" -}}
{{- default (urlParse .Values.portal.baseUrl).hostname .Values.ingress.host }}
{{- end }}

{{/* Fail early on value combinations that cannot work */}}
{{- define "pelostage.validate" -}}
{{- if and .Values.cnpgCluster.enabled .Values.database.external.host }}
{{- fail "set either cnpgCluster.enabled or database.external.host, not both" }}
{{- end }}
{{- if and (gt (int .Values.replicaCount) 1) (not (include "pelostage.usePostgres" .)) }}
{{- fail "replicaCount > 1 needs Postgres: each replica would have its own in-memory SQLite catalog" }}
{{- end }}
{{- end }}
