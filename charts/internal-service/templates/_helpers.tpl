{{- define "internal-service.name" -}}
internal-service
{{- end }}

{{- define "internal-service.fullname" -}}
{{ include "internal-service.name" . }}-{{ .Release.Name }}
{{- end }}
