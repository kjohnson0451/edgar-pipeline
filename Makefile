cluster-create:
	kind create cluster --name edgar-pipeline --config kind-cluster.yaml

set-context:
	kubectl config set-context --current --namespace=edgar-ns

cluster-delete:
	kind delete cluster --name edgar-pipeline

namespace: set-context
	kubectl apply -f manifests/namespaces/edgar-ns.yaml

apply: namespace secrets
	kubectl apply -k manifests/

delete:
	kubectl delete -k manifests/

secrets:
	kubectl create secret generic edgar-summarizer-secret \
		--namespace=edgar-ns \
		--from-env-file=secrets.env \
		--dry-run=client -o yaml | kubectl apply -f -

.PHONY: hooks
hooks:
	pip install pre-commit --break-system-packages
	pre-commit install --install-hooks
