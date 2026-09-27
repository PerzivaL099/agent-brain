# Pre-Deployment Checklist

> **Purpose**: Ensure every production deployment is safe, deliberate, and reversible. This checklist must be completed before initiating any deployment to production. Do not skip items — if an item cannot be satisfied, escalate before proceeding.
>
> **When to use**: Before any production deployment. Also recommended before deploying to staging environments.
>
> **Severity**: This is a quality and safety gate. Deploying to production without a complete checklist is a process violation.

---

## Deployment Information

```
Deployment ID:        [DEPLOY-YYYY-MM-DD-NNN]
Feature/Release:      [Brief description of what is being deployed]
Version / Tag:        [vX.Y.Z or commit SHA]
Environment:          [Production / Staging / etc.]
Deployment Method:    [GitHub Actions / Manual / K8s rollout / etc.]
Deployment Window:    [YYYY-MM-DD HH:MM – HH:MM TZ]
Deploying:            [Name or agent]
Approved By:          [Name of approver]
Rollback Commit/Tag:  [Previous stable version identifier]
GitHub PR(s):         [Links to all PRs included in this deployment]
GitHub Issues:        [Links to all Issues resolved in this deployment]
```

---

## Section 1: Code & Build Verification

> *Confirm that what you're deploying is what you think you're deploying.*

- [ ] **All PRs for this deployment are merged to `main`** — No orphaned branches
- [ ] **The correct commit/tag is confirmed** — Verify the exact commit SHA or tag being deployed
  - Expected tag/SHA: `___________`
  - Confirm with: `git log --oneline -5` on the deploy branch
- [ ] **All CI checks passed on this exact commit** — Not just "CI was green at some point"
  - Link to CI run: `___________`
  - Lint: ✅ | Tests: ✅ | Build: ✅ | Security scan: ✅
- [ ] **Build artifact is verified** — If using a build system, confirm the artifact was built from the correct commit
- [ ] **No uncommitted changes** will be included in the deployment
- [ ] **Dependency lock file is committed** — `package-lock.json`, `Pipfile.lock`, `go.sum`, `Gemfile.lock`, etc.

---

## Section 2: Testing Verification

> *Production should only receive code that has been thoroughly tested.*

- [ ] **All unit tests passing** in CI for this deployment's commit
- [ ] **All integration tests passing** in CI for this deployment's commit
- [ ] **All end-to-end tests passing** in CI for this deployment's commit (if the suite is automated)
- [ ] **Manual regression testing complete** (if automated suite does not cover critical paths):
  - [ ] Tested in staging environment
  - [ ] Tested against realistic data (not just toy data)
  - [ ] All affected user flows verified
- [ ] **Performance testing complete** (if this deployment includes changes that could affect performance):
  - [ ] Load test results reviewed
  - [ ] Response time benchmarks within acceptable range
  - [ ] No memory leak indicators
- [ ] **Security testing complete** (if this deployment includes security-sensitive changes):
  - [ ] Penetration test or security review conducted
  - [ ] Dependency vulnerability scan passed: `[audit tool] — 0 critical/high vulnerabilities`
- [ ] **Coverage threshold met** — Code coverage did not regress below the project threshold

---

## Section 3: Deployment Plan Review

> *Know exactly what is happening, in what order, and why.*

- [ ] **Deployment plan is documented** and accessible to the team:
  - What steps will be executed?
  - In what order?
  - What is the estimated duration of each step?
  - What does success look like at each step?
- [ ] **Deployment plan has been reviewed** by at least one other engineer
- [ ] **Database migrations included in this deployment are identified**:
  - List of migration files: `___________`
  - *(If no migrations: explicitly confirm "No migrations in this deployment")*
- [ ] **Infrastructure changes included are identified**:
  - New services, queues, storage buckets, load balancer rules, DNS changes, etc.
  - *(If none: explicitly confirm "No infrastructure changes in this deployment")*
- [ ] **Feature flags reviewed** — Are any features being toggled on/off as part of this deployment?
- [ ] **Traffic/load considerations noted** — Is this deployment happening during a high-traffic period? If so, plan accordingly.

---

## Section 4: Rollback Plan

> *Hope for the best; plan for the worst. Knowing how to roll back is as important as knowing how to deploy.*

- [ ] **Rollback plan is documented explicitly** — Not implied; written out step by step
  - Previous stable version: `[tag/SHA]`
  - Rollback command/procedure: `___________`
  - Estimated rollback time: `___________`
