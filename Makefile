OIDC_STACK_NAME := github-oidc
all:
	@echo "commands: deploy,delete"

deploy:
	aws cloudformation deploy --stack-name ${OIDC_STACK_NAME} --template-file aws-iam-oidc.yml \
		--capabilities CAPABILITY_NAMED_IAM

delete:
	aws cloudformation delete-stack --stack-name ${OIDC_STACK_NAME}
	aws cloudformation wait stack-delete-complete --stack-name ${OIDC_STACK_NAME}
