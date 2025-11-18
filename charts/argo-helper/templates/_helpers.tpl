{{/*
Expand the name of the chart.
*/}}
{{- define "argo-cd-resources.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "argo-cd-resources.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "argo-cd-resources.labels" -}}
helm.sh/chart: {{ include "argo-cd-resources.chart" . }}
{{ include "argo-cd-resources.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "argo-cd-resources.selectorLabels" -}}
app.kubernetes.io/name: {{ include "argo-cd-resources.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