- [ ] **Rollback has been tested** in a non-production environment (at least once per quarter, or after any deployment process change)
- [ ] **Database migrations are reversible**:
  - [ ] Each migration in this deployment has a corresponding down migration
  - [ ] Down migrations have been tested and verified
  - [ ] Data rollback strategy is documented (can rolled-back migrations undo data changes, or is a data restoration needed?)
  - *(If migrations are NOT reversible: this is a critical risk — document it, escalate, and get explicit sign-off before proceeding)*
- [ ] **Rollback decision criteria defined** — At what point do we trigger a rollback?
  - Error rate exceeds: `[threshold, e.g., >1% 5xx errors]`
  - Latency exceeds: `[threshold, e.g., p99 > 2000ms]`
  - Health check fails: `[condition]`
  - User-reported critical failure: `[condition]`
- [ ] **Team is aligned on rollback authority** — Who has the authority to call a rollback? Is that person available during the deployment window?

---

## Section 5: Database Migration Review

> *Database changes are the highest-risk category in most deployments. Treat them with extra care.*

- [ ] **All migration files are reviewed** by at least one other engineer familiar with the data model
- [ ] **Migrations are idempotent** where possible — Running them twice doesn't cause errors or data corruption
- [ ] **Migrations are backward compatible** — The old version of the application can still run against the new schema
  - Strategies: add columns as nullable before making them required; keep old columns until the old code is fully retired
- [ ] **Large table migrations are handled safely**:
  - Adding indexes: done CONCURRENTLY (PostgreSQL) or equivalent non-locking strategy
  - Large data migrations: batched, not run in a single transaction that locks the table
  - Estimated migration duration calculated: `[duration estimate]`
  - Migration lock timeout set to prevent runaway locks
- [ ] **Migration dry-run completed on staging** — Migrations have been run against production-equivalent data
- [ ] **Data backup completed** or verified:
  - [ ] Production database backup confirmed BEFORE the deployment begins
  - Backup location: `___________`
  - Backup verified (can restore from it): ☐ Yes / ☐ Verified within last `[N]` hours

---

## Section 6: Environment & Configuration

> *The right code running with the wrong configuration is still wrong.*

- [ ] **All required environment variables are set** in the production environment:
  - Use the `.env.example` or configuration schema as the source of truth
  - Cross-check each required variable against what is set in the production secrets manager
  - Variables verified: ☐
- [ ] **No new environment variables are missing** — Every variable introduced in this deployment is configured in production
- [ ] **Secrets are stored correctly** — In the secrets manager (GitHub Secrets, AWS Secrets Manager, Vault, etc.), NOT in `.env` files committed to the repo
- [ ] **Expired credentials are not being used** — API keys, tokens, certificates — check expiry dates
- [ ] **Third-party service configurations updated** (if applicable):
  - OAuth redirect URIs include the production URL
  - Webhook endpoints point to production URLs
  - API rate limits are appropriate for production load
- [ ] **Feature flags are in the correct state** for production:
  - New feature flags added in this deployment: initialized to `off` by default (release separately)
  - Flags being toggled: confirmed and approved by stakeholder

---

## Section 7: Monitoring & Alerting

> *If you can't see it, you can't debug it. Verify your observability before you ship.*

- [ ] **Monitoring dashboards exist** for the systems being modified:
  - Link to primary dashboard: `___________`
  - Key metrics being monitored: error rate, latency (p50/p95/p99), throughput, resource utilization
- [ ] **Alerts are configured** for the key failure modes of this deployment:
  - Error rate alert: set to fire at `[threshold]`
  - Latency alert: set to fire at `[threshold]`
  - Health check alert: set to fire if health check fails for `[N]` consecutive minutes
- [ ] **Alerting is connected to the on-call system** — Alerts go to a pager/Slack channel where someone will see them
- [ ] **On-call engineer is identified and available** during the deployment window and for 30 minutes post-deploy
- [ ] **Log aggregation is working** — Confirm that application logs are flowing to the centralized logging system
- [ ] **New code emits appropriate logs** — Key operations in this deployment log at appropriate levels (info, warn, error)
- [ ] **Distributed tracing is configured** (if applicable) — New code participates in the tracing context

---

## Section 8: Stakeholder Communication

> *No production change should be a surprise to the people it affects.*

- [ ] **Stakeholders have been notified of the deployment** in advance:
  - Who was notified: `[list names or groups]`
  - How they were notified: `[Slack, email, meeting, etc.]`
  - When they were notified: `[timestamp or "N hours before deployment"]`
