# CI/CD Best Practices Deep-Dive

## 1. Speed is a Feature (<10 Minutes)
If a pipeline takes longer than 10 minutes, developers lose focus and context switch.
- **Parallelism**: Split large test suites into parallel jobs. Use matrix strategies.
- **Caching**: Cache everything possible. In Node.js, caching `~/.npm` is good, but caching `node_modules` (if package-lock.json hasn't changed) is faster.

## 2. Dealing with Flaky Tests
Flaky tests destroy trust in the CI system.
- Quarantine flaky tests immediately (move them to a separate, non-blocking test suite).
- Never just "re-run the pipeline until it passes." Fix or delete the test.

## 3. Pipeline Security
- **OIDC (OpenID Connect)**: Avoid storing long-lived cloud credentials (like AWS IAM Keys) in GitHub Secrets. Use OIDC to let GitHub Actions assume a temporary role in your cloud provider.
- **Least Privilege**: Ensure the GitHub token (`GITHUB_TOKEN`) has read-only permissions by default, elevating to write only when necessary (e.g., for creating a release).

## 4. Self-Hosted Runners
Use GitHub-hosted runners for standard workloads. Migrate to self-hosted runners ONLY when:
- You need specific hardware (e.g., GPUs).
- You need internal network access (VPC) without opening a VPN.
- Your build times are constrained by GitHub's CPU/RAM limits.

## 5. Pipeline Observability
Monitor your CI/CD health just like your application health.
- Track metrics: Pipeline success rate, average duration, time to recovery.
- Alert the team immediately in Slack/Teams if the `main` branch build breaks.
