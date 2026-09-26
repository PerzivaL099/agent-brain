# AGENTS.md — Agent Decision-Making Rules

> **This file defines the agent's decision tree for every SDLC scenario. Read this file to determine which skills to activate, in what order, and under what conditions. These rules are mandatory — they are not optional enhancements.**

---

## Decision Framework

Before taking any significant action, the agent must answer three questions:

1. **What stage of the SDLC is this task in?** (Define / Build / Ship / Sustain)
2. **Which skill(s) are required for this stage?**
3. **Have all preconditions for this stage been met?**

If preconditions are not met, **do not proceed** — surface the gap and resolve it first.

---

## Scenario: Starting a New Project

**Trigger**: User requests a new project, application, service, or system be created.

**Mandatory activation sequence** (in order, do not skip steps):

```
Step 1 → Skill 01: Requirements Gathering
         ├─ Conduct stakeholder analysis
         ├─ Elicit functional and non-functional requirements
         ├─ Write user stories with acceptance criteria
         ├─ Apply MoSCoW prioritization
         └─ Produce: requirements document, user story backlog

Step 2 → Skill 02: Architecture Design
         ├─ Evaluate technology options against requirements
         ├─ Design system architecture (components, boundaries, data flow)
         ├─ Document decisions as ADRs
         ├─ Define API contracts and data schemas
         └─ Produce: architecture diagram, ADR set, API spec

Step 3 → Skill 03: Project Planning
         ├─ Break requirements into GitHub Issues
         ├─ Group Issues into milestones
         ├─ Estimate and prioritize issues
         └─ Produce: GitHub Issues backlog, milestone plan

Step 4 → Skill 04: GitHub Setup
         ├─ Create/configure repository
         ├─ Set up branch protection rules
         ├─ Configure labels, issue templates, PR templates
         ├─ Create GitHub Projects board with columns
         └─ Produce: configured repo ready for development

Step 5 → Checklist: new-project-kickoff.md
         └─ Run through every item before writing any production code
```

**Precondition to step 1**: User has articulated the problem domain or goal, even roughly.
**Exit condition**: All 5 steps complete, new-project-kickoff.md checklist fully checked.

---

## Scenario: Implementing a New Feature

**Trigger**: User requests a new capability be added to an existing or new project.

**Mandatory activation sequence**:

```
Step 1 → Create GitHub Issue
         ├─ Use the feature request issue template
         ├─ Fill in: description, motivation, acceptance criteria, size label, priority label
         ├─ Link to relevant milestone on GitHub Projects board
         └─ Note the issue number: #<N>

Step 2 → Skill 05: Implementation Planning
         ├─ Design the implementation approach (before writing code)
         ├─ Identify files/modules to create or modify
         ├─ Identify potential risks and edge cases
         ├─ Plan the test strategy for this feature
         └─ Produce: implementation plan (can be a comment on the GitHub Issue)

Step 3 → Skill 08: Git Workflow (Branch Creation)
         ├─ Create branch: feat/<issue-number>-<short-description>
         └─ Confirm branch is based on the correct base branch

Step 4 → Skill 06: Code Implementation
         ├─ Implement code following the implementation plan
         ├─ Follow existing code patterns and conventions
         ├─ Write clean, well-commented code
         └─ Commit atomically using Conventional Commits

Step 5 → Skill 07: Test Strategy
         ├─ Write unit tests for all new business logic
         ├─ Write integration tests for component boundaries
         ├─ Add end-to-end test if feature touches critical user path
         └─ Confirm all tests pass locally

Step 6 → Checklist: feature-lifecycle.md
         └─ Run through the feature lifecycle checklist before opening PR

Step 7 → Checklist: pre-merge-checklist.md
         └─ Run through the pre-merge checklist before creating PR

Step 8 → Skill 08: Git Workflow (PR Creation)
         ├─ Create pull request using PR template
         ├─ Title follows Conventional Commits format
         ├─ Body references: Closes #<N>
         └─ Assign reviewers, add labels

Step 9 → Skill 09: Code Review
         └─ Address all review feedback before merging
```

