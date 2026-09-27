# Post-Mortem Template

> **Purpose**: Document production incidents thoroughly and extract systemic improvements. Post-mortems are blameless — the goal is to understand what happened, why, and how to prevent recurrence.
>
> **When to use**: For every P1 and P2 production incident. Strongly recommended for P3 incidents with significant customer impact or novel failure modes.
>
> **Timing**: Draft should be started within 24 hours of incident resolution. Final version should be published within 72 hours.
>
> **Culture**: This document is a learning artifact. No individual is blamed. Systems and processes are examined. Action items are assigned to improve the system.

---

## Post-Mortem Header

```
Incident ID:         INC-[YYYY-MM-DD]-[NNN]
Severity:            [P1 / P2 / P3 / P4]
Title:               [One-sentence description of the incident]
Status:              [In Progress / Under Review / Final]
Date of Incident:    [YYYY-MM-DD]
Time of Incident:    [HH:MM TZ] – [HH:MM TZ] (duration: [N hours N minutes])
Date of Post-Mortem: [YYYY-MM-DD]
Author(s):           [Names of people who wrote this document]
Reviewers:           [Names of reviewers]
Systems Affected:    [List of affected services, databases, integrations]
Customer Impact:     [Number of affected users / percentage of traffic / features degraded]
```

---

## 1. Incident Summary

> *Write a 3-5 sentence executive summary of the incident. Someone who wasn't involved should be able to understand what happened, the impact, and the resolution by reading this section alone. Avoid technical jargon here.*

**[Write the executive summary here]**

Example:
> On [date] at [time], [service name] experienced a complete outage lasting [duration] that prevented [N%] of users from [performing action]. The root cause was [brief root cause]. The incident was resolved by [brief resolution]. As a result, [N users / N requests] were affected. This post-mortem documents the timeline, root cause, impact, and the action items we are taking to prevent recurrence.

---

## 2. Timeline

> *A precise, chronological record of events. Times must be accurate — pull from logs, alerting systems, and Slack/communication threads. Use the timezone consistently (UTC preferred). Include detection, escalation, investigation, mitigation, and resolution events. More detail is better.*

| Time (UTC) | Event | Actor |
|------------|-------|-------|
| `HH:MM` | [First symptom observed / alert fired] | [System / Person] |
| `HH:MM` | [Incident acknowledged by on-call] | [Name] |
| `HH:MM` | [Incident severity declared as P[N]] | [Name] |
| `HH:MM` | [Incident channel opened / team assembled] | [Name] |
| `HH:MM` | [Initial hypothesis formed: ...] | [Name] |
| `HH:MM` | [Investigation action taken: ...] | [Name] |
| `HH:MM` | [Finding: ...] | [Name] |
| `HH:MM` | [Mitigation attempt started: ...] | [Name] |
| `HH:MM` | [Mitigation outcome: succeeded / failed, reason] | [Name] |
| `HH:MM` | [Rollback initiated / alternative mitigation started] | [Name] |
| `HH:MM` | [Service restored / degraded mode activated] | [System / Name] |
| `HH:MM` | [Full recovery confirmed] | [Name] |
| `HH:MM` | [Incident declared resolved] | [Name] |
| `HH:MM` | [Post-mortem process initiated] | [Name] |

**Timeline Notes**:
- [Add any context about gaps in the timeline — periods with no log data, times when communication broke down, etc.]

---

## 3. Root Cause Analysis

> *Identify the true root cause(s) — not the symptom. Use the "5 Whys" technique: ask "why did this happen?" five times to get from the symptom to the underlying systemic cause.*

### 3.1 What Failed?

**[Describe the technical failure — what component, system, or process broke?]**

### 3.2 Why Did It Fail? (5 Whys Analysis)

| # | Why? | Answer |
|---|------|--------|
| Why 1 | Why did the service go down? | [Answer] |
| Why 2 | Why did [Why 1 answer] happen? | [Answer] |
| Why 3 | Why did [Why 2 answer] happen? | [Answer] |
| Why 4 | Why did [Why 3 answer] happen? | [Answer] |
| Why 5 | Why did [Why 4 answer] happen? | [Answer — this is usually the root cause] |

### 3.3 Root Cause Statement

> *State the root cause in one clear, specific sentence. The root cause should be a systemic factor — a missing safeguard, a process gap, an untested assumption — not a person's mistake.*

**Root Cause**: `[One clear sentence describing the fundamental root cause]`

### 3.4 Contributing Factors

> *List other factors that, while not the root cause, made the incident worse or harder to detect/resolve.*

