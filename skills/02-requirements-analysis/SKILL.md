---
name: requirements-analysis
description: |-
  Use this skill after requirements have been gathered and need to be analyzed for completeness, consistency, feasibility, and testability. Activates after requirements-gathering or when the user asks to analyze, validate, or prioritize requirements. Teaches the agent to build traceability matrices, identify gaps and conflicts, validate acceptance criteria, and prepare requirements for architecture and implementation.
---

# Requirements Analysis

## Overview
Requirements analysis takes raw gathered requirements and refines them to ensure they are actionable, testable, and free of contradictions. This skill guides the agent through gap analysis, conflict resolution, traceability, and final validation before architecture and development begin.

## Analysis Checklist
Validate every requirement against these criteria:
- **Complete**: Is all necessary information present?
- **Consistent**: Does it contradict any other requirement?
- **Unambiguous**: Is there only one way to interpret it?
- **Testable**: Can we objectively verify it has been met?
- **Feasible**: Can it be implemented given time, budget, and tech constraints?
- **Necessary**: Does it trace back to a core business goal?

## Conflict Detection & Gap Analysis
1. **Categorize Requirements**: Group related requirements by feature or domain.
2. **Identify Conflicts**: Look for opposing constraints (e.g., "Must load in <100ms" vs. "Must encrypt payload with 4096-bit RSA").
3. **Identify Gaps**: Walk through user journeys to find missing steps (e.g., a way to create an item, but no way to delete or edit it).
4. **Resolve**: Propose compromises or escalate to stakeholders for resolution.

## Requirements Traceability Matrix (RTM)
The RTM ensures every requirement adds business value and every delivered feature satisfies a requirement. It links:
`Business Goal → Requirement → User Story → Test Case`
*Use the [RTM Template](./templates/requirements-traceability-matrix.md).*

## Validating Acceptance Criteria
Ensure Acceptance Criteria (AC) are rigorous. Use BDD/Gherkin format:
- **Given**: Initial context or state.
- **When**: Action or event.
- **Then**: Expected outcome.
*Use the [Acceptance Criteria Template](./templates/acceptance-criteria.md).*

## Validation and Sign-off
1. Review the refined requirements document with stakeholders.
2. Walk through complex edge cases.
3. Secure formal or informal sign-off before proceeding to Architecture phase.
