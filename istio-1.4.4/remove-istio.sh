istioctl manifest generate | kubectl delete -f -
kubectl delete -f istio-1.4.3/samples/bookinfo/telemetry/metrics.yaml
killall kubectl
killall istioctl