- [ ] **Contributing Factor 1**: [Description]
- [ ] **Contributing Factor 2**: [Description]
- [ ] **Contributing Factor 3**: [Description]

### 3.5 Was This a Known Risk?

- [ ] **Yes** — This risk was previously identified in: `[link to ADR, issue, previous post-mortem, or runbook]`
  - Why was it not addressed? [Reason]
- [ ] **No** — This failure mode was not previously identified
  - Why not? What monitoring/testing gap allowed it to exist undetected?
- [ ] **Partially** — [Explain]

---

## 4. Impact Assessment

> *Quantify the impact precisely. Vague impact statements ("many users were affected") are not acceptable.*

### 4.1 User Impact

| Metric | Value |
|--------|-------|
| Total users affected | [N users / N% of user base] |
| Duration of impact | [N hours N minutes] |
| Features unavailable | [List affected features] |
| Requests failed | [N requests / N% of traffic] |
| Data loss or corruption | [Yes / No — if yes, describe] |
| SLA breach | [Yes / No — if yes, describe the breach] |

### 4.2 Business Impact

| Metric | Value |
|--------|-------|
| Revenue impact (if quantifiable) | [$N / [estimate methodology]] |
| Support ticket volume increase | [N additional tickets during incident] |
| Customer communications required | [Yes / No — if yes, describe] |
| SLA credits triggered | [Yes / No — if yes, describe] |
| Regulatory or compliance impact | [Yes / No — if yes, describe] |

### 4.3 System Impact

| System | Impact |
|--------|--------|
| [Service name] | [Down / Degraded / Elevated latency / Unaffected] |
| [Database name] | [Down / Read-only / Elevated latency / Unaffected] |
| [Integration name] | [Disrupted / Unaffected] |

### 4.4 Severity Justification

**Why this was classified as P[severity]**:
- [Explain why the severity level was correct — or if it was initially miscategorized, explain why]

---

## 5. What Went Well

> *Identify practices, processes, and systems that worked as intended and helped contain or resolve the incident faster. This section is as important as "What Went Wrong" — it tells us what to preserve and reinforce.*

- **[Item 1]**: [Description of what worked well and why it mattered]
  - Example: "Alerting fired within 2 minutes of the first error — enabling a fast response before customer impact was significant."
- **[Item 2]**: [Description]
- **[Item 3]**: [Description]
- **[Item 4]**: [Description]
- **[Item 5]**: [Description]

---

## 6. What Went Wrong

> *Identify failures in process, tooling, communication, or monitoring — not individual mistakes. This section drives the action items.*

- **[Item 1]**: [Description of what failed and its impact on the incident]
  - Example: "The database connection pool exhaustion alert had a 10-minute delay, extending time-to-detection by 8 minutes."
- **[Item 2]**: [Description]
- **[Item 3]**: [Description]
- **[Item 4]**: [Description]
- **[Item 5]**: [Description]

---

## 7. Action Items

> *Specific, concrete, assigned, time-bound actions that will prevent this class of incident from recurring or reduce its impact. Every action item must have a GitHub Issue.*

### Priority Key
- 🔴 **Critical** — Must be done before the next deployment to any production system
- 🟠 **High** — Must be done within 1 sprint (1-2 weeks)
- 🟡 **Medium** — Must be done within 1 month
- 🟢 **Low** — Should be done within the quarter; acceptable to schedule in backlog

| Priority | Action Item | Owner | Due Date | GitHub Issue |
|----------|-------------|-------|----------|--------------|
| 🔴 Critical | [Specific action: e.g., "Add circuit breaker to payment service client"] | [Name] | [YYYY-MM-DD] | #[N] |
| 🟠 High | [Specific action: e.g., "Reduce alert threshold for DB connection pool to 80%"] | [Name] | [YYYY-MM-DD] | #[N] |
| 🟠 High | [Specific action: e.g., "Add integration test for payment gateway timeout handling"] | [Name] | [YYYY-MM-DD] | #[N] |
| 🟡 Medium | [Specific action: e.g., "Create runbook for payment service degradation scenarios"] | [Name] | [YYYY-MM-DD] | #[N] |
| 🟡 Medium | [Specific action: e.g., "Conduct quarterly chaos engineering exercise on payment service"] | [Name] | [YYYY-MM-DD] | #[N] |
| 🟢 Low | [Specific action: e.g., "Evaluate adopting a service mesh for better circuit breaking"] | [Name] | [YYYY-MM-DD] | #[N] |

