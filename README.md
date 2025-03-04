# Enhancing Terraform with Terragrunt: VPC & GKE Demonstration in Google Cloud Platform

This repository has been created as a demo to showcase how Terragrunt can be used to apply the DRY code principle. You can use it for testing purposes. It is not suitable for a production environment. To use it in production, you need to implement additional security measures and configuration settings. You can use this demo as a template.

## How to Install Terragrunt?

Please follow the documentation from [here](https://terragrunt.gruntwork.io/docs/getting-started/install/)

## Usage

### Deploy Modules Individually

You can use the following commands to deploy the modules of an environment individually.

```bash
# Plan
terragrunt plan --working-dir .\environments\<<environment-name>>\gke
terragrunt plan --working-dir .\environments\<<environment-name>>\vpc

# Apply
terragrunt apply --working-dir .\environments\<<environment-name>>\gke
terragrunt apply --working-dir .\environments\<<environment-name>>\vpc

# Destroy
terragrunt destroy --working-dir .\environments\<<environment-name>>\gke
terragrunt destroy --working-dir .\environments\<<environment-name>>\vpc
```

### Stack Deployment

You can use the following commands to deploy all modules defined for the environment as a stack.

```bash
# Plan
terragrunt run-all plan --queue-include-dir .\environments\<<environment-name>>\*

# Apply
terragrunt run-all apply --queue-include-dir .\environments\<<environment-name>>\*

# Destroy
terragrunt run-all destroy --queue-include-dir .\environments\<<environment-name>>\*
```

### Custom Stack Deployment

If you want to deploy a specific module across all environments, you can use the following command.

```bash
# Plan
terragrunt run-all plan --queue-include-dir .\environments\*\<<module-name>>

# Apply
terragrunt run-all apply --queue-include-dir .\environments\*\<<module-name>>

# Destroy
terragrunt run-all destroy --queue-include-dir .\environments\*\<<module-name>>
```

## Bonus: Chekov Integration

Checkov scans cloud infrastructure configurations to detect misconfigurations before they're deployed.

### Installation

You can install checkov from PyPI

```bash
pip install checkov
```

### Scan the Repository

You can perform the scan by providing the directory of your Terraform files.

```bash
checkov -d modules
```

### Alternative: Scan the Repository Using Docker

You can also use Checkov with Docker.

```bash
docker pull bridgecrew/checkov
docker run --tty --volume /modules:/tf --workdir /tf bridgecrew/checkov --directory /tf
```

### Add Custom Config to Checkov

You can run your custom Checkov configuration with the following command.

```bash
checkov -d modules --config-file <<your-checkov-config-file.yaml>>
```

### Example Output

```bash
Check: CKV_GCP_123: "GKE Don't Use NodePools in the Cluster configuration"
        PASSED for resource: google_container_cluster.example-cluster
        File: /gke/main.tf:7-26
        Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/google-cloud-policies/google-cloud-kubernetes-policies/bc-google-cloud-123
Check: CKV_GCP_21: "Ensure Kubernetes Clusters are configured with Labels"
        PASSED for resource: google_container_cluster.example-cluster
        File: /gke/main.tf:7-26
        Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/google-cloud-policies/google-cloud-kubernetes-policies/bc-gcp-kubernetes-13
Check: CKV_GCP_18: "Ensure GKE Control Plane is not public"
        PASSED for resource: google_container_cluster.example-cluster
        File: /gke/main.tf:7-26
        Guide: https://docs.prismacloud.io/en/enterprise-edition/policy-reference/google-cloud-policies/google-cloud-kubernetes-policies/bc-gcp-kubernetes-10
...
```
