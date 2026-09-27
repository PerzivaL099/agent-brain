# System Runbook: [Service Name]

## 1. System Overview
Briefly describe what this service does and its criticality.
- **Repository**: [Link]
- **Dashboard**: [Link to Grafana/Datadog]
- **Logs**: [Link to Kibana/Splunk]

## 2. Dependencies
What happens if these go down?
- **PostgreSQL**: Hard dependency. API will throw 500s.
- **Redis Cache**: Soft dependency. API will slow down but function.
- **Stripe API**: External. Check Stripe Status page.

## 3. Common Operations
**Restart the service:**
```bash
systemctl restart my-service
# or
kubectl rollout restart deployment/my-service
```

**Clear cache:**
```bash
redis-cli flushall
```

## 4. Alert Runbooks

### Alert: HighErrorRate
- **Description**: HTTP 5xx errors exceed 5% of traffic.
- **Impact**: Users cannot complete transactions.
- **Diagnosis Steps**:
  1. Check application logs for stack traces.
  2. Verify Database CPU/Connections are healthy.
- **Remediation**:
  - If tied to a recent deploy, initiate rollback immediately.
  - If DB is overwhelmed, increase connection pool or scale up DB instance.

### Alert: HighLatency
- **Description**: P95 latency > 2 seconds.
- **Impact**: Poor user experience, potential timeouts.
- **Diagnosis**: Check if a background job is blocking the event loop.

## 5. Escalation Contacts
1. Primary On-Call: `pagerduty-link`
2. Engineering Manager: `@slack-handle`
3. Platform Team: `#platform-support`
