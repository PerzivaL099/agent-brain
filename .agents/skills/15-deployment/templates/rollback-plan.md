# Rollback Plan

## Triggers (When to Rollback)
*Initiate rollback immediately if any of the following occur within 15 mins of deploy:*
- [ ] API error rates exceed [X]%
- [ ] P99 Latency exceeds [Y]ms
- [ ] Critical path failure (e.g., users cannot log in)
- [ ] High severity alert triggered in monitoring system

## Decision Maker
- Primary: [Name/Role]
- Secondary: [Name/Role]

## Application Rollback Steps
1. [Action 1: e.g., Revert GitHub Actions deployment target to previous git tag]
2. [Action 2: e.g., Switch Blue/Green load balancer back to Blue]
3. Verify application health check on reverted version.

## Database Rollback Steps (If applicable)
*Note: Prefer rolling forward or backward-compatible migrations. Destructive schema rollbacks are high risk.*
1. [Action 1: e.g., Run down-migration scripts for migrations X and Y]
2. [Action 2: e.g., Restore from pre-deploy snapshot if data corrupted]

## Post-Rollback Actions
1. Notify team in `#deployments` channel.
2. Mark original PR/release as rolled back.
3. Schedule post-mortem to analyze failure root cause.