### Action Item Quality Standards
Each action item must be:
- **Specific**: Describes exactly what will be done (not "improve monitoring" but "add alert for DB connection pool >80%")
- **Assigned**: One named owner (not "the team")
- **Time-bound**: Has a concrete due date
- **Tracked**: Has a GitHub Issue that will be added to the project board

---

## 8. Prevention Measures

> *Beyond the immediate action items, describe the systemic improvements that will make the system more resilient to this class of failure — and to adjacent failures we haven't encountered yet.*

### 8.1 Detection Improvements

*How will we detect this class of failure faster in the future?*

- [ ] **[Monitoring improvement]**: [Describe the new or improved alert/dashboard/metric]
  - Expected benefit: Reduces time-to-detection from [N minutes] to [N minutes]
- [ ] **[Synthetic monitoring]**: [Describe any synthetic tests or canary checks that will catch this earlier]
- [ ] **[Log improvements]**: [Describe any logging changes that will make investigation faster]

### 8.2 Response Improvements

*How will we respond to this class of failure faster and more effectively?*

- [ ] **[Runbook created/updated]**: `docs/runbooks/[runbook-name].md` — Covers [scenario]
- [ ] **[Automated response]**: [Describe any auto-remediation that will be implemented]
- [ ] **[On-call training]**: [Describe any drills or training that will be conducted]
- [ ] **[Communication improvements]**: [How will incident communication be improved?]

### 8.3 Prevention Improvements

*How will we prevent this failure mode from occurring in the first place?*

- [ ] **[Testing improvement]**: [What tests will be added to catch this class of bug before production?]
- [ ] **[Code change]**: [What defensive code changes will prevent this failure?]
- [ ] **[Architecture change]**: [What architectural improvements will make the system more resilient?]
- [ ] **[Process change]**: [What process or checklist change will prevent this category of deployment error?]
- [ ] **[Dependency change]**: [Are there library/infrastructure changes that reduce this risk?]

### 8.4 Resilience Improvements

*How will we make the system more tolerant of this class of failure when it does occur?*

- [ ] **[Graceful degradation]**: [How will the system behave when this component fails next time?]
- [ ] **[Circuit breaker]**: [Will a circuit breaker prevent cascading failures?]
- [ ] **[Retry with backoff]**: [Will improved retry logic reduce the blast radius?]
- [ ] **[Bulkhead pattern]**: [Will isolation between components limit the impact?]
- [ ] **[Redundancy]**: [Will adding redundancy eliminate the single point of failure?]

---

## 9. Lessons Learned

> *A concise summary of the key insights from this incident — for your team and for future teams who may read this post-mortem.*

1. **[Lesson 1]**: [Description]
2. **[Lesson 2]**: [Description]
3. **[Lesson 3]**: [Description]

---

## 10. Communication Log

> *Record all external communications made during or about the incident. This section ensures accountability and provides a reference for future communications.*

| Timestamp (UTC) | Channel | Audience | Message Summary | Sent By |
|-----------------|---------|----------|-----------------|---------|
| `HH:MM` | [Slack #incidents / Email / Status page] | [Internal / External customers / All users] | [Summary] | [Name] |
| `HH:MM` | Status page update | External users | [Summary of status page message] | [Name] |
| `HH:MM` | Incident resolved notification | [Audience] | [Summary] | [Name] |

---

## 11. References

> *Links to relevant resources for anyone investigating this incident or related issues in the future.*

- **Incident channel**: `[Link to Slack thread or incident channel]`
- **Primary alert that fired**: `[Link to alert in monitoring tool]`
- **Dashboard during incident**: `[Link to dashboard snapshot]`
- **Relevant logs**: `[Link to log search query]`
- **Related GitHub Issues**: `[Links]`
- **Related post-mortems**: `[Links to similar past incidents]`
- **Runbook referenced**: `[Link to runbook, if one was used]`
- **Architecture diagram**: `[Link to relevant architecture diagram]`

---

## Sign-Off

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Author | [Name] | [Signed / Reviewed] | [YYYY-MM-DD] |
| Reviewer | [Name] | [Signed / Reviewed] | [YYYY-MM-DD] |
| Engineering Lead | [Name] | [Signed / Reviewed] | [YYYY-MM-DD] |

> **Final post-mortem should be:**
> - Shared with the broader engineering team
> - Stored in `docs/post-mortems/INC-[YYYY-MM-DD]-[NNN].md`
> - Linked from the incident GitHub Issue
> - Referenced in the CHANGELOG if the incident led to a user-visible fix

---

*Template version: 1.0 | Part of Agent SDLC Brain*
