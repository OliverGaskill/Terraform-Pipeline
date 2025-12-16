Terraform CI/CD for Azure using GitHub Actions
Overview

This project demonstrates a production-style Terraform CI/CD workflow for Azure using GitHub Actions and a self-hosted runner.
It follows Infrastructure as Code best practices by separating plan and apply, enforcing manual review, and limiting deployments to only changed Terraform directories.

The workflow is designed for team collaboration, security, and cost efficiency.

Architecture & Flow
Pull Request → Terraform Plan → PR Review → Manual Apply → Merge


All infrastructure changes are reviewed before being applied

No Terraform commands are run locally

Azure authentication is handled securely via Service Principal

Why This Design?
Separate Plan & Apply

Prevents accidental deployments

Allows teams to review changes before applying

Matches real-world DevOps and CloudOps workflows

Manual Apply Before Merge

Ensures infrastructure is actually deployed before code is merged

Avoids “merged but not applied” drift

Common pattern in platform and DevOps teams

Selective Directory Execution

Only directories with changed .tf files are processed

Shared or backend modules can be excluded

Improves performance and reduces risk

Self-Hosted Runner

Faster execution and full environment control

Avoids GitHub-hosted runner limitations

Cost-effective for frequent Terraform runs

Terraform Plan Workflow

Triggered automatically on pull requests targeting main.

Steps:

Authenticate to Azure using a Service Principal

Run terraform fmt to ensure consistent code style

Detect changed Terraform directories

Run terraform init and terraform plan

Convert plan output to readable .txt

Post the plan directly as a PR comment

This allows reviewers to see exact infrastructure changes without running Terraform locally.

Terraform Apply Workflow (Manual)

Triggered manually before merging the pull request.

Steps:

Authenticate to Azure

Re-run terraform init and terraform plan

Apply changes using terraform apply -auto-approve

Apply only the directories changed in the PR

⚠️ Pull requests must not be merged before the Apply workflow is executed.

Security Considerations

Azure credentials are stored securely in GitHub Secrets

No secrets are stored locally

CI/CD communication is restricted to HTTPS (port 443)

All infrastructure changes are auditable through PR history

Benefits

Safe: Manual review and apply prevent unintended changes

Efficient: Only modified Terraform code is executed

Collaborative: Plans are visible directly in PR comments

Traceable: Full audit trail of infrastructure changes

Scalable: Designed to support multiple teams and environments

Technologies Used

Terraform

Azure

GitHub Actions

Self-hosted GitHub Runner

PowerShell

Git

What This Project Demonstrates

Real-world Terraform CI/CD patterns

Secure Azure authentication for automation

Infrastructure-as-Code best practices

DevOps collaboration workflows

Cost-aware CI/CD design

