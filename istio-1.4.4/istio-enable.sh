kubectl label namespace default istio-injection=enabled

# Apply a YAML file with configuration for the new metric that Istio will generate and collect automatically.
# kubectl apply -f istio-1.4.3/samples/bookinfo/telemetry/metrics.yaml
istioctl manifest apply --set values.grafana.enabled=true
istioctl manifest generate  > $HOME/generated-manifest.yaml
istioctl verify-install -f $HOME/generated-manifest.yaml
istioctl dashboard grafana --namespace default &
istioctl dashboard prometheus & # istio_request_local