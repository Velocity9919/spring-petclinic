{{- define "spring-petclinic.labels" -}}
app: docker-spring-boot
env: {{ .Values.app.env  }}
{{- end -}}
