---
name: cicd-pipelines
description: |-
  Use this skill to design, implement, and maintain CI/CD pipelines using GitHub Actions. Activates when setting up a new project's pipeline, adding a new pipeline stage, debugging a failing workflow, or when the user asks about CI/CD, GitHub Actions, or automation. Teaches the agent to design pipeline stages, write GitHub Actions workflows, implement caching, manage secrets, and set up environment-based deployments.
---

# CI/CD Pipelines (GitHub Actions)

As an AI agent, automate software delivery to ensure speed, safety, and reliability. Follow the principle of failing fast by ordering pipeline stages from fastest to slowest.

## 1. CI/CD Principles
- **Automate Everything**: No manual builds, tests, or packaging.
- **Fail Fast**: Put syntax checks and linting before long-running integration tests.
- **Immutable Artifacts**: Build once, deploy the same artifact to multiple environments.

## 2. Standard Pipeline Stages
Pipelines must be structured in this order:
1. **Lint & Format Check** (Fastest, ~10 seconds)
2. **Build / Compile** (Ensure code is syntactically correct)
3. **Unit Tests** (Run isolated logic tests)
4. **Integration Tests** (Test cross-module functionality)
5. **Security Scan (SAST)** (Scan code for vulnerabilities)
6. **Build Image/Package** (Create the deployable artifact)
7. **Deploy to Staging** (Automated continuous delivery)
8. **E2E Tests** (Run against staging environment)
9. **Deploy to Production** (Manual approval or automated on main)

## 3. GitHub Actions Concepts
- **Workflows**: Defined in `.github/workflows/`, triggered by events (push, PR).
- **Jobs**: Run in parallel by default. Use `needs:` to sequence them.
- **Steps**: Individual tasks (run a script, use an action) inside a job.
- **Environments**: Logical deployment targets (e.g., `staging`, `production`) mapped to protection rules.

## 4. Branch-Based Rules
Configure triggers appropriately:
- **Every push to feature branch**: Lint + Build + Unit Tests.
- **Every Pull Request to main**: Lint + Build + Unit Tests + Integration Tests + Security Scan.
- **Merge to main**: Build deployable artifact + Deploy to Staging + E2E Tests.
- **Release (Tag)**: Deploy to Production.

## 5. Caching Strategies
Always implement caching to keep pipelines fast (<10 min):
- Use `actions/setup-node` or `actions/setup-python` built-in caching for dependencies.
- Use `actions/cache` for build artifacts.
- Use Docker layer caching for container builds.

## 6. Secrets Management
- NEVER hardcode secrets in YAML or code.
- Map repository secrets (`${{ secrets.API_KEY }}`) as environment variables in jobs.
- Use Environment-level secrets for deployment targets (Staging DB vs Prod DB).

## 7. Status Badges & Checks
- Add workflow status badges to the `README.md`.
- Enforce required status checks in GitHub Branch Protection rules.
