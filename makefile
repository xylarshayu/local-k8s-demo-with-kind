# Default to dev if no ENV variable is passed
ENV ?= dev

up:
	kind create cluster --name first-kind-kluster --config first-kind-kluster-demo.yaml
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
	@echo "Waiting for Ingress Controller..."
	sleep 15
	kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s
deploy:
	@echo "Deploying $(ENV) environment..."
	helm upgrade --install $(ENV) ./chart -n $(ENV) --create-namespace -f config/values-$(ENV).yaml
deploy-all:
	make deploy ENV=dev
	make deploy ENV=qa
down:
	kind delete cluster --name first-kind-kluster
info:
	@echo "--- Status for $(ENV) ---"
	kubectl get pods,svc,ingress -n $(ENV)