**Precondition to step 1**: Feature requirements are understood and documented (or derivable from existing requirements docs).
**Exit condition**: PR merged, GitHub Issue closed, feature deployed and verified.

---

## Scenario: Fixing a Bug

**Trigger**: A bug is reported or discovered.

**Mandatory activation sequence**:

```
Step 1 → Create GitHub Issue
         ├─ Use the bug report issue template
         ├─ Fill in: description, steps to reproduce, expected vs actual behavior
         ├─ Add labels: type: bug, priority: <assessed priority>
         └─ Note the issue number: #<N>

Step 2 → Root Cause Analysis
         ├─ Reproduce the bug before writing any fix
         ├─ Identify the root cause (not just the symptom)
         └─ Document findings as a comment on the GitHub Issue

Step 3 → Write a Failing Test First
         ├─ Write a test that reproduces the bug
         ├─ Confirm the test fails before the fix
         └─ This test becomes the regression test

Step 4 → Skill 08: Git Workflow (Branch Creation)
         └─ Create branch: fix/<issue-number>-<short-description>

Step 5 → Skill 06: Code Implementation (Fix)
         ├─ Implement the minimal fix for the root cause
         ├─ Do not refactor or add features in the same PR
         └─ Confirm the regression test now passes

Step 6 → Checklist: pre-merge-checklist.md
         └─ Run through pre-merge checklist

Step 7 → Skill 08: Git Workflow (PR Creation)
         ├─ PR title: fix(<scope>): <description>
         └─ Body: Closes #<N>, description of root cause and fix
```

**Precondition**: Bug is reproducible, or can be analyzed from logs/error reports.
**Exit condition**: Regression test passing, PR merged, issue closed, deploy verified.

---

## Scenario: Writing Tests

**Trigger**: Tests need to be written for existing code, or test coverage is being improved.

**Mandatory activation sequence**:

```
Step 1 → Skill 07: Test Strategy
         ├─ Review the code under test
         ├─ Determine appropriate test levels: unit / integration / e2e
         ├─ Identify the test pyramid balance for this codebase
         └─ Plan test cases: happy path, edge cases, error cases

Step 2 → Write Tests
         ├─ Unit tests: test one unit in isolation, mock all dependencies
         ├─ Integration tests: test real interactions between components
         ├─ E2E tests: test from the user's perspective, minimize mocking
         └─ Each test must: Arrange, Act, Assert (AAA pattern)

Step 3 → Validate Coverage
         ├─ Run coverage report
         ├─ Ensure critical paths have ≥80% coverage
         └─ Document any intentionally untested areas with justification
```

**Key rule**: Never write tests that only test framework code or obvious getters/setters. Test behavior, not implementation.

---

## Scenario: Creating a Pull Request

**Trigger**: Code changes are ready to be submitted for review.

**Mandatory sequence**:

```
Step 1 → Checklist: pre-merge-checklist.md
         └─ Every item must be checked before creating the PR

Step 2 → Skill 08: Git Workflow
         ├─ Ensure branch is rebased/merged with base branch
         ├─ Squash WIP commits into logical, atomic commits
         └─ Each commit follows Conventional Commits

Step 3 → Create PR
         ├─ Use PR template (never submit a blank PR description)
         ├─ Title: <type>(<scope>): <description>
         ├─ Body includes: what changed, why, how to test, screenshots (if UI)
         ├─ References: Closes #<issue-number>
         └─ All CI checks must pass

Step 4 → Skill 09: Code Review
         └─ Respond to all review comments before merging
```

**Non-negotiable**: A PR with failing CI checks must not be merged. Fix the failures first.

---

## Scenario: Deploying to Production

**Trigger**: Code is approved and ready to deploy to production.

**Mandatory sequence**:

```
Step 1 → Checklist: pre-deployment-checklist.md
         └─ Every item must be verified before initiating deployment

Step 2 → Skill 11: Deployment
         ├─ Follow the deployment runbook for this environment
         ├─ Coordinate deployment window with stakeholders
         └─ Confirm rollback procedure is ready before deploying

Step 3 → Post-Deployment Verification
         ├─ Run smoke tests against production
         ├─ Verify health checks are green
         ├─ Monitor error rates and latency for 15–30 minutes post-deploy
         └─ Confirm monitoring/alerting is active

Step 4 → Close the Loop
         ├─ Update GitHub Issue with deployment confirmation
         ├─ Update CHANGELOG
         └─ Notify stakeholders of successful deployment
```

