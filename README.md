🌍 Terraform Workflows

This repository uses GitHub Actions (Self Hosted Runners) to automate the Terraform workflows on Azure. It includes two key workflows:

✅ Terraform Plan (on Pull Request)

Path: .github/workflows/terraform-plan.yml

Trigger: Pull Requests to the main branch 

This workflow performs the following:

Checks out the repository with the last 2 commits.

Authenticates with Azure using a service principal.

Installs Terraform using the specified version (1.11.1).

Formats Terraform files with terraform fmt -recursive.

Detects changed directories by comparing .tf file changes between the PR and main.

Skips ignored directories (configurable).

Runs terraform init and terraform plan for each affected directory.

Generates a plan output (tfplan) and a human-readable version (tfplan.txt).

Comments the Terraform plan output directly on the PR using the GitHub CLI.

💬 This helps reviewers quickly understand what Terraform will change before merging.

🚀 Terraform Apply (on Manual Trigger)

Path: .github/workflows/terraform-apply.yml

Trigger: Manually via the "Run workflow" button on GitHub (workflow_dispatch)

This workflow applies the planned changes:

Checks out the repository.

Authenticates with Azure using the same service principal credentials.

Installs Terraform (1.11.1).

Detects .tf changes since the last commit on main.

Skips ignored directories (configurable).

Initializes Terraform (terraform init).

Runs a fresh plan (terraform plan -out=tfplan).

Applies the plan automatically (terraform apply -auto-approve tfplan) for each changed directory.

⚠️ Only use this after reviewing the Terraform Plan to ensure safe deployments.

🛠 Customize Ignored Directories
Both workflows support ignoring specific directories by modifying the ignored_dirs array. This is useful if certain modules are experimental or not ready for deployment.
