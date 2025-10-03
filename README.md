# **🌱 Terraform CI/CD Workflow (Plan & Apply)**

**This workflow automates Terraform infrastructure management using GitHub Actions with a self-hosted runner and Azure Service Principal. It splits into two stages: Plan and Apply, ensuring safe and controlled deployments.**

```
🔹Workflow Overview
Pull Request to main
        │
        ▼
   Terraform Plan
        │
   Review Plan Output
        │
⚠️ MANUAL STEP: Trigger Apply Workflow
        │
        ▼
   Terraform Apply
        │
        ▼
Merge Pull Request

```


## Pull Request Trigger

Workflow runs automatically on pull requests targeting main.

Terraform Plan detects changes in .tf files only.

### Terraform Plan Workflow

Checks out the repo and logs in to Azure using Service Principal credentials.

Sets up Terraform (1.11.1) and formats .tf files automatically.

Detects directories with modified Terraform files, excluding any ignored directories (e.g., backend modules).

Runs terraform init and terraform plan in each changed directory.

Converts the plan to a readable .txt file and posts it as a PR comment.

## **Manual Review**

Developers review the Terraform plan in PR comments.

Ensures all proposed changes are correct before deployment.

### ⚠️ Manual Terraform Apply

**Important: The Apply workflow must be manually triggered before merging the pull request.**

Checks out the repository and logs in to Azure.

Runs terraform init, plan, and apply -auto-approve on changed directories.

Only applies changes in directories that were modified in the PR.

### ❗ Do not merge the pull request before manually running the Apply workflow.
 This ensures infrastructure changes are actually deployed and prevents unreviewed code from being merged.

## 🔹 Key Features

Automated PR Feedback

Plan workflow posts detailed Terraform plans as PR comments for easy review.

Selective Execution

Only directories with .tf changes are processed.

Ignored directories are skipped, protecting backend or shared modules.

## Secure Deployment

Azure Service Principal credentials are stored securely in GitHub secrets.

Manual Apply ensures that changes are deployed only after review.

Consistency & Collaboration

terraform fmt ensures code style consistency.

Teams can safely collaborate and review changes before deployment.

Self-Hosted Runner

Provides faster execution, full environment control, and avoids GitHub-hosted runner limitations.

### ✅ Benefits

Safe and Predictable: Manual approval and manual Apply step prevent accidental deployments.

Efficient: Only changed Terraform modules are processed, saving time.

Collaborative: PR comments improve visibility of infrastructure changes.

Traceable: All plan outputs are visible before applying.

No Need for secrets locally, eveything runns between the runner and the service principal

<img width="908" height="779" alt="image" src="https://github.com/user-attachments/assets/9a23f87c-446c-4dae-bd7e-b6000777f66b" />