**Rollback trigger**: If any smoke test fails or error rate increases by >10% post-deploy, initiate rollback **immediately** — do not debug in production during the rollback window.

---

## Scenario: Production Incident

**Trigger**: An alert fires, a user reports an outage, or anomalous behavior is detected in production.

**Mandatory sequence**:

```
Step 1 → Skill 13: Incident Response
         ├─ Declare incident severity (P1/P2/P3/P4)
         ├─ Assign incident commander
         ├─ Open incident channel/thread
         └─ Begin mitigation (restore service before root cause analysis)

Step 2 → Mitigation
         ├─ Prioritize restoring service over finding root cause
         ├─ Consider rollback as first-line mitigation
         └─ Document all actions taken with timestamps

Step 3 → Root Cause Analysis
         └─ After service is restored, investigate root cause

Step 4 → Post-Mortem (P1/P2 incidents)
         ├─ Use: checklists/post-mortem-template.md
         ├─ Must be completed within 48-72 hours of incident resolution
         └─ Action items tracked as GitHub Issues
```

**Culture note**: Post-mortems are blameless. The goal is systemic improvement, not individual blame.

---

## Scenario: Technical Debt / Refactoring

**Trigger**: Code quality issue, architectural smell, or debt item is identified.

**Mandatory sequence**:

```
Step 1 → Create GitHub Issue
         ├─ Label: type: refactor or type: chore
         ├─ Document: what the debt is, why it's a problem, proposed fix
         └─ Link to affected code files/lines

Step 2 → Skill 15: Refactoring
         ├─ Ensure test coverage exists before refactoring
         ├─ Refactor in small, safe steps
         ├─ Do not mix refactoring with feature work in the same PR
         └─ Run full test suite after each step
```

---

## Scenario: Dependency Updates

**Trigger**: Security advisory, dependency audit, or scheduled update cycle.

**Mandatory sequence**:

```
Step 1 → Skill 16: Dependency Management
         ├─ Audit current dependencies for vulnerabilities
         ├─ Identify outdated major/minor/patch versions
         └─ Prioritize: security patches > breaking updates > minor updates

Step 2 → Update Process
         ├─ Update one dependency (or group) per PR
         ├─ Run full test suite after each update
         ├─ Check for breaking changes in changelogs
         └─ Document any breaking changes in the PR description
```

---

## File Creation Rules

When creating any new file as part of a skill:

1. **Check the skill's `templates/` folder first** — always scaffold from the existing template, never from scratch
2. **Replace all `[BRACKET_PLACEHOLDERS]`** — never leave template placeholders in committed files
3. **Follow naming conventions** established in the skill's `SKILL.md`
4. **Add the file to the appropriate directory** — don't put things in the project root unless the template specifies it

---

## Escalation Matrix

| Situation | Action |
|-----------|--------|
| Requirements are clear and complete | Act immediately, follow skill sequence |
| Requirements are slightly ambiguous | Make a reasonable assumption, document it, flag in PR |
| Requirements are significantly ambiguous | **Ask before acting** |
| Changing public API contracts | **Ask before acting** |
| Deleting data or schemas | **Ask before acting** — always |
| Security vulnerability discovered | **Surface immediately** — block all other work |
| Skipping a checklist item | **Ask for justification** — document the exception if approved |
| Conflicting requirements discovered | **Ask** — do not resolve silently |
| Architecture decision not covered by existing ADRs | **Ask or propose new ADR** before implementing |

---

## The Prime Directive

> **When in doubt, do less and communicate more.**
>
> It is always better to ask a clarifying question than to build the wrong thing. It is always better to surface a risk than to ignore it. It is always better to follow the process than to shortcut it.
>
> Process exists because the consequences of skipping it are real: bugs, outages, security incidents, wasted effort, and eroded trust. The checklists are not bureaucracy — they are the accumulated wisdom of engineers who learned the hard way.
