The Docker Image contains the aws-cli and kubectl. It is used to update the AWS ECR credentials periodically in a kubernetes cluster.

```bash
docker pull ghcr.io/marvinpinto/aws-kubectl:latest
```

# Setup

You need to set your credentials in the aws-secrets.yml. Also you need to set your AWS_ACCOUNT, AWS_REGION and NAMESPACES in ecr-cron.yml.
Afterwords run:

	aws.sh

Afterwords you should be able to see the cron job with:

	kubectl get cronjobs -n infrastructure

# Thanks

Originally forked from: https://github.com/Odania-IT/aws-kubectl
