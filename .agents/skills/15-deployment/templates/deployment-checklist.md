# Deployment Checklist

## 1. Pre-Deployment (Planning)
- [ ] CI/CD pipeline is fully green for target branch.
- [ ] Database migrations are reviewed and backward-compatible.
- [ ] Environment variables/secrets are added to target environment.
- [ ] Rollback plan is documented and understood.
- [ ] Team has been notified in `#deployments` channel.

## 2. During Deployment (Execution)
- [ ] Database migrations applied successfully.
- [ ] Application deployment triggered.
- [ ] Automated health checks passing (200 OK).

## 3. Post-Deployment (Verification)
- [ ] Smoke tests passing manually or automatically.
- [ ] Logs reviewed for new warnings/errors.
- [ ] Monitoring dashboards stable (Latency, CPU, Error Rate) for 15 minutes.
- [ ] Feature flags toggled ON (if applicable).
- [ ] Team notified of successful deployment.
