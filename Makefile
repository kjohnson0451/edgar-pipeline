cluster-create:
	kind create cluster --name edgar-pipeline --config kind-cluster.yaml

cluster-delete:
	kind delete cluster --name edgar-pipeline

apply:
	kubectl apply -k manifests/

delete:
	kubectl delete -k manifests/
