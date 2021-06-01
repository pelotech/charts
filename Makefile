lint:
	helm lint charts/*

docs:
	docker run \
		--rm \
		--volume "$(PWD)/charts:/helm-docs" \
		-u $(shell id -u) \
		jnorwood/helm-docs:latest