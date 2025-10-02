# 📝 Terraform Plan Workflow Explanation# 


##  This GitHub Actions workflow automates Terraform plan execution on pull requests to the main branch. It uses a self-hosted runner and Azure Service Principal for authentication.

****⚡How It Works****

Trigger

The workflow runs on pull requests targeting the main branch.

Permissions

The runner has read access to repository contents and write access to pull request comments.

Job Execution

A single job named **Terraform Plan** runs on a self-hosted runner.

Uses Bash as the default shell for script execution.

Environment Setup

Azure credentials and GitHub token are set as environment variables:

**ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID** 

GITHUB_TOKEN for commenting on PRs

Steps

**Checkout repository**

Uses actions/checkout@v4 to clone the repository.

Fetch depth is set to 2 commits to allow comparing recent changes.

**Azure CLI Login**

Logs in to Azure using a Service Principal, enabling Terraform to deploy resources.

**Setup Terraform**

Installs Terraform version 1.11.1 using hashicorp/setup-terraform@v3.

Enables Terraform wrapper for consistent CLI usage.

**Terraform Format** (terraform fmt)

Automatically formats all .tf files recursively.

Ensures code consistency and style compliance before planning.

Detect Changed Terraform Directories & Run Terraform Plan

Compares changes in the pull request with origin/main to identify modified .tf files.

Extracts directories from changed files, ignoring specific directories (ignored_dirs).

**For each changed directory**:

Initializes Terraform (terraform init).

Runs terraform plan to generate an execution plan.

Converts the plan to a readable .txt file using terraform show.

Moves the plan files to a central plans directory.

Posts the plan as a comment on the pull request for review.

## **✅ Benefits**

Automated PR Feedback

Developers can see Terraform plans directly in PR comments without running Terraform locally.

Consistency & Code Quality

terraform fmt ensures consistent formatting across all Terraform files.

Selective Execution

Only changed directories are processed, reducing unnecessary runs.

Ignored directories allow flexibility for non-active or backend modules.

### **Self-Hosted Runner**

Uses a dedicated VM for faster execution and avoids GitHub-hosted runner limitations.

## Secure & Centralized

Azure Service Principal credentials are stored in secrets, ensuring secure access.

Plan files are stored in a structured plans directory for traceability.

Improved Collaboration

PR comments let team members review infrastructure changes before deployment.
