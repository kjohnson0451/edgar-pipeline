cluster-create:
	kind create cluster --name edgar-pipeline --config kind-cluster.yaml

set-context:
	kubectl config set-context --current --namespace=edgar-ns

cluster-delete:
	kind delete cluster --name edgar-pipeline

apply: set-context
	kubectl apply -k manifests/

delete:
	kubectl delete -k manifests/

.PHONY: hooks
hooks:
	pip install pre-commit --break-system-packages
	pre-commit install --install-hooks
