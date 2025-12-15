up:
	kind create cluster --name first-kind-kluster --config first-kind-kluster-demo.yaml
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
	@echo "Waiting for Ingress Controller..."
	sleep 15
	kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s
	kubectl apply -f manifests/
down:
	kind delete cluster --name first-kind-kluster
info:
	kubectl get pods -n first-kind-kluster
	kubectl get ingress -n first-kind-kluster