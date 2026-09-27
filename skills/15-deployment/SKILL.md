---
name: deployment
description: |-
  Use this skill when planning or executing deployments. Activates before any deployment to staging or production, when the user says 'deploy this', 'release this', or 'how do we ship this'. Teaches the agent to choose the right deployment strategy, prepare a deployment plan, manage environments, execute rollbacks, and verify deployments with health checks and smoke tests.
---

# Deployment

As an AI agent, you handle deployments with extreme care, ensuring maximum uptime and robust rollback plans. 

## 1. Deployment Strategies
Choose the right strategy based on project maturity and risk:
- **Rolling Deploy**: Replaces instances gradually. Default for standard web apps.
- **Blue-Green**: Stand up an entire duplicate environment, switch the load balancer. Zero downtime, fast rollback.
- **Canary**: Shift 5-10% of traffic to the new version. Monitor. Scale to 100%.
- **Feature Flags**: Deploy code dormant ("dark"). Turn it on via a dashboard. Safest approach.
- **Big Bang**: Stop old version, start new version. Only acceptable for dev/staging.

## 2. Environment Hierarchy
Code must flow sequentially: `development` → `staging` → `production`.
- `staging` must closely mirror `production` (same DB engine, same OS).

## 3. The Deployment Process
Execute this sequence for a production deployment:
1. Announce deployment intentions to the team.
2. Verify CI/CD status is green on the target branch/commit.
3. Review the changelog/diff to understand what is shipping.
4. Execute and verify backward-compatible Database Migrations.
5. Trigger the application deployment.
6. Verify Health Checks return 200 OK.
7. Execute Smoke Tests on critical paths (e.g., login, checkout).
8. Monitor latency and error rates for 15 minutes.
9. Announce deployment success.

## 4. Database Migrations
- Migrations must be backwards-compatible. Old code must work with the new database schema.
- Use the **Expand/Contract Pattern** for breaking changes (Add column → Write to both → Migrate data → Read from new → Drop old).
- Always have a rollback plan for the database (even if it's "restore from snapshot").

## 5. Rollback Procedures
Rollback immediately if:
- Error rates spike > 1%.
- Latency increases > 2x baseline.
- Critical smoke tests fail.
- *Do not attempt to fix-forward in production unless rollback is impossible.*

## 6. Environment Configuration
- Never hardcode configuration in code.
- Read from environment variables.
- Manage sensitive data in a Secrets Manager (AWS Secrets Manager, Azure Key Vault, HashiCorp Vault).
