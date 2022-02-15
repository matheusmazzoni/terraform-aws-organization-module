cnf ?= .env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

TERRAFORM_VERSION=1.0.9


.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

terraform: ## Shell Terraform console
	@docker run -it --rm \
	-v $$PWD:/app -v $$HOME/.ssh/:/root/.ssh/ \
	-w /app/ \
	-e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION=$$AWS_DEFAULT_REGION \
	--entrypoint "" \
	hashicorp/terraform:$(TERRAFORM_VERSION) sh
