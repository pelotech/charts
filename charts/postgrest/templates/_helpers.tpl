{{- define "database.connection" -}}
{{- $username := .Values.database.connection.username }}
{{- $password := .Values.database.connection.password }}
{{- $database := .Values.database.connection.database }}
{{- $hostname := .Values.database.connection.hostname }}
{{- printf "user=%s password=%s host=%s dbname=%s sslmode=disable" $username $password $hostname $database }}
{{- end -}}

{{- define "postgrest.image" -}}
{{- $registry := .Values.image.registry }}
{{- $repository := .Values.image.repository }}
{{- $tag := default .Chart.AppVersion .Values.image.tag }}
{{- if .Values.image.digest }}
{{- printf "%s/%s@%s" $registry $repository .Values.image.digest }}
{{- else }}
{{- printf "%s/%s:%s" $registry $repository $tag }}
{{- end }}
{{- end -}}

{{- define "postgrest.jwks.image" -}}
{{- $registry := .Values.jwks.image.registry }}
{{- $repository := .Values.jwks.image.repository }}
{{- if .Values.jwks.image.digest }}
{{- printf "%s/%s@%s" $registry $repository .Values.jwks.image.digest }}
{{- else }}
{{- printf "%s/%s:%s" $registry $repository .Values.jwks.image.tag }}
{{- end }}
{{- end -}}

{{- define "postgrest.jwks.path" -}}
{{- printf "%s/%s" (trimSuffix "/" .Values.jwks.mountPath) .Values.jwks.filename }}
{{- end -}}
