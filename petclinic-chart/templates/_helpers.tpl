{{- define "spring-petclinic.labels" -}}
app: spring-petclinic
env: {{ .Values.app.env }}
{{- end -}}