- [ ] **User-facing downtime or degradation communicated** (if applicable):
  - Maintenance window announced on status page: ☐
  - In-app banner or notification displayed: ☐
  - Support team briefed on expected behavior during and after deployment: ☐
- [ ] **Support team briefed** on what is changing and what new issues users might report
- [ ] **Deployment window is approved** by the relevant stakeholders (product, engineering lead, ops)

---

## Section 9: Deployment Window & Timing

> *When you deploy matters almost as much as what you deploy.*

- [ ] **Deployment window is selected carefully**:
  - ☐ Avoid: peak traffic hours (check traffic patterns in your monitoring dashboard)
  - ☐ Avoid: Fridays and days before public holidays (limited response time if things go wrong)
  - ☐ Avoid: Right before the end of business day (no time to debug if something breaks)
  - ✅ Prefer: Early in the working week, during low-traffic hours, when the full team is available
- [ ] **Deployment window confirmed** with the team and stakeholders: `[YYYY-MM-DD HH:MM – HH:MM TZ]`
- [ ] **The deploying engineer is available** for the full duration of the deployment plus 30 minutes post-deploy
- [ ] **The on-call engineer is reachable** for at least 2 hours post-deployment
- [ ] **No other major deployments or events** are scheduled in the same window

---

## Section 10: Health Checks & Smoke Test Plan

> *Have a specific plan to verify the deployment worked before declaring success.*

- [ ] **Application health check endpoints configured**:
  - Health check URL(s): `___________`
  - Expected response: `[e.g., HTTP 200, JSON {"status": "ok"}]`
  - Health check is verified to work in staging: ☐
- [ ] **Smoke test plan documented** — Specific steps to verify core functionality post-deployment:
  ```
  Smoke Test Plan:
  1. [Verify endpoint X returns 200]
  2. [Verify user can log in]
  3. [Verify the new feature works: specific steps]
  4. [Verify critical background jobs are running]
  5. [Verify data is being written/read correctly]
  ```
- [ ] **Smoke tests can be run within 5 minutes** of deployment completing — Plan is fast enough to provide a quick signal
- [ ] **Rollback will be triggered immediately** if any smoke test fails
- [ ] **Synthetic monitoring or uptime checks** updated to cover new endpoints introduced in this deployment

---

## Section 11: Post-Deployment Verification (Run After Deploying)

> *Complete this section immediately after the deployment finishes.*

- [ ] **Health check endpoints return expected responses** in production
- [ ] **All smoke tests passed** against production
- [ ] **Error rate is within normal bounds** (check dashboard for 15-30 minutes post-deploy)
  - Baseline error rate: `[N%]`
  - Current error rate: `[N%]`
  - Status: ☐ Normal / ☐ Elevated (triggering rollback)
- [ ] **Latency is within normal bounds** (check p50/p99)
  - Baseline p99: `[Nms]`
  - Current p99: `[Nms]`
  - Status: ☐ Normal / ☐ Elevated
- [ ] **Application logs are clean** — No unexpected error patterns in the minutes following deployment
- [ ] **Database connections stable** — Connection pool not exhausted, query latency normal
- [ ] **Background jobs running normally** (if applicable)
- [ ] **Stakeholders notified of successful deployment**:
  - Message sent to: `[channel/people]`
  - Message: "Deployment of [version] to production completed successfully at [time]. All smoke tests passing."

---

## Final Sign-Off

Before initiating the deployment:

- [ ] ✅ All tests passing in CI on the correct commit
- [ ] ✅ Deployment plan reviewed and approved
- [ ] ✅ Rollback plan documented and tested
- [ ] ✅ Database migrations reviewed and reversible
- [ ] ✅ All environment variables verified in production
- [ ] ✅ Monitoring and alerting in place and tested
- [ ] ✅ Stakeholders notified of deployment
- [ ] ✅ Deployment window approved and timed appropriately
- [ ] ✅ Health checks configured and verified in staging
- [ ] ✅ Smoke test plan is ready and can be executed immediately post-deploy

**Deploying engineer sign-off**: `_________________` | Date: `____________`
**Approving engineer sign-off**: `_________________` | Date: `____________`

> ⚠️ **If you cannot check all items above: do not deploy. Escalate, resolve the blocker, then re-run this checklist.**

---

*Template version: 1.0 | Part of Agent SDLC Brain*
