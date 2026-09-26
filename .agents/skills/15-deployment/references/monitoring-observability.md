# Monitoring & Observability

## The Three Pillars
1. **Metrics**: Quantitative data over time (e.g., CPU %, Request Rate). Good for alerting.
2. **Logs**: Immutable records of discrete events (e.g., Nginx access logs, app error logs). Good for debugging.
3. **Traces**: End-to-end request lifecycle across distributed systems. Good for finding bottlenecks.

## What to Monitor (The USE/RED Methods)
### RED (For Microservices/APIs)
- **Rate**: Requests per second.
- **Errors**: Number of failing requests (HTTP 5xx).
- **Duration**: How long requests take (P90, P95, P99 latency).

### USE (For Infrastructure)
- **Utilization**: % of resource used.
- **Saturation**: How much extra work is queued (e.g., thread pool queue).
- **Errors**: Hardware/system level errors.

## Alerting Thresholds
Don't alert on CPU > 80%. Alert on user-facing pain.
- ✅ Alert: "API Error Rate > 5% for 5 minutes"
- ✅ Alert: "P99 Latency > 1000ms for 10 minutes"
- ❌ Alert: "Memory usage high" (Unless it causes OOM kills)

## SLOs vs SLAs
- **SLA (Service Level Agreement)**: The promise to the customer (e.g., 99.9% uptime). If breached, you owe them money.
- **SLO (Service Level Objective)**: The internal target (e.g., 99.95% uptime). Tighter than SLA. Alerts fire when SLO error budgets are burning.
